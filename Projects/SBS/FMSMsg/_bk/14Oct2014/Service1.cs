using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.ServiceModel;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Xml.Linq;
using WlocateMsg.Properties;
using WlocateMsg.Wlocate;
using Microsoft.Win32;

namespace WlocateMsg
{
    /// <summary>
    /// messaging windows service
    /// </summary>
    partial class Service1 : ServiceBase
    {
        //private AutoResetEvent evtAuto = new AutoResetEvent(false);
        private Timer tmrStatus = null;
        private Modem m_smsModem = null;
        private DateTime m_dtLastRestart = DateTime.Now;
        private string m_strMap = "";
        private string m_strMapFleet = "";
        private string m_strMapFind = "";
        private string m_strEmail = "";
        private string m_strError = "";
        private int m_iMesssageID = 0;
        private int m_iMsgFleetID = 0;
        public int m_iReadIndex = 0;
        private bool m_bRestart = false;

        private string m_strMapGB = "";
        private string m_strGBEmail = "";

        /// <summary>
        /// class constructor
        /// </summary>
        public Service1()
        {
            // initialize class
            InitializeComponent();
        }

        /// <summary>
        /// event called on start of service
        /// </summary>
        /// <param name="args"></param>
        protected override void OnStart(string[] args)
        {
            // start service
            RunService();
        }

        /// <summary>
        /// starts the service
        /// </summary>
        public void RunService()
        {
            // log service start
            string msg = string.Format("{0} messaging service started.", Settings.Default.ProjectName);
            LogEvent(msg, false);

            try
            {
                m_smsModem = new Modem(this);

                //[Dan:25Jun14] Implement testing base on config setting
                if (Settings.Default.IsSMS) SendSMS("+6594388982", msg);//Testing [Dan:20Feb14]
                else TestEmail();//testing
                //

                //LogEvent(string.Format("Initializing..."), false);//Testing[Dan:20Feb14]

                // initialize settings
                WlocateClient svcTrack = new WlocateClient("TrackEndpoint");//Made service to close immediately[Dan:19Feb14]
                m_strMap = svcTrack.GetAppKey("MapPath");
                m_strEmail = svcTrack.GetAppKey("AdminEmail");
                svcTrack.Close();

                ////[Dan:13Oct14] Temp disable dual endpoint
                //// initialize find/fleet settings [dan:07Nov12]
                //WlocateClient svcFleet = new WlocateClient("FleetEndpoint");//Made service to close immediately[Dan:19Feb14]
                //m_strMapFleet = svcFleet.GetAppKey("MapPath");
                //svcFleet.Close();

                m_strMapFind = m_strMap;
                
                //LogEvent(string.Format("Initialized!"), false);//Testing[Dan:20Feb14]

                // start checking messages
                // [Dan:20Feb14] Reimplement the timer
                //Soure: http://stackoverflow.com/questions/12796148/working-with-system-threading-timer-in-c-sharp
                //tmrStatus = new System.Threading.Timer(this.CheckMessages, evtAuto, 5000, 10000);
                tmrStatus = new System.Threading.Timer(this.CheckMessages, null, 0, Timeout.Infinite);

                //evtAuto.Set();
            }
            catch(Exception ex)
            {
                LogEvent(string.Format("RunService>>{0}", ex.Message), true);//Testing[Dan:20Feb14]
                // reset wcf session on error
                //CheckService();
                
                //[Dan:20Feb14] try to re-run the timer thread
                tmrStatus.Change(5000, Timeout.Infinite);
                
            }
        }

        private static void TestEmail()
        {
            try
            {
                MailMessage eMail = new MailMessage();
                eMail.From = new MailAddress("noreply@w-locate.com", "FIND");
                eMail.To.Add(new MailAddress("dante.ricafort@w-locate.com"));
                eMail.To.Add(new MailAddress("wlocate888@gmail.com"));

                // set email content
                eMail.Subject = "FIND-Email Test";
                eMail.Body = "Test For FIND Email Alert";

                // send email
                SmtpClient smtp = new SmtpClient("mail.w-locate.com", 587);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("noreply@w-locate.com", "wlocate888");
                smtp.EnableSsl = false;
                smtp.Send(eMail);
                //587
                LogEvent(String.Format("{0}", "Email Sent"), false);
                //MessageBox.Show("Email Sent");
            }
            catch (Exception ex)
            {
                LogEvent(String.Format("{0}-{1}", "Test Email Error", ex.Message), true);
                //MessageBox.Show(ex.Message);
                //MessageBox.Show(ex.InnerException.Message.ToString());
            }
        }

        /// <summary>
        /// [Dan:20Feb14] Sends SMS to single recipient
        /// </summary>
        /// <param name="phoneNo"></param>
        /// <param name="msg"></param>
        private void SendSMS(string phoneNo, string msg)
        {
            // open modem for sms
            if (m_smsModem.DoConnect(true))
            {
                // send sms
                m_smsModem.SendSms(phoneNo, msg);
            }
            // close modem
            m_smsModem.DoConnect(false);
        }

        /// <summary>
        /// periodically checks all assets' status
        /// </summary>
        /// <param name="stateInfo"></param>
        public void CheckMessages(Object stateInfo)
        {
            
            //// stop timer
            //evtAuto.WaitOne();
            //evtAuto.Reset();
            try
            {
                bool isEmail = Settings.Default.IsEmail;
                bool isSMS = Settings.Default.IsSMS;

                //LogEvent(String.Format("CheckMessages-started..."), false);

                WlocateClient svcTrack = new WlocateClient("TrackEndpoint");
                WlocateClient svcFleet = new WlocateClient("FleetEndpoint");

                Stopwatch watch = new Stopwatch();

                watch.Start();

                #region Auto-restart WlocateWin -- uncomment to use instead of windows task scheduler
                /*
                // check restart interval
                if (Settings.Default.RestartInterval > 0)
                {
                    // check pending restart
                    TimeSpan tsDiff = DateTime.Now - m_dtLastRestart;
                    if ((tsDiff.TotalMinutes >= Settings.Default.RestartInterval) || m_bRestart)
                    {
                        // restart FIND
                        m_dtLastRestart = DateTime.Now;
                        //m_bRestart = !RestartService("FindWinService", 10000);
                        m_bRestart = !RestartService("WlocateWin", 10000);
                        
                    }
                }
                */
                #endregion

                
                //LogEvent(String.Format("m_iReadIndex:{0}", m_iReadIndex), false);

                // read sms requests
                if (m_iReadIndex > -1) 
                {
                    // read sms requests
                    if (isSMS)//[Dan:07May14] Execute only if SMS Flag is True
                    {
                        CheckSms(m_iReadIndex);
                        m_iReadIndex = -1;
                    }
                }

                //LogEvent(String.Format("Getting Messages..."), false);

                // get pending messages
                svcTrack = new WlocateClient("TrackEndpoint");
                List<MessageInfo> arrMessages = svcTrack.GetMessagesEx(m_iMesssageID);
                svcTrack.Close();

                ////[Dan:04May2013] Log Message Count
                //LogEvent(String.Format("CheckMessages(Track) - Total:{0}", arrMessages.Count), false);

                // get pending messages
                svcFleet = new WlocateClient("FleetEndpoint");
                List<MessageInfo> arrMsgFleet = svcFleet.GetMessagesEx(m_iMesssageID);
                svcFleet.Close();
                                
                string strMessageIds = "";
                string strMsgFleetIds = "";
                string strMsgGBIds = "";

                ////[Dan:04May2013] Log Message Count
                //LogEvent(String.Format("CheckMessages(Fleet) - Total:{0}", arrMsgFleet.Count), false);

                if(isEmail)
                    SendAllEmail(arrMessages, arrMsgFleet, ref strMessageIds, ref strMsgFleetIds);

                if(isSMS)
                    SendAllSMS(arrMessages, arrMsgFleet, ref strMessageIds, ref strMsgFleetIds);

                ////[Dan:04May2013] Log Message Count
                //LogEvent(String.Format("All Messages are processed...", arrMsgFleet.Count), false);

                // flag sent messages
                if (strMessageIds != "")
                {
                    svcTrack = new WlocateClient("TrackEndpoint");
                    svcTrack.FlagMessages(strMessageIds.Trim(",".ToCharArray()));
                    svcTrack.Close();
                }

                // flag sent messages
                if (strMsgFleetIds != "")
                {
                    svcFleet = new WlocateClient("FleetEndpoint");
                    svcFleet.FlagMessages(strMsgFleetIds.Trim(",".ToCharArray()));
                    svcFleet.Close();
                }
                
                watch.Stop();
                //LogEvent(String.Format("Elapsed (Check/Send SMS) Time: {0}", watch.ElapsedMilliseconds), false);
            }
            catch (Exception e)
            {
                // check if new error
                if (m_strError != e.Message)
                {
                    // log error
                    m_strError = e.Message;
                    LogEvent(String.Format("CheckMessages - {0}", e.Message), true);
                }
                LogEvent(String.Format("CheckMessages - {0}", e.Message), true);
            }

            //// restart timer
            //evtAuto.Set();
            tmrStatus.Change(5000, Timeout.Infinite);
        }

        private void SendAllSMS(List<MessageInfo> arrMessages, List<MessageInfo> arrMsgFleet, ref string strMessageIds, ref string strMsgFleetIds)
        {
            // open modem for sms
            if (m_smsModem.DoConnect(true))
            {
                // loop through messages
                foreach (MessageInfo udtMessage in arrMessages)
                {
                    // check if sms
                    if (!udtMessage.Recipients.Contains("@"))
                    {
                        // send sms
                        if (m_smsModem.SendSms(udtMessage.Recipients, udtMessage.Message))
                            strMessageIds += String.Format("{0},", udtMessage.MessageID);
                    }
                }

                // loop through messages
                foreach (MessageInfo udtMessage in arrMsgFleet)
                {
                    // check if sms
                    if (!udtMessage.Recipients.Contains("@"))
                    {
                        // send sms
                        if (m_smsModem.SendSms(udtMessage.Recipients, udtMessage.Message))
                            strMsgFleetIds += String.Format("{0},", udtMessage.MessageID);
                    }
                }
            }
        }

        private void SendAllEmail(List<MessageInfo> arrMessages, List<MessageInfo> arrMsgFleet, ref string strMessageIds, ref string strMsgFleetIds)
        {
            // testing
            LogEvent(String.Format("About To Send: {0} Track Email", arrMessages.Count), false);

            // loop through messages
            foreach (MessageInfo udtMessage in arrMessages)
            {
                // check message id
                if (m_iMesssageID < udtMessage.MessageID)
                    m_iMesssageID = udtMessage.MessageID;

                // check if email
                //if (udtMessage.Recipients.Contains("@"))
                if (udtMessage.Recipients.Contains("@"))
                {
                    // send email
                    if (SendEmail(udtMessage))
                        strMessageIds += String.Format("{0},", udtMessage.MessageID);
                }
            }

            // testing
            LogEvent(String.Format("About To Send: {0} Fleet Email", arrMsgFleet.Count), false);

            // loop through messages
            foreach (MessageInfo udtMessage in arrMsgFleet)
            {
                // check message id
                if (m_iMsgFleetID < udtMessage.MessageID)
                    m_iMsgFleetID = udtMessage.MessageID;

                // check if email
                if (udtMessage.Recipients.Contains("@"))
                {
                    // send email
                    if (SendEmail(udtMessage))
                        strMsgFleetIds += String.Format("{0},", udtMessage.MessageID);
                }
            }
        }

        /// <summary>
        /// checks web service connection
        /// </summary>
        private void CheckService()
        {
            //[Dan:19Feb14] This code conflicts on the normal usage of Service client to always close after use
            //// close connection
            //if (m_svcClient.State == CommunicationState.Faulted)
            //    m_svcClient.Abort();

            //// check connection
            //if ((m_svcClient.State != CommunicationState.Opening) &&
            //    (m_svcClient.State != CommunicationState.Opened))
            //{
            //    // reopen connection
            //    m_svcClient = new WlocateClient("BasicHttpBinding_IWlocate");
            //    m_svcClient.Open();
            //}

            //// close connection
            //if (m_svcFleet.State == CommunicationState.Faulted)
            //    m_svcFleet.Abort();

            //// check connection
            //if ((m_svcFleet.State != CommunicationState.Opening) &&
            //    (m_svcFleet.State != CommunicationState.Opened))
            //{
            //    // reopen connection
            //    m_svcFleet = new WlocateClient("Fleet_Endpoint");
            //    m_svcFleet.Open();
            //}
        }

        /// <summary>
        /// restarts a windows service
        /// </summary>
        /// <param name="strService"></param>
        /// <param name="iTimeout"></param>
        public static bool RestartService(string strService, int iTimeout)
        {
            ServiceController ctlService = new ServiceController(strService);
            TimeSpan tsDiff = TimeSpan.FromMilliseconds(iTimeout);
            int iTick1 = Environment.TickCount;
            try
            {
                // stop service
                ctlService.Stop();
                ctlService.WaitForStatus(ServiceControllerStatus.Stopped, tsDiff);
            }
            catch { }
            try
            {
                // count the rest of the timeout
                int iTick2 = Environment.TickCount;
                tsDiff = TimeSpan.FromMilliseconds(iTimeout - (iTick2 - iTick1));

                // start service
                ctlService.Start();
                ctlService.WaitForStatus(ServiceControllerStatus.Running, tsDiff);
                return true;
            }
            catch (Exception e)
            {
                // log error
                LogEvent(String.Format("RestartService - {0}:{1}", e.Message, strService), true);
            }
            return false;
        }

        /// <summary>
        /// sets flag for modem sms inbox
        /// </summary>
        public void CheckSms(int iIndex)
        {
            try
            {
                // read sms requests
                WlocateClient svcTrack = new WlocateClient("TrackEndpoint");//Made service to close immediately[Dan:19Feb14]
                WlocateClient svcFleet = new WlocateClient("FleetEndpoint");//Made service to close immediately[Dan:19Feb14]
                
                // open modem for sms
                if (!m_smsModem.DoConnect(true))
                    return;

                LogEvent(string.Format("Reading SMS in Modem..."), false);//Testing[Dan:20Feb14]

                // check sms inbox (always list all for now)
                string[] arrTemp = m_smsModem.ReadSms(0).Split("\r".ToCharArray());
                if (arrTemp.Length > 1)
                {

                    LogEvent(string.Format("SMS in Modem: {0}", arrTemp.Length), false);//Testing[Dan:20Feb14]

                    // get all phone numbers of users and tags from Track
                    List<UserInfo> arrFINDUsers = svcTrack.GetUsers(1);
                    List<TagInfo> arrFINDTags = svcTrack.GetTags(1);
                    // get all phone numbers of users and tags from Fleet
                    List<UserInfo> arrFleetUsers = svcFleet.GetUsers(1);
                    List<TagInfo> arrFleetTags = svcFleet.GetTags(1);

                    //LogEvent(string.Format("arrFINDUsers: {0}\r\n arrFINDTags: {1}\r\n arrFleetUsers: {2}\r\n arrFleetTags: {3}", 
                    //    arrFINDUsers.Count, arrFINDTags.Count,
                    //    arrFleetUsers.Count, arrFleetTags.Count), false);//Testing[Dan:20Feb14]

                    // loop through messages
                    for (int i = 0; i < arrTemp.Length; i++)
                    {
                        // check sms prefix
                        string strTemp = arrTemp[i];

                        if (!strTemp.Contains("+CMGL:") && !strTemp.Contains("+CMGR:")) continue;
                        bool bAll = strTemp.Contains("+CMGL:");

                        // check field length
                        string[] arrData = strTemp.Substring(strTemp.IndexOf(":") + 1).Trim().Split(",".ToCharArray());
                        if (arrData.Length < 3)
                            continue;
                        try
                        {
                            // trim quotation marks
                            for (int j = 0; j < arrData.Length; j++)
                                arrData[j] = arrData[j].Trim("\"".ToCharArray());

                            // parse sms
                            string strMessage = "";
                            string strStatus = (bAll ? arrData[1] : arrData[0]);
                            string strPhone = (bAll ? arrData[2] : arrData[1]);
                            DateTime dtTimestamp = DateTime.Now;
                            try { dtTimestamp = Convert.ToDateTime(arrData[3]); }
                            catch { }

                            // check sender phone number and sms if new
                            if (strPhone.StartsWith("+65") && (strStatus != "REC READ"))
                            {
                                // check next line
                                if ((i + 1) >= arrTemp.Length)
                                    break;

                                // parse sms message
                                string strInbox = arrTemp[i + 1].Trim();

                                // check if sce tag message
                                if ((strInbox == "") && ((i + 2) < arrTemp.Length))
                                    strInbox = arrTemp[i + 2].Trim();

                                string[] arrParams = strInbox.ToLower().Split();

                                // initialize message
                                MessageInfo udtMessage = new MessageInfo();
                                udtMessage.Sender = "FIND";
                                udtMessage.Recipients = strPhone;
                                udtMessage.Timestamp = DateTime.Now.ToUniversalTime();
                                udtMessage.StatusID = 0;

                                // check if registered
                                List<UserInfo> arrFINDRegUsers = (from d in arrFINDUsers where d.Phone.Contains(strPhone) select d).ToList();
                                List<TagInfo> arrFINDRegTags = arrFINDTags.Where(x => x.Phone.Contains(strPhone.Replace("+65", ""))).ToList();
                                List<UserInfo> arrFleetRegUsers = (from d in arrFleetUsers where d.Phone.Contains(strPhone) select d).ToList();
                                List<TagInfo> arrFleetRegTags = arrFleetTags.Where(x => x.Phone.Contains(strPhone.Replace("+65", ""))).ToList();

                                // check if number is registered
                                if ((arrFINDRegUsers.Count <= 0) && (arrFINDRegTags.Count <= 0))
                                {
                                    // user is not registered
                                    strMessage = string.Format("Mobile number not registered. Please contact W-locate FIND technical support.({0})",
                                        "Track");
                                }
                                
                                if ((arrFleetRegUsers.Count <= 0) && (arrFleetRegTags.Count <= 0))
                                {
                                    if (!string.IsNullOrEmpty(strMessage))
                                    {
                                        // user is not registered
                                        strMessage = string.Format("Mobile number not registered. Please contact W-locate FIND technical support.({0})",
                                            "Track/Fleet");
                                    }
                                    else
                                    {
                                        // user is not registered
                                        strMessage = string.Format("Mobile number not registered. Please contact W-locate FIND technical support.({0})",
                                            "Fleet");
                                    }
                                }

                                //if mobile number not found, send to user
                                if(!string.IsNullOrEmpty(strMessage))
                                {
                                    if (m_smsModem.SendSms(strPhone, strMessage))
                                    {
                                        // save message
                                        udtMessage.Message = strMessage;
                                        svcFleet.SaveMessage(udtMessage);
                                    }
                                }
                                else
                                {
                                    SaveMessageToDB(svcTrack, svcFleet, ref strMessage, ref strStatus, strPhone, dtTimestamp, strInbox, arrParams, udtMessage, arrFINDRegUsers, arrFINDRegTags, arrFleetRegUsers, arrFleetRegTags);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            LogEvent(String.Format("CheckSms - {0}", ex.Message), true);
                        }

                        // delete sms
                        int iMsg = (bAll ? Convert.ToInt16(arrData[0]) : iIndex);
                        if (m_smsModem.DeleteSms(iMsg).Contains("ERR"))
                            m_smsModem.DeleteSms(iMsg);
                    }
                }

                svcFleet.Close();
                svcTrack.Close();
            }
            catch (Exception e)
            {
                // log error
                LogEvent(String.Format("CheckSms(Overall) - {0}", e.Message), true);
                //CheckService();
            }
        }

        private void SaveMessageToDB(WlocateClient svcTrack, WlocateClient svcFleet, ref string strMessage, ref string strStatus, string strPhone, DateTime dtTimestamp, string strInbox, string[] arrParams, MessageInfo udtMessage, List<UserInfo> arrFINDRegUsers, List<TagInfo> arrFINDRegTags, List<UserInfo> arrFleetRegUsers, List<TagInfo> arrFleetRegTags)
        {
            MessageInfo udtReceived = new MessageInfo();

            // check if message sender type
            if (arrFINDRegUsers.Count > 0)
            {
                // save FIND user sms                                         
                udtReceived.Sender = arrFINDRegUsers[0].Name;
                udtReceived.Recipients = "FIND-Track";
                udtReceived.Message = strInbox;
                udtReceived.Timestamp = dtTimestamp.ToUniversalTime();
                udtReceived.StatusID = -1;
                udtReceived.Company = arrFINDRegUsers[0].Company;
                udtReceived.AssetID = 0;
                svcTrack.SaveMessage(udtReceived);
            }
            else if (arrFINDRegTags.Count > 0)
            {
                // save FIND tag sms 
                udtReceived.Sender = arrFINDRegTags[0].Name;
                udtReceived.Recipients = "FIND-Track";
                udtReceived.Message = strInbox;
                udtReceived.Timestamp = dtTimestamp.ToUniversalTime();
                udtReceived.StatusID = -1;
                udtReceived.Company = arrFINDRegTags[0].Company;
                udtReceived.AssetID = 0;
                svcTrack.SaveMessage(udtReceived);
            }

            // there are chances that phone number can be in Track/Fleet
            if (arrFleetRegUsers.Count > 0)
            {
                // save FIND user sms                                         
                udtReceived.Sender = arrFleetRegUsers[0].Name;
                udtReceived.Recipients = "FIND-Fleet";
                udtReceived.Message = strInbox;
                udtReceived.Timestamp = dtTimestamp.ToUniversalTime();
                udtReceived.StatusID = -1;
                udtReceived.Company = arrFleetRegUsers[0].Company;
                udtReceived.AssetID = 0;
                svcFleet.SaveMessage(udtReceived);
            }
            else if (arrFleetRegTags.Count > 0)
            {
                // save FIND tag sms 
                udtReceived.Sender = arrFleetRegTags[0].Name;
                udtReceived.Recipients = "FIND-Fleet";
                udtReceived.Message = strInbox;
                udtReceived.Timestamp = dtTimestamp.ToUniversalTime();
                udtReceived.StatusID = -1;
                udtReceived.Company = arrFleetRegTags[0].Company;
                udtReceived.AssetID = 0;
                svcFleet.SaveMessage(udtReceived);
            }

            // check commmand
            switch (arrParams[0])
            {
                case "find":
                    {
                        // check name
                        if (arrParams.Length > 1)
                        {
                            // find asset(s)
                            List<AssetInfo> arrAssets = GetAssets(strPhone, arrParams[1], svcTrack, svcFleet);

                            // check if from FIND user
                            if (arrFINDRegUsers.Count > 0)
                                udtMessage.Recipients = arrFINDRegUsers[0].Name;

                            // loop through assets
                            foreach (AssetInfo udtAsset in arrAssets)
                            {
                                // get direction
                                PosInfo udtPos = udtAsset.LastPos;
                                string strDirection = "N";
                                if (udtPos.Course == 0) strDirection = "N";
                                else if (udtPos.Course == 90) strDirection = "E";
                                else if (udtPos.Course == 180) strDirection = "S";
                                else if (udtPos.Course == 270) strDirection = "W";
                                else
                                {
                                    // get direction
                                    if ((udtPos.Course > 0) && (udtPos.Course < 90)) strDirection = "NE";
                                    if ((udtPos.Course > 90) && (udtPos.Course < 180)) strDirection = "SE";
                                    if ((udtPos.Course > 180) && (udtPos.Course < 270)) strDirection = "SW";
                                    if ((udtPos.Course > 270) && (udtPos.Course < 360)) strDirection = "NW";
                                }

                                // get asset position
                                string strLink = String.Format("{0}?{1}", m_strMap, udtPos.PosID);
                                string strLocation = String.Format("{0}\r\n{1}", udtPos.Zone, udtPos.Location).Trim();

                                // get asset status
                                strStatus = udtPos.Engine;
                                if (udtAsset.StatusEx != "") strStatus += String.Format("\r\n{0}", udtAsset.StatusEx);

                                // build asset info
                                strMessage = String.Format("{0}\r\n{1} {2:0.0} kph {3}\r\n{4}\r\n{5:dd-MMM-yyyy HH:mm:ss}\r\n{6}",
                                    udtAsset.Name.ToUpper(), strStatus, udtPos.Speed, strDirection, strLocation,
                                    udtPos.Timestamp.ToLocalTime(), strLink);

                                // send asset location
                                if (m_smsModem.SendSms(strPhone, strMessage))
                                {
                                    // save message
                                    udtMessage.Company = udtAsset.Company;
                                    udtMessage.AssetID = udtAsset.AssetID;
                                    udtMessage.Message = strMessage;

                                    // check if FIMD sms
                                    if (arrFINDRegUsers.Count > 0)
                                        svcTrack.SaveMessage(udtMessage);
                                    else
                                        svcFleet.SaveMessage(udtMessage);
                                }
                            }

                            // check if no asset returned
                            if (arrAssets.Count == 0)
                            {
                                // send asset location
                                strMessage = string.Format("Failed to locate asset(s). Please contact W-locate FIND technical support.");
                                if (m_smsModem.SendSms(strPhone, strMessage))
                                {
                                    // save message
                                    udtMessage.Company = udtReceived.Company;
                                    udtMessage.Message = strMessage;
                                    svcTrack.SaveMessage(udtMessage);
                                    svcFleet.SaveMessage(udtMessage);
                                }
                            }
                        }
                    }
                    break;
            }
        }

        private List<AssetInfo> GetAssets(string strPhone, string param, WlocateClient svcTrack, WlocateClient svcFleet)
        {
            List<AssetInfo> retTrackAssets = new List<AssetInfo>();
            List<AssetInfo> retFleetAssets = new List<AssetInfo>();

            try
            {
                retTrackAssets = svcTrack.FindAssets(strPhone, param);
                retFleetAssets = svcFleet.FindAssets(strPhone, param);
                m_strMap = m_strMapFind;

                retTrackAssets.AddRange(retFleetAssets);
                LogEvent(String.Format("GetAssetsCount: {0}", retTrackAssets.Count), false);
            }
            catch (Exception ex)
            {
                // log error
                LogEvent(String.Format("GetAssets>>{0}", ex.Message), true);
            }

            return retTrackAssets;
        }

        private bool IsOldAssetTimestamp(List<AssetInfo> arrAssets)
        {
            bool retVal = false;
            try
            {
                if (arrAssets.Count > 0)
                    retVal = arrAssets[0].LastPos.Timestamp.Date < DateTime.Now.Date;
            }
            catch (Exception ex)
            {
                // log error
                LogEvent(String.Format("IsOldAssetTimestamp>>{0}", ex.Message), true);
            }

            return retVal;
        }

        /// <summary>
        /// sends email notification
        /// </summary>
        /// <param name="message"></param>
        public bool SendEmail(MessageInfo message)
        {
            bool bSent = false;
            try
            {
                // check email addresses
                if ((message.Recipients == "") || (message.Message.Trim() == "")) return bSent;
                string[] arrAddrs = message.Recipients.Split(",".ToCharArray());

                // create mail message
                string strSender = m_strEmail;
                string strSource = "FIND";
                MailMessage eMail = new MailMessage();
                eMail.From = new MailAddress(strSender, strSource);
                //eMail.From = new MailAddress("noreply@w-locate.com", "FIND");
                // loop through recipients
                foreach (string strAddr in arrAddrs)
                {
                    // check recipient if email address
                    if (strAddr.Contains("@"))
                    {
                        eMail.To.Add(new MailAddress(strAddr.Trim()));
                        ////testing
                        //LogEvent(String.Format("{0}", strAddr), false);
                    }
                }

                //eMail.To.Add(new MailAddress("dantericafort@gmail.com"));
                //eMail.To.Add(new MailAddress("dante.ricafort@w-locate.com"));

                // check recipients
                if (eMail.To.Count > 0)
                {
                    // set email content
                    eMail.Subject = string.Format("FIND Notification - {0} ({1})", 
                        message.Asset, message.Company);
                    eMail.Body = message.Message;

                    // send email
                    SmtpClient smtp = new SmtpClient(Settings.Default.EmailServer);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(Settings.Default.EmailUser,
                        Settings.Default.EmailPassword);
                    smtp.EnableSsl = false;
                    smtp.Send(eMail);

                    Thread.Sleep(10000);//Implement sleep so email server wont find this app suspicious

                    //LogEvent(String.Format("Email Sent: {0}-{1}", eMail.Body, eMail.To.ToString()), false);
                }
                bSent = true;
            }
            catch (SmtpException ex)
            {
                // log error
                LogEvent(String.Format("SendEmail(SMTP) - Msg{0}", ex.Message), true);
                LogEvent(String.Format("SendEmail(SMTP) - InnerEx{0}", ex.InnerException), true);
            }
            catch (Exception e)
            {
                // log error
                LogEvent(String.Format("SendEmail - {0}", e.Message), true);
            }
            return bSent;
        }

        /// <summary>
        /// event called when service stops running
        /// </summary>
        protected override void OnStop()
        {
            // close modem
            m_smsModem.DoConnect(false);

            // log service stop
            LogEvent(string.Format("{0} messaging service stopped.", Settings.Default.ProjectName), false);
        }

        /// <summary>
        /// creates event log for web service
        /// </summary>
        public static void LogEvent(string strEvent, bool bError)
        {
            try
            {
                // create event source
                string strSource = Settings.Default.ProjectName;
                EventSourceCreationData evtSource = new EventSourceCreationData(strSource, strSource);
                if (!EventLog.SourceExists(strSource))
                    EventLog.CreateEventSource(evtSource);

                // log event
                string strLog = String.Format("{0}: {1}", Settings.Default.ProjectName, strEvent);
                EventLog.WriteEntry(strSource, strLog, (bError ? EventLogEntryType.Error : EventLogEntryType.Information));
            }
            catch { }
        }
    }

    /// <summary>
    /// helper function class
    /// </summary>
    internal static class HelperFunctions
    {
        /// <summary>
        /// converts hex value to integer
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static int ToHexInt(this string strHex)
        {
            // convert hex to int
            return Convert.ToInt32(strHex, 16);
        }

        /// <summary>
        /// converts string directly to octet format
        /// </summary>
        /// <param name="strText"></param>
        public static string ToOctet(this string strText)
        {
            // loop through text characters            
            string strPdu = "";
            for (int i = 0; i < strText.Length; i++)
                strPdu += String.Format("{0:X2}", Convert.ToByte(strText[i]));
            return strPdu;
        }

        /// <summary>
        /// converts string to septet then to octet format
        /// </summary>
        /// <param name="strText"></param>
        public static string ToSeptet(this string strText)
        {
            // loop through text characters            
            List<string> arrTemp = new List<string>();
            for (int i = 0; i < strText.Length; i++)
            {
                // convert to septet binary
                byte szTemp = Convert.ToByte(strText[i]);
                string strBinary = Convert.ToString(szTemp, 2).PadLeft(7, '0');
                arrTemp.Add(strBinary);
            }

            // loop through septet list
            for (int i = 0; i < arrTemp.Count - 1; i++)
            {
                // check string if consumed
                if (arrTemp[i] == "")
                    continue;

                // get septet strings
                string strTemp1 = arrTemp[i];
                string strTemp2 = arrTemp[i + 1];

                // take bits from next septet to form octet
                int iSep = strTemp2.Length - (8 - strTemp1.Length);
                arrTemp[i] = strTemp2.Substring(iSep) + strTemp1;
                arrTemp[i + 1] = strTemp2.Substring(0, iSep);
            }

            // loop through octet list
            string strPdu = "";
            foreach (string strTemp in arrTemp)
            {
                // append to octet string
                if (strTemp != "")
                    strPdu += String.Format("{0:X2}", Convert.ToInt32(strTemp, 2));
            }
            return strPdu;
        }

        /// <summary>
        /// converts decimal to half octet
        /// </summary>
        /// <param name="strText"></param>
        /// <returns></returns>
        public static string ToSemiOctet(this string strText)
        {
            // apply padding if length is odd
            if (strText.Length % 2 != 0)
                strText += "F";

            // swap characters
            string strTemp = "";
            for (int i = 0; i < strText.Length - 1; i++)
            {
                // swap every two characters
                strTemp += strText.Substring(i + 1, 1) + strText.Substring(i, 1);
                i++;
            }
            return strTemp;
        }
    }
}
