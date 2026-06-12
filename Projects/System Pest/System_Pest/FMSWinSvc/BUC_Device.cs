using FMSWinSvc.FmsWcfApi;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvc
{
    public class BUC_Device
    {
        /// <summary>
        /// BUC/Greenbanks special requirement to send to MPOB (East Malaysia)
        /// [Dan:30Jul14]
        /// </summary>
        /// <param name="udtData"></param>
        public void SendDataToOtherServer(RawData udtData)
        {
            FmsWcfClient svcClient = new FmsWcfClient("BasicHttpBinding_IFmsWcf");

            try
            {
                string deviceName = BUC.GetDeviceID(udtData.Data);
                TagInfo udtTag = svcClient.GetTag(deviceName);

                //udtData.Data = BUC.ChangeImeiToDeviceName(udtData.Data, udtTag.Name);//change device name
                if (udtTag.IsSentOut)
                {
                    //send to MPOB if necessary [Dan:29Jul14]
                    //TODO: possible that WS or SendOut IP/Port is not available. 
                    //Such cases currently not yet handled. Suggested to try Async Connection.
                    //RawData mpobData = new RawData();
                    //mpobData.DataID = udtData.DataID;
                    //mpobData.Tag = udtTag.Name;
                    //mpobData.ServerIP = udtData.ServerIP;
                    //mpobData.ServerPort = udtData.ServerPort;
                    //mpobData.Timestamp = udtData.Timestamp;
                    //mpobData.RxTime = udtData.RxTime;

                    try
                    {
                        const int maxBuffer = 100;

                        //create the protocol
                        udtData.Tag = (string.IsNullOrEmpty(udtTag.Name) ? udtData.Tag : udtTag.Name);
                        string data = ComposeMPOBData(udtData.Data, udtData.Tag);

                        if (string.IsNullOrEmpty(data))
                            return;

                        //try
                        //{
                        //    string sendOutServer = Settings.Default.SendOutSetting;

                        //    if (string.IsNullOrEmpty(sendOutServer))
                        //        return;

                        //    string[] sendOutIPport = sendOutServer.Split(":".ToCharArray());
                        //    int port = 0;
                        //    int.TryParse(sendOutIPport[1], out port);

                        //    byte[] dataByte = new byte[1024];

                        //    //LogEvent(3, String.Format("SendTOMPOB: IP-{0};Port{1}\r\n", sendOutIPport[0], sendOutIPport[1]));//testing
                        //    LogEvent(3, String.Format("SendTOMPOB-Device:{0};Data:{1}\r\nIP-{2};Port{3}\r\n", 
                        //        udtData.Tag, data, sendOutIPport[0], sendOutIPport[1]));//testing

                        //    UdpClient udpClient = new UdpClient();
                        //    IPEndPoint ipEP = new IPEndPoint(IPAddress.Parse(sendOutIPport[0]), port);
                        //    Byte[] sendBytes = Encoding.ASCII.GetBytes(data);
                        //    udpClient.Send(sendBytes, sendBytes.Length, ipEP);
                        //    udpClient.Close();
                        //}
                        //catch (Exception ex)
                        //{
                        //    LogEvent(0, String.Format("Exception when sending to MPOB: {0}\r\n", ex.Message));
                        //}
                    }
                    catch (Exception ex)
                    {
                        Logger.LogToEvent(String.Format("Exception when sending to MPOB: {0}\r\n", ex.Message), System.Diagnostics.EventLogEntryType.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("SendDataToOtherServer: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            svcClient.Close();
        }

        /// <summary>
        /// Create MPOB data format
        /// [Dan:29Jul14]
        /// </summary>
        /// <param name="udtData"></param>
        /// <returns></returns>
        private string ComposeMPOBData(string strDataTemp, string deviceName)
        {
            //>BUC;A,035413,29092014,005.97095,116.07015,0,47,02,0,0,0,0,0;CHT016<
            string retResult = "";
            DateTime dtTimestamp = new DateTime();
            double posY = 0;
            double posX = 0;
            double course = 0;
            double speed = 0;
            double mileage = 0;
            string strData = strDataTemp;
            string strPosY = "";
            string strPosX = "";

            try
            {
                strData = strData.Substring(1);

                if (strData.Substring(0, 2) == "00")
                {
                    dtTimestamp = BUC.ParseTime10(strData.Substring(34, 8), strData.Substring(72, 2));
                    posY = Math.Round(BUC.ParseLatLong10(strData.Substring(42, 8)), 5);
                    posX = Math.Round(BUC.ParseLatLong10(strData.Substring(50, 8)), 5);
                    course = Convert.ToInt32(strData.Substring(62, 4), 16);
                    speed = Math.Round(Convert.ToInt32(strData.Substring(66, 2), 16) * 1.60934, 2);
                    //mileage = Math.Round(Convert.ToInt32(strData.Substring(82, 4), 16) * 1.60934, 2);
                    mileage = 0;
                }
                else
                {
                    // check ion300 message type
                    switch (strData.Substring(4, 2))
                    {
                        case "02": //gps data
                            {
                                dtTimestamp = BUC.ParseTime11(strData.Substring(14, 8));
                                posY = Math.Round(BUC.ParseLatLong11(strData.Substring(22, 8)), 5);
                                posX = Math.Round(BUC.ParseLatLong11(strData.Substring(30, 8)), 5);
                                course = Convert.ToInt32(strData.Substring(40, 4), 16);
                                speed = Math.Round((double)Convert.ToInt32(strData.Substring(38, 2), 16));
                                mileage = 0;
                            }
                            break;
                    }
                }

                strPosY = CheckDecimalPt(posY);
                strPosX = CheckDecimalPt(posX);

                retResult = String.Format(">BUC;A,{0},{1},{2},{3},{4},{5},02,0,0,0,0,{6};{7}<",
                                    dtTimestamp.ToString("HHmmss"), dtTimestamp.ToString("ddMMyyyy"),
                                    strPosY, strPosX, speed, course, mileage, deviceName);
            }
            catch (Exception ex)
            {
                //retResult = ex.Message;
            }

            return retResult;
        }

        /// <summary>
        /// Check and ensure that input will have "maxCount" decimal point
        /// [Dan:29Sep14]
        /// </summary>
        /// <param name="posY"></param>
        /// <returns></returns>
        private string CheckDecimalPt(double pos)
        {
            string strData = "";

            try
            {
                int maxCount = 5;
                string strPos = pos.ToString();
                string[] data = strPos.Split(".".ToCharArray());

                if (data.Length >= 2)
                {
                    if (data[1].Length < maxCount)
                        strData = data[1].PadRight(maxCount, '0');
                    else if (data[1].Length > maxCount)
                        strData = data[1].Substring(0, maxCount);
                    else
                        strData = data[1];
                }
                else
                {
                    strData = "0".PadRight(maxCount, '0');
                }

                strData = data[0] + "." + strData;
            }
            catch (Exception ex)
            {
            }

            return strData;
        }
    }
}
