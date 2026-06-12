using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Net;
using System.Web;
using WlocateWeb.Protocols;

namespace WlocateWeb
{
    class DeviceProtocol
    {
        private List<NameInfo> m_arrEvents = new List<NameInfo>();
        private FmsWcf m_svcWlocate = null;
        private DatabaseMgrMySQL m_dbMgr = null;
        private UserInfo m_udtUser = new UserInfo();

        /// <summary>
        /// class constructor
        /// </summary>
        public DeviceProtocol(FmsWcf svcWlocate, ref DatabaseMgrMySQL dbMgr, UserInfo udtUser)
        {
            // get web service handle
            m_svcWlocate = svcWlocate;
            m_dbMgr = dbMgr;
            m_udtUser = udtUser;
        }

        /// <summary>
        /// processes message packets received from devices
        /// </summary>
        /// <param name="udtData"></param>
        public string ProcessData(RawData udtData)
        {
            // build raw data
            string strData = udtData.Data;
            DateTime dtRxTime = udtData.RxTime;

            try
            {
                // loop through data
                for (int j = 0; j < strData.Length; j++)
                {
                    // check if start flag
                    if (Char.IsLetterOrDigit(strData, j) ||
                        (strData.Substring(j, 1) == "$") ||
                        (strData.Substring(j, 1) == "#") ||
                        (strData.Substring(j, 1) == "&") ||
                        (strData.Substring(j, 1) == "^") ||
                        (strData.Substring(j, 1) == "*") ||
                        (strData.Substring(j, 1) == "?") ||
                        (strData.Substring(j, 1) == "~"))
                    {
                        // trim leading null characters
                        strData = strData.Substring(j);
                        break;
                    }
                }

                // check data
                if (strData.Trim() == "")
                    return udtData.Tag;

                // check start flag
                switch (strData.Substring(0, 1))
                {
                case "$":
                    {
                        // check if ts109 device info
                        if (strData.StartsWith("$OPEN"))
                            CheckDevice3(strData, dtRxTime, ref udtData);

                        // check if ts109 position
                        else if (strData.StartsWith("$GPS"))
                            CheckPosition3(strData, dtRxTime, ref udtData);

                        // check if ts109 event
                        else if (strData.StartsWith("$ALT"))
                            CheckEvent3(strData, dtRxTime, ref udtData);

                        // check if smarttrax position
                        else if (strData.StartsWith("$VT") || strData.StartsWith("$SW"))
                            CheckPosition4(strData, dtRxTime, ref udtData);

                        // check if gpslands protocol
                        else if (strData.StartsWith("$$"))
                            CheckPosition7(strData, dtRxTime, ref udtData);

                        // check if mu201 protocol
                        else if (strData.StartsWith("$GPRMC"))
                            CheckPosition12(strData, dtRxTime, ref udtData);

                        // check if kbox position
                        else CheckPosition2(strData, dtRxTime, ref udtData);
                    }
                    break;
                case "#":
                    {
                        // check if china edusafety device
                        if (strData.Trim().EndsWith("##"))
                            CheckPosition8(strData, dtRxTime, ref udtData);

                        // check if kbox event
                        else CheckEvent2(strData, dtRxTime, ref udtData);
                    }
                    break;
                case "&":
                    {
                        // check if china device
                        if (strData.Trim().EndsWith("&&"))
                            CheckDevice8(strData, dtRxTime, ref udtData);
                        else if (strData.StartsWith("&,20"))//[Dan:17Nov14] Support for GG450
                            CheckPosition13(strData, dtRxTime, ref udtData);
                        // check if smartcomm position
                        else CheckPosition9(strData, dtRxTime, ref udtData);
                    }
                    break;
                case "^":
                    {
                        // check if startrack protocol
                        switch (Convert.ToInt32(strData.Substring(6, 1)))
                        {
                        case 0:
                        case 1:
                        case 2: CheckPosition5(strData, dtRxTime, ref udtData); break;
                        default: CheckEvent5(strData, dtRxTime, ref udtData); break;
                        }
                    }
                    break;
                case "*":
                    {
                        // check if gosafe position
                        CheckPosition6(strData, dtRxTime, ref udtData);
                    }
                    break;
                case "?":
                    {
                        // trim leading question mark
                        strData = strData.Substring(1);
                        switch (strData.Substring(0, 1))
                        {
                            // check if kbox protocol (buffered)
                        case "$": CheckPosition2(strData, dtRxTime, ref udtData); break;
                        case "#": CheckEvent2(strData, dtRxTime, ref udtData); break;

                            //[Dan:23Sep14] Check if buffered data of RugGear protocol
                        case "?":
                            {
                                // check if ruggear buffered position
                                if (strData.StartsWith("?$GPS"))
                                    CheckPosition3(strData, dtRxTime, ref udtData);
                            }
                            break;
                        }
                    }
                    break;
                case "~":
                    {
                        // check if sce ion300 protocol
                        strData = strData.Substring(1);
                        if (strData.Substring(0, 4) == "6767")
                        {
                            // check message type
                            switch (strData.Substring(4, 2))
                            {
                            case "01": CheckDevice11(strData, dtRxTime, ref udtData); break; //login data
                            case "02": //gps data
                            case "04": 
                            case "05": 
                            case "06": CheckPosition11(strData, dtRxTime, ref udtData); break;
                            case "03": CheckEvent11(strData, dtRxTime, ref udtData); break; //heartbeat data
                            }
                        }
                        else
                        {
                            // check if sce ion200 protocol
                            if (strData.Substring(0, 2) == "00") CheckPosition10(strData, dtRxTime, ref udtData);
                            else CheckEvent10(strData, dtRxTime, ref udtData);
                        }
                    }
                    break;
                case ">BUC"://>BUC;A,160126,05122014,5.33299,116.14462,0,0,02,0,0,0,0,0;JJW002<
                    // update raw data
                    try
                    {
                        string data = strData;
                        string[] arrData = strData.Split(";".ToCharArray());
                        strData = arrData[2];
                        strData = data.Substring(0, strData.Length - 1);
                        udtData.Tag = strData;
                        udtData.Timestamp = DateTime.Now;
                    } catch {}
                    break;
                case "S"://STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03
                    try
                    {
                        GG400 parserGG400 = new GG400();
                        FMSWebApi.Models.PosInfo newPos = parserGG400.ParseData(strData);
                        parserGG400.SendData(newPos);
                    }
                    catch { }
                    break;
                default:
                    {
                        // check message length
                        if (strData.Length >= 50)
                        {
                            // check if starcuff position
                            if (CheckPosition1(strData, dtRxTime, ref udtData))
                                break;
                            
                            // check if smarttrax (hardware issue: missing $VT start flag)
                            CheckPosition4(String.Format("$VT,{0}", strData), dtRxTime, ref udtData);
                        }

                        // check if starcuff event
                        else if (strData.Length >= 23)
                            CheckEvent1(strData, dtRxTime, ref udtData);
                    }
                    break;
                }
            }
            catch { }

            // save raw data
            if (udtData.Data.Trim() != "")
                m_svcWlocate.SaveRawData(ref m_dbMgr, udtData);
            return udtData.Tag;
        }

        #region PROTOCOL 1: STARCUFF

        /// <summary>
        /// checks message packet if position (star*cuff protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition1(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                udtPos.Tag = strData.Substring(0, 1);
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime1(strData.Substring(1, 12));
                udtPos.FixID = Convert.ToInt32(strData.Substring(13, 1));
                udtPos.Fix = "";
                udtPos.PosY = ParseLatLong1(strData.Substring(14, 9));
                if (strData.Substring(23, 1) == "S") udtPos.PosY *= -1;
                udtPos.PosX = ParseLatLong1(strData.Substring(24, 10));
                if (strData.Substring(34, 1) == "W") udtPos.PosX *= -1;
                udtPos.Speed = Convert.ToDouble(String.Format("{0}.{1}", strData.Substring(35, 3), strData.Substring(38, 1)));
                udtPos.Course = Convert.ToDouble(String.Format("{0}.{1}", strData.Substring(39, 3), strData.Substring(42, 1)));
                udtPos.HDOP = Convert.ToDouble(String.Format("{0}.{1}", strData.Substring(43, 2), strData.Substring(45, 1)));
                udtPos.PosZ = Convert.ToDouble(strData.Substring(46, 4));
                udtPos.Ignition = -1;
                udtPos.Mileage = 0;
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition1", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        private double ParseLatLong1(string strDms)
        {
            // convert degree and minutes to double
            int iLen = strDms.Length;
            double lDecimal = Convert.ToDouble(String.Format("{0}.{1}",
                strDms.Substring(iLen - 7, 2), strDms.Substring(iLen - 5, 5))) / 60;
            return Convert.ToDouble(strDms.Substring(0, iLen - 7)) + lDecimal;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime1(string strTimestamp)
        {
            try
            {
                // parse timestamp
                string strDate = String.Format("{1}/{0}/{2}", strTimestamp.Substring(6, 2),
                    strTimestamp.Substring(8, 2), strTimestamp.Substring(10, 2));
                string strTime = String.Format("{0}:{1}:{2}", strTimestamp.Substring(0, 2),
                    strTimestamp.Substring(2, 2), strTimestamp.Substring(4, 2));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (star*cuff protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent1(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // initialize event parameters
                udtEvent.Tag = strData.Substring(0, 1);
                udtEvent.Timestamp = ParseTime1(strData.Substring(1, 12));
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.Flag = 0;

                // check event type
                switch (Convert.ToInt16(strData.Substring(13, 1)))
                {
                case 1:
                    {
                        // device tampered
                        udtEvent.Event = "Device Tampered";
                        if (Convert.ToInt16(strData.Substring(14, 1)) == 0)
                            m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                        else
                        {
                            // raise alert
                            udtEvent.AlertLevel = 2;
                            udtEvent.Remarks = "Strap Cut";
                            SaveEvent(udtEvent);
                        }

                        // motion status
                        udtEvent.Event = "Motion Status";
                        if (Convert.ToInt16(strData.Substring(15, 1)) == 0)
                            m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                        else
                        {
                            // raise alert
                            udtEvent.AlertLevel = 1;
                            udtEvent.Remarks = "Motion Alert";
                            SaveEvent(udtEvent);
                        }
                    }
                    break;
                case 2:
                    {
                        // check battery temperature
                        udtEvent.Event = "Battery Temperature";
                        if (!CheckTemp(ref udtEvent, Convert.ToInt16(strData.Substring(14, 1))))
                            SaveEvent(udtEvent);

                        // check board temperature
                        udtEvent.Event = "Board Temperature";
                        if (!CheckTemp(ref udtEvent, Convert.ToInt16(strData.Substring(15, 1))))
                            SaveEvent(udtEvent);
                    }
                    break;
                case 3:
                    {
                        // check power status
                        udtEvent.Event = "Power Status";
                        udtEvent.AlertLevel = 0;

                        // check charging status
                        string strStatus = "";
                        switch (strData.Substring(14, 1))
                        {
                        case "0": strStatus = "No Charger"; break;
                        case "1": strStatus = "Charging Start"; break;
                        case "2": strStatus = "Charging"; break;
                        case "3": strStatus = "Charging Finished"; break;
                        case "4": strStatus = "Charging Interrupted"; break;
                        case "5": strStatus = "False Charging Temp"; break;
                        case "A":
                            {
                                // voltage alert
                                strStatus = "Undervoltage";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        case "B":
                            {
                                // voltage alert
                                strStatus = "Overvoltage Warning";
                                udtEvent.AlertLevel = 1;
                            }
                            break;
                        case "C":
                            {
                                // voltage alert
                                strStatus = "Overvoltage Shutdown";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        }

                        // get battery level
                        int iLevel = Convert.ToInt16(strData.Substring(15, 1));
                        if (((udtEvent.AlertLevel == 0) && (strStatus != "Charging")) && (strStatus != "Charging Start"))
                        {
                            // check battery level
                            switch (iLevel)
                            {
                            case 0: udtEvent.AlertLevel = 2; break;
                            case 1: udtEvent.AlertLevel = 1; break;
                            default: m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true); break;
                            }
                        }

                        // save battery alert
                        udtEvent.Remarks = String.Format("{0}, {1}%, {2:0.000} V", strStatus, iLevel * 20, Convert.ToDouble(strData.Substring(0x10, 4)) / 1000.0);
                        SaveEvent(udtEvent);
                    }
                    break;
                case 4:
                    {
                        // check if good fix
                        if (strData.Substring(14, 1) == "1")
                        {
                            // locate cell id
                            CellID udtCellID = new CellID();
                            udtCellID.mcc = "525";
                            udtCellID.mnc = "1";
                            udtCellID.lac = Convert.ToInt32(strData.Substring(15, 4), 16).ToString();
                            udtCellID.cid = Convert.ToInt32(strData.Substring(19, 4), 16).ToString();
                            LocateCellID(udtEvent, udtCellID);
                        }
                    }
                    break;
                case 5:
                    {
                        // save debug report event
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = strData.Substring(14, 9);
                        udtEvent.AlertLevel = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                }

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent1", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// checks device temperature
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <param name="iStatus"></param>
        /// <returns></returns>
        private bool CheckTemp(ref EventInfo udtEvent, int iStatus)
        {
            // battery temperature report
            switch (iStatus)
            {
            case 1:
            case 5:
                {
                    // raise alert
                    udtEvent.AlertLevel = 2;
                    udtEvent.Remarks = String.Format("Temp {0} Limit", iStatus == 1 ? "Below Lower" : "Above Upper");
                }
                break;
            case 2:
            case 4:
                {
                    // warning event
                    udtEvent.AlertLevel = 1;
                    udtEvent.Remarks = String.Format("Temp Near {0} Limit", iStatus == 2 ? "Lower" : "Upper");
                }
                break;
            case 3:
                {
                    // cancel event
                    m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                }
                return true;
            }
            return false;
        }
        #endregion

        #region PROTOCOL 2: KBOX

        /// <summary>
        /// checks message packet if position (kbox protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition2(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                string[] arrData = strData.Substring(1).Split(",".ToCharArray());
                udtPos.Tag = arrData[arrData.Length - 1];
                udtPos.Timestamp = ParseTime2(arrData[0]);
                udtPos.RxTime = dtRxTime;
                udtPos.FixID = Convert.ToInt32(arrData[1]);
                udtPos.Fix = "";
                udtPos.PosY = Convert.ToDouble(arrData[2]);
                udtPos.PosX = Convert.ToDouble(arrData[3]);
                udtPos.PosZ = Convert.ToDouble(arrData[4]);
                udtPos.Speed = Convert.ToDouble(arrData[5]);
                udtPos.Course = Convert.ToDouble(arrData[6]);
                udtPos.Ignition = -1;

                // check message length
                if (((arrData.Length == 11) && arrData[9].Contains(".")) || (arrData.Length > 11))
                {
                    // parse position data (kwv protocol)
                    // $140131022216,2,1.3695474,103.93652,33,0,120,9,25.7,0.29,209,KWV0206
                    udtPos.Satellites = Convert.ToInt32(arrData[7]);
                    udtPos.Battery = Convert.ToDouble(arrData[8]);
                    udtPos.Fuel = Convert.ToDouble(arrData[9]);
                }

                // check message length
                switch (arrData.Length)
                {
                case 9:
                case 10:
                    {
                        // parse position data (old protocol)
                        udtPos.HDOP = Convert.ToDouble(arrData[7]);
                        udtPos.Mileage = (arrData.Length > 9 ? Convert.ToDouble(arrData[8]) * 100 : 0);
                    }
                    break;
                case 11:
                    {
                        // check if old protocol
                        if (!arrData[9].Contains("."))
                        {
                            // parse position data (old protocol)
                            udtPos.HDOP = Convert.ToDouble(arrData[7]);
                            udtPos.Mileage = Convert.ToDouble(arrData[8]) * 100;
                            udtPos.Ignition = Convert.ToInt32(arrData[9]);
                        }
                    }
                    break;
                case 12:
                    {
                        // parse position data (kwv protocol)
                        // $140131022216,2,1.3695474,103.93652,33,0,120,9,25.7,0.29,209,KWV0206
                        if (arrData[10] != "") udtPos.Mileage = Convert.ToDouble(arrData[10]) * 100;
                    }
                    break;
                case 13:
                    {
                        // parse position data (kwv protocol)
                        // $140131022216,2,1.3695474,103.93652,33,0,120,9,25.7,0.29,10,209,KWV0206
                        if (arrData[10] != "")
                        {
                            // get io status
                            string strIO = Convert.ToString(Convert.ToInt32(arrData[10], 16), 2).PadLeft(8, '0');
                            udtPos.Ignition = Convert.ToInt32(strIO.Substring(7, 1));
                            //udtPos.DrumDirection = Convert.ToInt32(strIO.Substring(4, 1));
                        }

                        // check mileage
                        if (arrData[11] != "")
                            udtPos.Mileage = Convert.ToDouble(arrData[11]) * 100;
                    }
                    break;
                case 14:
                    {
                        // parse position data (kwv protocol)
                        // $140131022216,2,1.3695474,103.93652,33,0,120,9,25.7,0.29,10,209,0,KWV0206
                        if (arrData[10] != "")
                        {
                            // get io status
                            string strIO = Convert.ToString(Convert.ToInt32(arrData[10], 16), 2).PadLeft(8, '0');
                            udtPos.Ignition = Convert.ToInt32(strIO.Substring(7, 1));
                            //udtPos.DrumDirection = Convert.ToInt32(strIO.Substring(4, 1));
                        }

                        // check mileage
                        if (arrData[11] != "")
                            udtPos.Mileage = Convert.ToDouble(arrData[11]) * 100;
                        /*
                        // check drum rotation speed
                        if (arrData[12] != "")
                        {
                            // get drum status
                            udtPos.MixerRPM = Convert.ToInt32(arrData[12]);
                            udtPos.DrumStatus = (udtPos.MixerRPM > 0 ? 1 : 0);
                        }
                        */
                    }
                    break;
                }

                // save position
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition2", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime2(string strTimestamp)
        {
            try
            {
                // parse timestamp
                string strDate = String.Format("{1}/{2}/{0}", strTimestamp.Substring(0, 2),
                    strTimestamp.Substring(2, 2), strTimestamp.Substring(4, 2));
                string strTime = String.Format("{0}:{1}:{2}", strTimestamp.Substring(6, 2),
                    strTimestamp.Substring(8, 2), strTimestamp.Substring(10, 2));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (kbox protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent2(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // check if kwv protocol
                string[] arrData = strData.Replace("#", "").Split(",".ToCharArray());
                if (arrData.Length > 10)
                {
                    // extract position parameters
                    List<string> arrTemp = new List<string>(arrData);
                    arrTemp.RemoveRange(10, arrTemp.Count - 11);
                    CheckPosition2(String.Format("${0}", String.Join(",", arrTemp)), dtRxTime, ref udtData);

                    // extract event parameters
                    arrTemp.Clear();
                    arrTemp.Add(arrData[0]);
                    for (int i = 10; i < arrData.Length; i++)
                        arrTemp.Add(arrData[i]);
                    arrData = arrTemp.ToArray();
                }

                // initialize event parameters
                udtEvent.Tag = arrData[arrData.Length - 1];
                udtEvent.Timestamp = ParseTime2(arrData[0]);
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.AlertLevel = 0;
                udtEvent.Flag = 0;

                // check event type
                switch (Convert.ToInt32(arrData[1]))
                {
                case 1:
                    {
                        // check alert type
                        switch (arrData[2].ToUpper())
                        {
                        case "PB":
                            {
                                // panic button
                                udtEvent.Event = "Panic Button";
                                if (Convert.ToInt32(arrData[3]) == 0)
                                    m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                                else
                                {
                                    // raise alert
                                    udtEvent.Remarks = "Emergency";
                                    udtEvent.AlertLevel = 2;
                                    SaveEvent(udtEvent);
                                }
                            }
                            break;
                        case "TP":
                            {
                                // device tampered
                                udtEvent.Event = "Device Tampered";
                                if (Convert.ToInt32(arrData[3]) == 0)
                                    m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                                else
                                {
                                    // raise alert
                                    udtEvent.AlertLevel = 2;
                                    SaveEvent(udtEvent);
                                }
                            }
                            break;
                        case "SP":
                            {
                                // Speeding
                                //udtEvent.Event = "Speeding";
                                udtEvent.Event = "Speeding Kbox";//[Dan:16Jan14] Activate 2nd speeding alert to have 2 speed limit - for SGSupport
                                udtEvent.Remarks = (Convert.ToInt32(arrData[3]) == 0 ? "OFF" : "ON");
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "IG":
                            {
                                // ignition report
                                udtEvent.Event = "Ignition";
                                udtEvent.Remarks = (Convert.ToInt32(arrData[3]) == 0 ? "OFF" : "ON");
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "ID":
                            {
                                // idling alert
                                udtEvent.Event = "Excessive Idling";
                                if (Convert.ToInt32(arrData[3]) == 0)
                                    m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                                else
                                {
                                    // raise alert
                                    udtEvent.AlertLevel = 1;
                                    SaveEvent(udtEvent);
                                }
                            }
                            break;
                        case "PS":
                            {
                                // power status
                                udtEvent.Event = "Power Status";
                                udtEvent.Remarks = String.Format("Car Battery {0}", (Convert.ToInt32(arrData[3]) == 0 ? "Removed" : "Available"));
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "ANTDET":
                            {
                                // gps antenna
                                udtEvent.Event = "GPS Antenna";
                                udtEvent.Remarks = (Convert.ToInt32(arrData[3]) == 0 ? "Removed" : "Available");
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "IN1":
                        case "IN2":
                        case "IN3":
                        case "IN4":
                        case "OUT0":
                        case "OUT1":
                            {
                                // input pin
                                udtEvent.Event = "Pin Status";
                                udtEvent.Remarks = String.Format("{0}: {1}", arrData[2], arrData[3]);
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "CM0":
                        case "CM1":
                            {
                                // drum status
                                udtEvent.Event = "Drum Status";
                                udtEvent.Remarks = String.Format("{0}: {1} RPM", (arrData[2].ToUpper() == "CM0" ? 
                                    "Mixing" : "Unloading"), arrData[3]);
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "HA":
                        case "HB":
                        case "HR":
                        case "HL":
                            {
                                // check event
                                string strRemarks = "";
                                switch (arrData[2].ToUpper())
                                {
                                case "HA": strRemarks = "Harsh Acceleration"; break;
                                case "HB": strRemarks = "Harsh Braking"; break;
                                case "HR": strRemarks = "Harsh Cornering Right"; break;
                                case "HL": strRemarks = "Harsh Cornering Left"; break;
                                }

                                // driving alert
                                udtEvent.Event = "Driving Alert";
                                udtEvent.Remarks = String.Format("{0}: {1}", strRemarks, arrData[3]);
                                SaveEvent(udtEvent);
                            }
                            break;
                        default:
                            {
                                // pin status report
                                udtEvent.Event = "Pin Status";
                                udtEvent.Remarks = arrData[2];
                                SaveEvent(udtEvent);
                            }
                            break;
                        }
                    }
                    break;
                case 2:
                    {
                        // check temperature type
                        udtEvent.Event = (Char.IsNumber(arrData[2], 0) ? "Battery Temperature" : "Board Temperature");
                        switch (arrData[2])
                        {
                        case "1":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Below Lower Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "2":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Near Lower Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "3":
                            {
                                // cancel alert
                                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                            }
                            break;
                        case "4":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Near Upper Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "5":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Above Upper Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "A":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Below Lower Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "B":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Near Lower Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "C":
                            {
                                // cancel alert
                                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                            }
                            break;
                        case "D":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Near Upper Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case "E":
                            {
                                // raise alert
                                udtEvent.Remarks = "Temp Above Upper Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        }
                    }
                    break;
                case 3:
                    {
                        // power status
                        udtEvent.Event = "Power Status";
                        string strStatus = "";
                        switch (arrData[2])
                        {
                        case "0": strStatus = "No Charger"; break;
                        case "1": strStatus = "Charging Start"; break;
                        case "2": strStatus = "Charging"; break;
                        case "3": strStatus = "Charging Finished"; break;
                        case "4": strStatus = "Charging Interrupted"; break;
                        case "5": strStatus = "False Charging Temp"; break;
                        case "A":
                            {
                                // voltage alert
                                strStatus = "Undervoltage";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        case "B":
                            {
                                // voltage alert
                                strStatus = "Overvoltage Warning";
                                udtEvent.AlertLevel = 1;
                            }
                            break;
                        case "C":
                            {
                                // voltage alert
                                strStatus = "Overvoltage Shutdown";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        }

                        // check battery level
                        int iLevel = 0;
                        if (arrData.Length > 4)
                        {
                            // get battery level
                            iLevel = Convert.ToInt32(arrData[3]);
                            if (((udtEvent.AlertLevel == 0) && (strStatus != "Charging")) && (strStatus != "Charging Start"))
                            {
                                // check battery level
                                switch (iLevel)
                                {
                                case 0: udtEvent.AlertLevel = 2; break;
                                case 1: udtEvent.AlertLevel = 1; break;
                                default: m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true); break;
                                }
                            }
                        }

                        // save battery alert
                        double lVoltage = (arrData.Length > 5 ? Convert.ToDouble(arrData[4]) / 1000.0 : 0.0);
                        udtEvent.Remarks = String.Format("{0}, {1}%, {2:0.000} V", strStatus,
                            iLevel * 20, lVoltage);
                        SaveEvent(udtEvent);
                    }
                    break;
                case 4:
                    {
                        // cell id event
                        udtEvent.Event = "Cell ID";
                        switch (Convert.ToInt32(arrData[2]))
                        {
                        case 0:
                        case 2:
                        case 3:
                        case 4:
                            {
                                // check status
                                switch (Convert.ToInt32(arrData[2]))
                                {
                                case 0: udtEvent.Remarks = "Not Registered"; break;
                                case 2: udtEvent.Remarks = "Searching For Network"; break;
                                case 3: udtEvent.Remarks = "Registration Failed"; break;
                                case 4: udtEvent.Remarks = "Unknown"; break;
                                }
                                
                                // save cell id event                                
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 1:
                        case 5:
                            {
                                // locate cell id
                                CellID udtCellID = new CellID();
                                udtCellID.mcc = Convert.ToInt32(arrData[3].Substring(0, 3)).ToString();
                                udtCellID.mnc = Convert.ToInt32(arrData[3].Substring(3)).ToString();
                                udtCellID.lac = Convert.ToInt32(arrData[4], 16).ToString();
                                udtCellID.cid = Convert.ToInt32(arrData[5], 16).ToString();
                                LocateCellID(udtEvent, udtCellID);
                            }
                            break;
                        case 6:
                            {
                                // home network
                                int mcc = Convert.ToInt32(arrData[3].Substring(0, 3));
                                int mnc = Convert.ToInt32(arrData[3].Substring(3));

                                // network info
                                udtEvent.Remarks = String.Format("{0}/{1:00}, Network Info", mcc, mnc);
                                udtEvent.Flag = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        }
                    }
                    break;
                case 5:
                    {
                        // debug report
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = arrData[2];
                        SaveEvent(udtEvent);
                    }
                    break;
                case 6:
                    {
                        // mileage report
                        udtEvent.Event = "Mileage Report";
                        udtEvent.Remarks = String.Format("Last Trip (km): {0}", arrData[2]);
                        if (arrData.Length > 4)
                            udtEvent.Remarks += String.Format(", Total Mileage (km): {0}", arrData[3]);
                        SaveEvent(udtEvent);
                    }
                    break;
                case 7:
                    {
                        // get remarks
                        // #140203023950,7,mileage,1,679,KWV0212
                        string strRemarks = "";
                        for (int i = 2; i < arrData.Length - 1; i++)
                            strRemarks += String.Format(",{0}", arrData[i]);
                        
                        // device configuration
                        udtEvent.Event = "Settings Update";
                        udtEvent.Remarks = strRemarks.Trim(",".ToCharArray());
                        SaveEvent(udtEvent);
                    }
                    break;
                case 8:
                    {
                        // get remarks
                        string strRemarks = "";
                        for (int i = 2; i < arrData.Length - 1; i++)
                            strRemarks += String.Format("\r{0}", arrData[i]);

                        // driver's info
                        udtEvent.Event = "Driver Info";
                        udtEvent.Remarks = strRemarks.Trim("\r".ToCharArray());
                        SaveEvent(udtEvent);
                    }
                    break;
                case 9://[Dan:14Jul14] RFID 
                    {
                        // RFID Card ID
                        udtEvent.Event = "RFID";
                        udtEvent.Remarks = arrData[2];
                        SaveEvent(udtEvent);

                        //add RFID if new
                        // set tag parameters
                        RFIDInfo udtRFID = new RFIDInfo();
                        udtRFID.RfidID = 0;
                        udtRFID.RFID = udtEvent.Remarks;
                        udtRFID.Remarks = "";
                        udtRFID.Company = "W-locate";
                        m_svcWlocate.SaveRFID(udtRFID);
                    }
                    break;
                }

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent2", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 3: TS109

        /// <summary>
        /// checks message packet if device info (ts109 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckDevice3(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse device info
                // $OPEN:TS109,V135_RFID,Sep 21 2013,HC2164,89601611061300075928,12,myevo,502,16,5E1C,F5F2
                strData = strData.Substring(strData.IndexOf(":") + 1);
                string[] arrData = strData.Split(",".ToCharArray());
                if (arrData.Length == 1)
                    arrData = strData.Split(":".ToCharArray());

                // check parameters
                if (arrData.Length > 10)
                {
                    // save sim card event
                    EventInfo udtEvent = new EventInfo();
                    udtEvent.Tag = arrData[3];
                    udtEvent.Timestamp = dtRxTime;
                    udtEvent.RxTime = dtRxTime;
                    udtEvent.AckUserID = 1;
                    
                    // locate cell id
                    CellID udtCellID = new CellID();
                    udtCellID.mcc = Convert.ToInt32(arrData[7]).ToString();
                    udtCellID.mnc = Convert.ToInt32(arrData[8]).ToString();
                    udtCellID.lac = Convert.ToInt32(arrData[9], 16).ToString();
                    udtCellID.cid = Convert.ToInt32(arrData[10], 16).ToString();
                    //LocateCellID(udtEvent, udtCellID);

                    // network info
                    udtEvent.Event = "Cell ID";
                    udtEvent.Remarks = String.Format("{0}/{1:00}, Network Info", udtCellID.mcc, udtCellID.mnc);
                    udtEvent.Flag = 1;
                    SaveEvent(udtEvent);

                    // update raw data
                    udtData.Tag = udtEvent.Tag;
                    udtData.Timestamp = udtEvent.Timestamp;
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckDevice3", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// checks message packet if position (ts109 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition3(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                //[Dan:23Sep14]
                bool isBuffer = false;
                if (strData.Substring(0, 1) == "?")
                {
                    strData = strData.Substring(1);
                    isBuffer = true;
                }
                //

                // parse message packet
                // $GPS:040214,043640,1,8,1.369765,103.936923,45.3,0.0,30.8,0.0,1,3477268,0,0,4,0,1@HC1286
                strData = strData.Substring(strData.IndexOf(":") + 1);
                string[] arrData = strData.Replace("@", ",").Split(",".ToCharArray());

                // check parameters
                if (arrData.Length > 12)
                {
                    // build position info
                    PosInfo udtPos = new PosInfo();
                    udtPos.Tag = arrData[arrData.Length - 1];
                    udtPos.RxTime = dtRxTime;
                    udtPos.Timestamp = ParseTime3(arrData[0], arrData[1]);
                    udtPos.FixID = Convert.ToInt32(arrData[2]);
                    udtPos.Satellites = Convert.ToInt32(arrData[3]);
                    udtPos.PosY = Convert.ToDouble(arrData[4]);
                    udtPos.PosX = Convert.ToDouble(arrData[5]);
                    udtPos.PosZ = Convert.ToDouble(arrData[6]);
                    udtPos.Speed = Convert.ToDouble(arrData[7]);
                    udtPos.Course = Convert.ToDouble(arrData[8]);
                    udtPos.HDOP = Convert.ToDouble(arrData[9]);
                    udtPos.Ignition = Convert.ToInt32(arrData[10]);
                    udtPos.Mileage = Convert.ToDouble(arrData[11]);

                    
                    // check position fix
                    switch (udtPos.FixID)
                    {
                    case 1: udtPos.FixID = (udtPos.Satellites > 3 ? 2 : 1); break;
                    case 9: udtPos.FixID = (udtPos.Satellites > 3 ? 4 : 3); break;
                    }
                    /*
                    // check parameters
                    if (arrData.Length > 15)
                    {
                        // get drum status
                        udtPos.MixerRPM = Convert.ToInt32(arrData[arrData.Length - 4]);
                        udtPos.DrumDirection = Convert.ToInt32(arrData[arrData.Length - 2]);
                        udtPos.DrumStatus = (udtPos.MixerRPM > 0 ? 1 : 0);
                    }
                    */
                    
                    //[Dan:23Sep14] update if buffer
                    udtPos.IsBuffer = isBuffer;
                    
                    // save position
                    SavePosition(udtPos);

                    // update raw data
                    udtData.Tag = udtPos.Tag;
                    udtData.Timestamp = udtPos.Timestamp;

                    

                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition3", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strDate"></param>
        /// <param name="strTime"></param>
        /// <returns></returns>
        private DateTime ParseTime3(string strDate, string strTime)
        {
            try
            {
                // parse timestamp
                string strTimestamp = String.Format("{1}/{0}/{2} {3}:{4}:{5}",
                    strDate.Substring(0, 2), strDate.Substring(2, 2), strDate.Substring(4, 2),
                    strTime.Substring(0, 2), strTime.Substring(2, 2), strTime.Substring(4, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (ts109 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent3(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse event data
                // $ALT:128,1,040214,043552,1,1.26702,103.63002,23.000,0,3052082@HC1451
                strData = strData.Substring(strData.IndexOf(":") + 1);
                string[] arrData = strData.Replace("@", ",").Split(",".ToCharArray());
                if (arrData.Length > 10)
                {
                    // parse event parameters
                    EventInfo udtEvent = new EventInfo();
                    udtEvent.Tag = arrData[arrData.Length - 1];
                    udtEvent.RxTime = dtRxTime;
                    udtEvent.Timestamp = ParseTime3(arrData[2], arrData[3]);
                    udtEvent.AckUserID = 1;
                    udtEvent.Flag = 0;

                    // check event type
                    switch (Convert.ToInt32(arrData[0]))
                    {
                    case 0x0001:
                        {
                            // panic button
                            udtEvent.Event = "Panic Button";
                            udtEvent.Remarks = "Emergency";

                            // check if pressed
                            if (Convert.ToInt16(arrData[1]) == 1)
                            {
                                // alert event
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                        }
                        break;
                    case 0x0002:
                        {
                            // device tampered alert
                            udtEvent.Event = "Device Tampered";
                            udtEvent.Remarks = "Tracker Board Removed";

                            // device tampered alert
                            if (Convert.ToInt16(arrData[1]) == 1)
                            {
                                // alert event
                                udtEvent.AlertLevel = 2;
                                udtEvent.Remarks = "";
                                SaveEvent(udtEvent);
                            }
                        }
                        break;
                    case 0x0020:
                        {
                            // check power event
                            udtEvent.Event = "Power Status";
                            if (Convert.ToInt16(arrData[1]) == 1)
                            {
                                // cancel pending power lost alert
                                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);

                                // power is restored
                                udtEvent.AlertLevel = 0;
                                udtEvent.Remarks = "Power Restored (Running on Vehicle Battery)";
                                SaveEvent(udtEvent);
                            }
                            else
                            {
                                // power lost
                                udtEvent.AlertLevel = 2;
                                udtEvent.Remarks = "Power Lost (Running on Internal Battery)";
                                SaveEvent(udtEvent);
                            }
                        }
                        break;
                    case 0x0100:
                        {
                            // ignition alert
                            udtEvent.Event = "Ignition";
                            udtEvent.Remarks = (Convert.ToInt16(arrData[1]) == 0 ? "OFF" : "ON");
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x0080:
                        {
                            // drum status
                            udtEvent.Event = "Drum Status";
                            udtEvent.Remarks = (Convert.ToInt16(arrData[1]) == 0 ? "Unloading" : "Mixing");
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x0008:
                    case 0x0010:
                    case 0x0040:
                    case 0x0200:
                    case 0x0400:
                        {
                            // check pin number
                            int iPin = 0;
                            switch (Convert.ToInt32(arrData[0]))
                            {
                            case 0x0080: iPin = 3; break;
                            case 0x0008: iPin = 4; break;
                            case 0x0010: iPin = 5; break;
                            case 0x0040: iPin = 6; break;
                            case 0x0200: iPin = 7; break;
                            case 0x0400: iPin = 8; break;
                            }

                            // pin status
                            udtEvent.Event = "Pin Status";
                            udtEvent.Remarks = String.Format("IN{0}", iPin);
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x4000:
                        {
                            // Speeding alert
                            udtEvent.Event = "Speeding";
                            udtEvent.Remarks = arrData[1];
                            udtEvent.AlertLevel = 2;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x0800:
                        {
                            // zone enter alert
                            udtEvent.Event = "Zone Enter";
                            udtEvent.Remarks = arrData[1];
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x1000:
                        {
                            // zone exit alert
                            udtEvent.Event = "Zone Exit";
                            udtEvent.Remarks = arrData[1];
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x0004:
                        {
                            // check motion status
                            if (Convert.ToInt16(arrData[1]) == 0)
                            {
                                // standing alert
                                udtEvent.Event = "Motion Status";
                                udtEvent.Remarks = "Asset Not Moving";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            else
                            {
                                // excessive idling alert
                                udtEvent.Event = "Excessive Idling";
                                udtEvent.Remarks = "";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                        }
                        break;
                    case 0x20000:
                        {
                            // harsh brake alert
                            udtEvent.Event = "Driving Alert";
                            udtEvent.Remarks = String.Format("Harsh Brake ({0})", arrData[1]);
                            udtEvent.AlertLevel = 2;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x10000:
                        {
                            // accident alert
                            udtEvent.Event = "Driving Alert";
                            udtEvent.Remarks = String.Format("Accident ({0})", arrData[1]);
                            udtEvent.AlertLevel = 2;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x2000:
                        {
                            // gps halt alert
                            udtEvent.Event = "GPS Antenna";
                            udtEvent.Remarks = String.Format("No GPS ({0})", arrData[1]);
                            udtEvent.AlertLevel = 2;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x40000:
                        {
                            // over-the-air alert
                            bool bOK = (Convert.ToInt16(arrData[1]) == 0);
                            udtEvent.Event = "Settings Update";
                            udtEvent.Remarks = (bOK ? "OTA OK" : "OTA Failed");
                            udtEvent.AlertLevel = (bOK ? 0 : 2);
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x80000:
                        {
                            // immobilizer alert
                            udtEvent.Event = "Immobilizer";
                            udtEvent.Remarks = (Convert.ToInt16(arrData[1]) == 0 ? "OFF" : "ON");
                            udtEvent.AlertLevel = 1;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x100000:
                        {
                            // check status
                            int iStatus = Convert.ToInt16(arrData[1]);
                            string strStatus = "";
                            switch (iStatus)
                            {
                            case 1: strStatus = "OK"; break;
                            case 2: strStatus = "Start taking by SMS"; break;
                            case 3: strStatus = "Failed to start by SMS"; break;
                            }

                            // camera alert
                            udtEvent.Event = "Camera";
                            udtEvent.Remarks = strStatus;
                            udtEvent.AlertLevel = iStatus - 1;
                            SaveEvent(udtEvent);
                        }
                        break;
                    case 0x200000:
                        {
                            // RFID alert
                            udtEvent.Event = "RFID";
                            udtEvent.Remarks = arrData[10];
                            udtEvent.AlertLevel = 0;
                            SaveEvent(udtEvent);

                            //add RFID if new
                            // set tag parameters
                            RFIDInfo udtRFID = new RFIDInfo();
                            udtRFID.RfidID = 0;
                            udtRFID.RFID = udtEvent.Remarks;
                            udtRFID.Remarks = "";
                            udtRFID.Company = "W-locate";
                            m_svcWlocate.SaveRFID(udtRFID);
                        }
                        break;
                    case 0x8000:
                        {
                            // locate cell id
                            string[] arrTemp = arrData[10].Split(":".ToCharArray());
                            CellID udtCellID = new CellID();
                            udtCellID.mcc = "0";
                            udtCellID.mnc = "0";
                            udtCellID.lac = Convert.ToInt32(arrTemp[0], 16).ToString();
                            udtCellID.cid = Convert.ToInt32(arrTemp[1], 16).ToString();
                            LocateCellID(udtEvent, udtCellID);
                        }
                        break;
                    }

                    // update raw data
                    udtData.Tag = udtEvent.Tag;
                    udtData.Timestamp = udtEvent.Timestamp;
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent3", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 4: SMARTTRAX

        /// <summary>
        /// checks message packet if position (smarttrax protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition4(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            //  0,   1,     2,          3,           4,        5,    6,7,8,9,10,11,12,13,14,  15,16
            //$VT,63A*,041513,N0117.02168,E10351.67648,41.347752,14.69,9,0,0,1 ,0 ,  ,  ,0 ,0.00,0 ,0,1291,260614,,0,0,%6F2B
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                string[] arrData = strData.Split(",".ToCharArray());
                udtPos.Tag = arrData[1];
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime4(arrData[2]);
                udtPos.PosX = Convert.ToDouble(arrData[3]);
                udtPos.PosY = Convert.ToDouble(arrData[4]);
                udtPos.Speed = Convert.ToDouble(arrData[5]);
                udtPos.Course = Convert.ToDouble(arrData[6]);
                udtPos.PosZ = Convert.ToDouble(arrData[7]);
                udtPos.Satellites = Convert.ToInt32(arrData[8]);
                udtPos.Ignition = -1;
                udtPos.Mileage = Convert.ToDouble(arrData[12]) * 100;
                udtPos.Fix = "";

                // check gps fix
                if (udtPos.Satellites > 3) udtPos.FixID = 2;
                else if (udtPos.Satellites > 2) udtPos.FixID = 1;
                else udtPos.FixID = 0;
                try
                {
                    // parse input port status
                    int iInput = (strData.StartsWith("$VT") ? 10 : 11);
                    string strInput = Convert.ToString(Convert.ToInt32(arrData[iInput]), 2).PadLeft(4, '0');
                    if (strInput.Length > 4)
                        strInput = strInput.Substring(strInput.Length - 4);

                    // get ignition status
                    udtPos.Ignition = (strInput.Substring(3, 1) == "1" ? 1 : 0);
                }
                catch { }

                // save position
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;

                // check events
                CheckEvent4(strData, dtRxTime, ref udtData);
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition4", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime4(string strTimestamp)
        {
            try
            {
                // parse timestamp
                string strDate = String.Format("{1}/{2}/{0}", strTimestamp.Substring(0, 4),
                    strTimestamp.Substring(4, 2), strTimestamp.Substring(6, 2));
                string strTime = String.Format("{0}:{1}:{2}", strTimestamp.Substring(8, 2),
                    strTimestamp.Substring(10, 2), strTimestamp.Substring(12, 2));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (smarttrax protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent4(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // initialize event parameters
                string[] arrData = strData.Split(",".ToCharArray());
                udtEvent.Tag = arrData[1];
                udtEvent.Timestamp = ParseTime4(arrData[2]);
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.Flag = 0;

                // check event type
                switch (Convert.ToInt32(arrData[9]))
                {
                case 3:
                    {
                        // raise speeding alert
                        udtEvent.Event = "Speeding";
                        udtEvent.Remarks = String.Format("Speed: {0:0.0} kph", Convert.ToDouble(arrData[5]));
                        udtEvent.AlertLevel = 2;
                        udtEvent.Flag = 1;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 9:
                    {
                        // cancel speeding alert
                        udtEvent.Event = "Speeding";
                        m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                    }
                    break;
                case 40:
                    {
                        // main power low
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Main Power Low";
                        udtEvent.AlertLevel = 1;
                        udtEvent.Flag = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 41:
                    {
                        // reset power recovered flag
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Power Restored";
                        m_svcWlocate.FlagEvent(ref m_dbMgr, udtEvent);

                        // main power lost
                        udtEvent.Remarks = "Power Lost";
                        udtEvent.AlertLevel = 2;
                        udtEvent.Flag = 1;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 42:
                    {
                        // main power voltage restored
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Main Power Voltage Restored";
                        udtEvent.AlertLevel = 0;
                        udtEvent.Flag = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 43:
                    {
                        // cancel pending power lost alert
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Power Lost";
                        m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);

                        // main power recovered
                        udtEvent.Remarks = "Power Restored";
                        udtEvent.AlertLevel = 0;
                        udtEvent.Flag = 1;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 47:
                    {
                        // main power voltage restored
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Internal Battery Voltage Restored";
                        udtEvent.AlertLevel = 0;
                        udtEvent.Flag = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                }

                // parse output port status
                int iOutput = (strData.StartsWith("$VT") ? 11 : 14);
                string strOutput = Convert.ToString(Convert.ToInt32(arrData[iOutput]), 2).PadLeft(4, '0');
                if (strOutput.Length > 4)
                    strOutput = strOutput.Substring(strOutput.Length - 4);

                // cancel pending immobilizer status
                bool bOn = strOutput.Substring(1, 1) == "1";
                udtEvent.Event = "Immobilizer";
                udtEvent.Remarks = (bOn ? "OFF" : "ON");
                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);

                // save immobilizer status
                udtEvent.Remarks = (bOn ? "ON" : "OFF");
                udtEvent.AlertLevel = 0;
                udtEvent.Flag = 1;
                SaveEvent(udtEvent);

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent4", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 5: STARTRACK

        /// <summary>
        /// checks message packet if position (w-locator protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition5(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                udtPos.RxTime = dtRxTime;
                udtPos.Tag = strData.Substring(1, 5);
                udtPos.FixID = Convert.ToInt32(strData.Substring(6, 1));
                udtPos.Fix = "";
                udtPos.Timestamp = ParseTime5(strData.Substring(7, 16));
                udtPos.PosY = ByteToSingle(strData.Substring(23, 8));
                udtPos.PosX = ByteToSingle(strData.Substring(31, 8));
                udtPos.PosZ = ByteToSingle(strData.Substring(39, 8));
                udtPos.Speed = ByteToSingle(strData.Substring(47, 8));
                udtPos.Course = ByteToSingle(strData.Substring(55, 8));
                udtPos.HDOP = ByteToSingle(strData.Substring(63, 8));
                udtPos.Ignition = (udtPos.Speed > 5 ? 1 : 0);
                udtPos.Mileage = 0;
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition5", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts hex string to double
        /// </summary>
        /// <param name="strData"></param>
        /// <returns></returns>
        private double ByteToSingle(string strData)
        {
            // convert hex to double
            return BitConverter.ToSingle(ToByteArray(strData), 0);
        }

        /// <summary>
        /// converts hex string to int
        /// </summary>
        /// <param name="strData"></param>
        /// <returns></returns>
        private int ByteToInt(string strData)
        {
            // convert hex to double
            return BitConverter.ToInt32(ToByteArray(strData), 0);
        }

        /// <summary>
        /// converts hex string to byte array
        /// </summary>
        /// <param name="strData"></param>
        /// <returns></returns>
        private byte[] ToByteArray(string strData)
        {
            // convert string to bytes
            List<byte> arrBytes = new List<byte>();
            for (int i = 0; i < strData.Length; i += 2)
                arrBytes.Add(Convert.ToByte(strData.Substring(i, 2), 16));

            // check endian
            byte[] szBytes = arrBytes.ToArray();
            if (BitConverter.IsLittleEndian)
                szBytes = ReverseBytes(szBytes);
            return szBytes;
        }

        /// <summary>
        /// reverses byte array order
        /// </summary>
        /// <param name="inArray"></param>
        /// <returns></returns>
        private static byte[] ReverseBytes(byte[] inArray)
        {
            byte temp;
            int highCtr = inArray.Length - 1;

            // loop through bytes
            for (int ctr = 0; ctr < inArray.Length / 2; ctr++)
            {
                temp = inArray[ctr];
                inArray[ctr] = inArray[highCtr];
                inArray[highCtr] = temp;
                highCtr -= 1;
            }
            return inArray;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime5(string strTimestamp)
        {
            try
            {
                // parse timestamp
                DateTime dtEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
                return dtEpoch.AddSeconds(BitConverter.ToInt64(ToByteArray(strTimestamp), 0) / 1000);
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (w-locator protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent5(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // initialize event parameters
                udtEvent.Tag = strData.Substring(1, 5);
                udtEvent.Timestamp = ParseTime5(strData.Substring(7, 16));
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.Flag = 0;

                // check event type
                switch (Convert.ToInt32(strData.Substring(6, 1)))
                {
                case 3:
                    {
                        // i/o status report
                        udtEvent.Event = "Pin Status";
                        udtEvent.Remarks = String.Format("{0}, {1}",
                            ByteToInt(strData.Substring(23, 8)),
                            ByteToInt(strData.Substring(31, 8)));
                        udtEvent.AlertLevel = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                case 4:
                    {
                        // check temperature alert
                        switch (ByteToInt(strData.Substring(23, 8)))
                        {
                        case 1:
                            {
                                // raise alert
                                udtEvent.Event = "Battery Temperature";
                                udtEvent.Remarks = "Temp Below Lower Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 2:
                            {
                                // raise alert
                                udtEvent.Event = "Battery Temperature";
                                udtEvent.Remarks = "Temp Near Lower Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 3:
                            {
                                // cancel alert
                                udtEvent.Event = "Battery Temperature";
                                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                            }
                            break;
                        case 4:
                            {
                                // raise alert
                                udtEvent.Event = "Battery Temperature";
                                udtEvent.Remarks = "Temp Near Upper Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 5:
                            {
                                // raise alert
                                udtEvent.Event = "Battery Temperature";
                                udtEvent.Remarks = "Temp Above Upper Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 11:
                            {
                                // raise alert
                                udtEvent.Event = "Board Temperature";
                                udtEvent.Remarks = "Temp Below Lower Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 12:
                            {
                                // raise alert
                                udtEvent.Event = "Board Temperature";
                                udtEvent.Remarks = "Temp Near Lower Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 13:
                            {
                                // cancel alert
                                udtEvent.Event = "Board Temperature";
                                m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true);
                            }
                            break;
                        case 14:
                            {
                                // raise alert
                                udtEvent.Event = "Board Temperature";
                                udtEvent.Remarks = "Temp Near Upper Limit";
                                udtEvent.AlertLevel = 1;
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 15:
                            {
                                // raise alert
                                udtEvent.Event = "Board Temperature";
                                udtEvent.Remarks = "Temp Above Upper Limit";
                                udtEvent.AlertLevel = 2;
                                SaveEvent(udtEvent);
                            }
                            break;
                        }
                    }
                    break;
                case 5:
                    {
                        // initialize event
                        udtEvent.Event = "Power Status";
                        udtEvent.AlertLevel = 0;

                        // check charging status
                        string strStatus = "";
                        switch (ByteToInt(strData.Substring(23, 8)))
                        {
                        case 0: strStatus = "No Charger"; break;
                        case 1: strStatus = "Charging Start"; break;
                        case 2: strStatus = "Charging"; break;
                        case 3: strStatus = "Charging Finished"; break;
                        case 4: strStatus = "Charging Interrupted"; break;
                        case 5: strStatus = "False Charging Temp"; break;
                        case 6:
                            {
                                // voltage alert
                                strStatus = "Undervoltage";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        case 7:
                            {
                                // voltage alert
                                strStatus = "Overvoltage Warning";
                                udtEvent.AlertLevel = 1;
                            }
                            break;
                        case 8:
                            {
                                // voltage alert
                                strStatus = "Overvoltage Shutdown";
                                udtEvent.AlertLevel = 2;
                            }
                            break;
                        }

                        // get battery level
                        int iLevel = ByteToInt(strData.Substring(31, 8));
                        if (((udtEvent.AlertLevel == 0) && (strStatus != "Charging")) && (strStatus != "Charging Start"))
                        {
                            // check battery level
                            switch (iLevel)
                            {
                            case 0: udtEvent.AlertLevel = 2; break;
                            case 1: udtEvent.AlertLevel = 1; break;
                            default: m_svcWlocate.CancelEvent(ref m_dbMgr, udtEvent, true); break;
                            }
                        }

                        // save battery alert
                        double lVoltage = ByteToInt(strData.Substring(39, 8)) / 1000.0;
                        udtEvent.Remarks = String.Format("{0}, {1}%, {2:0.000} V", strStatus, iLevel * 20, lVoltage);
                        SaveEvent(udtEvent);
                    }
                    break;
                case 6:
                    {
                        // initialize event
                        udtEvent.Event = "Cell ID";
                        udtEvent.AlertLevel = 0;

                        // check status
                        switch (ByteToInt(strData.Substring(23, 8)))
                        {
                        case 0:
                            {
                                // not registered
                                udtEvent.Remarks = "Not Registered";
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 1:
                            {
                                // locate cell id
                                CellID udtCellID = new CellID();
                                string strMccMnc = ByteToInt(strData.Substring(31, 8)).ToString();
                                udtCellID.mcc = Convert.ToInt32(strMccMnc.Substring(0, 3)).ToString();
                                udtCellID.mnc = Convert.ToInt32(strMccMnc.Substring(3)).ToString();
                                udtCellID.lac = ByteToInt(strData.Substring(39, 8)).ToString();
                                udtCellID.cid = ByteToInt(strData.Substring(47, 8)).ToString();
                                LocateCellID(udtEvent, udtCellID);
                            }
                            break;
                        case 2:
                            {
                                // searching network
                                udtEvent.Remarks = "Searching For Network";
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 3:
                            {
                                // registration failed
                                udtEvent.Remarks = "Registration Failed";
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 4:
                            {
                                // not used unknown
                                udtEvent.Remarks = "Not Used / Unknown";
                                SaveEvent(udtEvent);
                            }
                            break;
                        case 5:
                            {

                                // roaming
                                udtEvent.Remarks = "Roaming";
                                SaveEvent(udtEvent);

                                // locate cell id
                                CellID udtCellID = new CellID();
                                string strMccMnc = ByteToInt(strData.Substring(31, 8)).ToString();
                                udtCellID.mcc = Convert.ToInt32(strMccMnc.Substring(0, 3)).ToString();
                                udtCellID.mnc = Convert.ToInt32(strMccMnc.Substring(3)).ToString();
                                udtCellID.lac = ByteToInt(strData.Substring(39, 8)).ToString();
                                udtCellID.cid = ByteToInt(strData.Substring(47, 8)).ToString();
                                LocateCellID(udtEvent, udtCellID);
                            }
                            break;
                        }
                    }
                    break;
                }

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent5", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 6: GOSAFE

        /// <summary>
        /// checks message packet if position (ncs protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition6(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse position data
                string[] arrData = strData.Replace(";", ",").Split(",".ToCharArray());
                string strDevice = arrData[1];
                DateTime dtTimestamp = dtRxTime;

                // check if gps fix
                // *GS02,358696042262918,GPS:064336;A;N1.379023;E103.848224;0;0;210812,STT:200;0,MGR:60
                if (arrData[2].StartsWith("GPS:"))
                {
                    // parse gps data
                    PosInfo udtPos = new PosInfo();
                    udtPos.Tag = strDevice;
                    udtPos.PosY = Convert.ToDouble(arrData[4].Substring(1));
                    if (arrData[4].Substring(0, 1) == "S") udtPos.PosY *= -1;
                    udtPos.PosX = Convert.ToDouble(arrData[5].Substring(1));
                    if (arrData[5].Substring(0, 1) == "W") udtPos.PosX *= -1;
                    udtPos.PosZ = 0;
                    udtPos.RxTime = dtRxTime;
                    dtTimestamp = ParseTime6(arrData[8], arrData[2]);
                    udtPos.Timestamp = dtTimestamp;
                    udtPos.FixID = 2;
                    udtPos.Fix = "";
                    udtPos.Speed = 0;
                    udtPos.Course = 0;
                    udtPos.HDOP = 0;
                    udtPos.Ignition = (udtPos.Speed > 5 ? 1 : 0);
                    udtPos.Mileage = 0;
                    SavePosition(udtPos);
                }

                // check if cell id fix
                // *GS02,358696042262918,CLL:130917210812;525;5;3022;53642,STT:202;0,MGR:24621
                else if (arrData[2].StartsWith("CLL:"))
                {
                    // initialize event parameters
                    EventInfo udtEvent = new EventInfo();
                    udtEvent.Tag = strDevice;
                    udtEvent.Timestamp = ParseTime6(arrData[2]);
                    udtEvent.RxTime = dtRxTime;
                    udtEvent.AckUserID = 1;
                    udtEvent.Flag = 0;

                    // locate cell id
                    CellID udtCellID = new CellID();
                    udtCellID.mcc = Convert.ToInt32(arrData[3]).ToString();
                    udtCellID.mnc = Convert.ToInt32(arrData[4]).ToString();
                    udtCellID.lac = Convert.ToInt32(arrData[5]).ToString();
                    udtCellID.cid = Convert.ToInt32(arrData[6]).ToString();
                    LocateCellID(udtEvent, udtCellID);
                }

                // update raw data
                udtData.Tag = strDevice;
                udtData.Timestamp = dtTimestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition6", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime6(string strDate, string strTime)
        {
            try
            {
                // parse timestamp
                strTime = strTime.Substring(strTime.IndexOf(":") + 1);
                string strTimestamp = String.Format("{1}/{0}/{2} {3}:{4}:{5}",
                    strDate.Substring(0, 2), strDate.Substring(2, 2), strDate.Substring(4, 2),
                    strTime.Substring(0, 2), strTime.Substring(2, 2), strTime.Substring(4, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime6(string strTimestamp)
        {
            try
            {
                // parse timestamp
                strTimestamp = strTimestamp.Substring(strTimestamp.IndexOf(":") + 1);
                strTimestamp = String.Format("{4}/{3}/{5} {0}:{1}:{2}",
                    strTimestamp.Substring(0, 2), strTimestamp.Substring(2, 2), strTimestamp.Substring(4, 2),
                    strTimestamp.Substring(6, 2), strTimestamp.Substring(8, 2), strTimestamp.Substring(10, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }
        #endregion

        #region PROTOCOL 7: GPSLANDS

        /// <summary>
        /// checks message packet if position (gpslands protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition7(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                // $$B3359772033687196|AA$GPRMC,004739.000,A,0122.7409,N,10350.8935,E,0.00,,230113,,,A*70|01.5|00.7|01.3|000000000000|20090123004738|14201144|00000000|0BD7C763|0000|0.0000|0722||85C0
                string[] arrData = strData.Replace("$$B", "").Split("|".ToCharArray());
                udtPos.Tag = arrData[0];
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime7(arrData[6]);
                udtPos.FixID = 2;
                udtPos.Fix = "";
                string[] arrTemp = arrData[1].Split(",".ToCharArray());
                udtPos.PosZ = Convert.ToDouble(arrTemp[1]) / 100;
                udtPos.PosY = Convert.ToDouble(arrTemp[3]) / 100;
                if (arrTemp[4] == "S") udtPos.PosY *= -1;
                udtPos.PosX = Convert.ToDouble(arrTemp[5]) / 100;
                if (arrTemp[6] == "W") udtPos.PosX *= -1;
                udtPos.Speed = 0;
                udtPos.Course = 0;
                udtPos.HDOP = 0;
                udtPos.Ignition = (udtPos.Speed > 5 ? 1 : 0);
                udtPos.Mileage = 0;
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition7", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime7(string strTimestamp)
        {
            try
            {
                // parse timestamp
                string strDate = String.Format("{1}/{2}/{0}", strTimestamp.Substring(0, 4),
                    strTimestamp.Substring(4, 2), strTimestamp.Substring(6, 2));
                string strTime = String.Format("{0}:{1}:{2}", strTimestamp.Substring(8, 2),
                    strTimestamp.Substring(10, 2), strTimestamp.Substring(12, 2));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }
        #endregion

        #region PROTOCOL 8: CHINA EDUSAFETY

        /// <summary>
        /// checks message packet if position (china edusafety protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition8(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse position data
                // #357328884330352##0000#FIT#46001#517700006dfe2eff00a0#5177000076ad2cff00ff#51770000beab1dff0032#00000000000006ff0000#2511000072430fff0032#51770000beab0dff023f#51770000beac17ffd2eb#51770000ee7116ff62d9#51770000beab1aff0073#51770000beac1dff4f0b#140126#155400##
                string[] arrData = strData.Split("#".ToCharArray());
                string strDevice = arrData[1];
                string strUsername = arrData[2];
                string strPassword = arrData[3];
                DateTime dtTimestamp = ParseTime8(arrData[16], arrData[17]);
                
                // initialize event
                EventInfo udtEvent = new EventInfo();
                udtEvent.Tag = strDevice;
                udtEvent.AckUserID = 1;
                udtEvent.Timestamp = dtTimestamp;
                udtEvent.RxTime = udtData.RxTime;
                udtEvent.AlertLevel = 0;
                udtEvent.Flag = 0;

                // get home network
                int iMcc = Convert.ToInt32(arrData[5].Substring(0, 3));
                int iMnc = Convert.ToInt32(arrData[5].Substring(3));

                // loop through cell id blocks (start from the last)
                for (int i = 15; i >= 6; i--)
                {
                    // parse cell id block
                    // 255e 0000a569 6f ff 000a
                    string strCellID = arrData[i];
                    int iLac = Convert.ToInt32(strCellID.Substring(0, 4), 16);
                    int iCid = Convert.ToInt32(strCellID.Substring(4, 8), 16);
                    int iSignalStrength = Convert.ToInt32(strCellID.Substring(12, 2), 16);
                    int iTimingAdvance = Convert.ToInt32(strCellID.Substring(14, 2), 16);
                    int iTimeLapse = Convert.ToInt32(strCellID.Substring(16, 4), 16);

                    // build cell id info
                    CellID udtCellID = new CellID();
                    udtCellID.mcc = iMcc.ToString();
                    udtCellID.mnc = iMnc.ToString();
                    udtCellID.lac = iLac.ToString();
                    udtCellID.cid = iCid.ToString();

                    // save cell id
                    if (i < 14) dtTimestamp = dtTimestamp.AddSeconds(iTimeLapse * -1);
                    udtEvent.Timestamp = dtTimestamp;
                    LocateCellID(udtEvent, udtCellID);
                }
                
                // check message type
                string strCommand = arrData[4];
                switch (strCommand)
                {
                case "SOS":
                    {
                        // panic button is pressed
                        udtEvent.Event = "Panic Button";
                        udtEvent.Remarks = "Emergency";
                        udtEvent.AlertLevel = 2;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "STA":
                    {
                        // phone startup alert
                        udtEvent.Event = "Phone Startup";
                        udtEvent.Remarks = "";
                        udtEvent.AlertLevel = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "LDP":
                    {
                        // low voltage alarm
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Undervoltage";
                        udtEvent.AlertLevel = 2;
                        SaveEvent(udtEvent);
                    }
                    break;
                }

                // update raw data
                udtData.Tag = strDevice;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition8", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime8(string strDate, string strTime)
        {
            try
            {
                // parse timestamp
                string strTimestamp = String.Format("{1}/{2}/{0} {3}:{4}:{5}",
                    strDate.Substring(0, 2), strDate.Substring(2, 2), strDate.Substring(4, 2),
                    strTime.Substring(0, 2), strTime.Substring(2, 2), strTime.Substring(4, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if response (china edusafety protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckDevice8(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse response data
                string[] arrData = strData.Split("&".ToCharArray());
                string strDevice = arrData[1];
                string strUsername = arrData[2];
                string strCommand = arrData[3];
                string strStatus = arrData[4];

                // update raw data
                udtData.Tag = strDevice;
                udtData.Timestamp = dtRxTime;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckDevice8", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 9: SMARTCOMM

        /// <summary>
        /// checks message packet if position (smartcomm protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition9(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            double tmpDbl = 0;//use for tryParse
            int tmpInt = 0;//use for tryParse

            PosInfo udtPos = new PosInfo();
            try
            {
                // check message type if MDT or GG200
                // 0,1,2              ,3  ,4,5     ,6     ,7          ,8           ,9       ,10,11,12,13,14,15,16,17,18,19  ,20,21,22   ,23   ,24,25,26
                // &,1,860585000379007,661,A,140428,092530,N0127.92325,E10348.61119,0.016668,0 ,12,0 ,0 ,0 ,0 ,  ,  ,0 ,0.00,0 , 0,15.03,14.09,  ,0 ,0 ,%E338
                // &,1,860585000379007,663,A,140428,093600,N0127.92138,E10348.61075,0.061116,0,12,0,0,0,0,,,0,0.00,0,0,15.03,14.09,,0,0,%4044
                // &,1,861311002792181,65,A,140908,151816,N0119.41979,E10355.36666,  0.51856 ,0     ,6,0,0,1,0,,,0,0.00,0,0,30.8,8.2,,0,0,%D7D7
                // &,1,861311002792181,421,A,140909,063850,N0119.38599,E10355.32583, 4.359608,206.17,6,0,0,1,0,,,0,0.00,0,0,29.9,8.2,,0,0,%FC30"
                // &,1,861311001673770,1373,A,150131,002744,N0121.20227,E10350.60571,1.572348,0 ,5 ,0 ,0 ,1 ,0 ,  ,  ,0 ,0.00,0 ,0 ,  ,  ,  ,0 ,0 ,%6C5C" - 02Feb2015
                // 0,1,2              ,3   ,4,5     ,6     ,7          ,8           ,9       ,10,11,12,13,14,15,16,17,18,19  ,20,21,22,23,24,25,26
                //&,1,861311001669430,105,A,150203,105656,2480124.0434,03,56.830472,268.35,7,0,0,1,0,,,0,0.00,0,0,4289,260614,,0,0,%8DC3
                string[] arrData = udtData.Data.Split(',');

                int iOffset = (arrData[1].Length == 1 ? 1 : 0);
                
                // parse position data
                udtPos.Tag = arrData[2];
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime9(arrData[4 + iOffset], arrData[5 + iOffset]);
                udtPos.FixID = (arrData[3 + iOffset] == "A" ? 0 : 1);
                //udtPos.Satellites = Convert.ToInt32(arrData[10 + iOffset]); //[Dan:02Feb15] To Eliminate exceptions
                int.TryParse(arrData[10 + iOffset], out tmpInt);
                udtPos.Satellites = tmpInt;

                // check fix
                switch (udtPos.FixID)
                {
                case 0: udtPos.FixID = (udtPos.Satellites > 3 ? 2 : 1); break;//GPS Fix (Good FIX)
                case 1: udtPos.FixID = (udtPos.Satellites > 3 ? 4 : 3); break;
                }

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;

                // check position
                if ((arrData[6 + iOffset] != "") && (arrData[7 + iOffset] != ""))
                {
                    // get position
                    udtPos.PosY = ParseLatLong9(arrData[6 + iOffset].Substring(1));
                    if (arrData[6 + iOffset].Substring(0, 1) == "S") udtPos.PosY *= -1;
                    udtPos.PosX = ParseLatLong9(arrData[7 + iOffset].Substring(1));
                    if (arrData[7 + iOffset].Substring(0, 1) == "W") udtPos.PosX *= -1;

                    //[Dan:02Feb15] To Eliminate exceptions
                    //udtPos.Speed = Convert.ToDouble(arrData[8 + iOffset]);
                    //udtPos.Course = Convert.ToDouble(arrData[9 + iOffset]);
                    //udtPos.Ignition = Convert.ToInt32(arrData[14]);
                    //udtPos.Fuel = Convert.ToDouble(arrData[12]) / 10;
                    //udtPos.Battery = Convert.ToDouble(iOffset == 0 ? arrData[17] : arrData[19]);
                    double.TryParse(arrData[8 + iOffset], out tmpDbl);
                    udtPos.Speed = tmpDbl;
                    double.TryParse(arrData[9 + iOffset], out tmpDbl);
                    udtPos.Course = tmpDbl;
                    int.TryParse(arrData[14], out tmpInt);
                    udtPos.Ignition = tmpInt;
                    double.TryParse(arrData[12], out tmpDbl);
                    udtPos.Fuel = tmpDbl / 10;
                    double.TryParse(iOffset == 0 ? arrData[17] : arrData[19], out tmpDbl);
                    udtPos.Battery = tmpDbl;
                    udtPos.Mileage = 0;
                    //

                    //[Dan:12Jun14] Support for GG700
                    if (arrData[22].Length <= 5)//temperature 
                    {
                        //[Chinky:08Sept2014] Support for Ultrasonic Liquid Level Sensor
                        if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                        {
                            double.TryParse(arrData[22], out tmpDbl);
                            udtPos.FuelLevel = (iOffset == 0 ? 0 : tmpDbl);
                            double.TryParse(arrData[23], out tmpDbl);
                            udtPos.ActualTemp = (iOffset == 0 ? 0 : tmpDbl);
                        }//
                        else
                        {
                            double.TryParse(arrData[22], out tmpDbl);
                            udtPos.Temperature = (iOffset == 0 ? 0 : tmpDbl);
                            double.TryParse(arrData[23], out tmpDbl);
                            udtPos.Temperature2 = (iOffset == 0 ? 0 : tmpDbl);
                        }
                    }
                    else//lat lon in decimal //smartcom provided an alternative (in decimal) location data because their data in NMEA format always result in South China Sea (instead of 1 Pemimpin Drive)
                    {
                        double.TryParse(arrData[22], out tmpDbl);
                        udtPos.PosY = (iOffset == 0 ? 0 : tmpDbl);
                        double.TryParse(arrData[23], out tmpDbl);
                        udtPos.PosX = (iOffset == 0 ? 0 : tmpDbl);
                    }
                    //

                    // save position
                    SavePosition(udtPos);
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition9", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime9(string strDate, string strTime)
        {
            try
            {
                // parse timestamp
                // 140428,060615
                string strTimestamp = String.Format("{1}/{2}/{0} {3}:{4}:{5}",
                    strDate.Substring(0, 2), strDate.Substring(2, 2), strDate.Substring(4, 2),
                    strTime.Substring(0, 2), strTime.Substring(2, 2), strTime.Substring(4, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        private double ParseLatLong9(string strDms)
        {
            // convert coordinate to decimal degrees
            // N 0127.47672, E 10348.70122
            double lDegree = Math.Truncate(Convert.ToDouble(strDms) / 100);
            double lMinutes = Convert.ToDouble(strDms.Substring(strDms.IndexOf(".") - 2));
            return lDegree + (lMinutes / 60);
        }
        #endregion

        #region PROTOCOL 10: SCE ION200

        /// <summary>
        /// checks message packet if position (sce ion200 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition10(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                // 00 0352897045086702 0525053203325047 44180235 0001D671 009DFCAD 005A 012A 2E 77C0 23 13E800 08 4944 520E

                //[Dan:08Aug14] Use this imei to check for real device name
                //udtPos.Tag = strData.Substring(2, 16);
                TagInfo udtTag = m_svcWlocate.GetTag(strData.Substring(2, 16));
                udtPos.Tag = (string.IsNullOrEmpty(udtTag.Name) ? strData.Substring(2, 16) : udtTag.Name);
                //

                udtPos.Timestamp = ParseTime10(strData.Substring(34, 8), strData.Substring(72, 2));
                udtPos.RxTime = dtRxTime;
                udtPos.PosY = ParseLatLong10(strData.Substring(42, 8));
                udtPos.PosX = ParseLatLong10(strData.Substring(50, 8));
                udtPos.PosZ = Convert.ToInt32(strData.Substring(58, 4), 16) * 0.3048; // ft -> m
                udtPos.Course = Convert.ToInt32(strData.Substring(62, 4), 16);
                udtPos.Speed = Convert.ToInt32(strData.Substring(66, 2), 16) * 1.60934; // mph -> kph
                udtPos.Ignition = (udtPos.Speed > 3 ? 1 : -1);
                udtPos.Satellites = Convert.ToInt32(strData.Substring(80, 2), 16);
                udtPos.FixID = (udtPos.Satellites > 3 ? 2 : 1); 
                udtPos.Fix = "";
                udtPos.Mileage = Convert.ToInt32(strData.Substring(82, 4), 16) * 160.934; // miles -> units of 10 m
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition10", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        private double ParseLatLong10(string strDms)
        {
            // 00 01 D8 64 = 120932
            // 1.20932 = 1.3488666666666667
            // convert coordinate to decimal degrees
            strDms = Convert.ToInt32(strDms, 16).ToString();
            double lDegree = Math.Truncate(Convert.ToDouble(strDms) / 100000);
            double lMinutes = Convert.ToDouble(strDms.Substring(strDms.Length - 5)) / 1000;
            return lDegree + (lMinutes / 60);
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime10(string strTimestamp, string strSeconds)
        {
            try
            {
                // parse timestamp
                // 4 4 10 09 05
                string strDate = String.Format("{1}/{2}/{0}", 2010 + Convert.ToInt32(strTimestamp.Substring(0, 1), 16),
                    Convert.ToInt32(strTimestamp.Substring(1, 1), 16), Convert.ToInt32(strTimestamp.Substring(2, 2), 16));
                string strTime = String.Format("{0}:{1}:{2}", Convert.ToInt32(strTimestamp.Substring(4, 2), 16),
                    Convert.ToInt32(strTimestamp.Substring(6, 2), 16), Convert.ToInt32(strSeconds, 16));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (sce ion200 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent10(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // initialize event parameters
                // 13 0352897045086702 0525053203325047 44180139 0001DEDE 009DF723 005E 0042 00 7640 35 18AD00 07 4938
                
                //[Dan:08Aug14] Use this imei to check for real device name
                //udtEvent.Tag = strData.Substring(2, 16);
                TagInfo udtTag = m_svcWlocate.GetTag(strData.Substring(2, 16));
                udtEvent.Tag = (string.IsNullOrEmpty(udtTag.Name) ? strData.Substring(2, 16) : udtTag.Name);
                //
                
                udtEvent.Timestamp = ParseTime10(strData.Substring(34, 8), strData.Substring(72, 2));
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.Flag = 0;

                // check event type
                int iType = Convert.ToInt32(strData.Substring(0, 2), 16) & 0x3F;
                string strType = String.Format("{0:X2}", iType);
                switch (strType)
                {
                case "01":
                    {
                        // hardware reset
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = "Hardware Reset";
                        SaveEvent(udtEvent);
                    }
                    break;
                case "02":
                    {
                        // altitude exceeded
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = String.Format("Altitude Exceeded: {0} m", Convert.ToInt32(strData.Substring(58, 4), 16) * 0.3048); // ft -> m;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "03":
                    {
                        // overspeeding
                        udtEvent.Event = "Speeding";
                        udtEvent.Remarks = String.Format("Speed: {0} kph", Convert.ToInt32(strData.Substring(66, 2), 16) * 1.60934); // mph -> kph
                        SaveEvent(udtEvent);
                    }
                    break;
                case "04":
                case "05":
                    {
                        // GP transition
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = String.Format("GP{0} Transition", (strType == "04" ? 1 : 2));
                        SaveEvent(udtEvent);
                    }
                    break;
                case "06":
                    {
                        // temperature alert
                        udtEvent.Event = "Board Temperature";
                        udtEvent.Remarks = "Temp Above Upper Limit";
                        udtEvent.AlertLevel = 2;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "07":
                    {
                        // zone enter
                        udtEvent.Event = "Zone Enter";
                        udtEvent.Remarks = "";
                        SaveEvent(udtEvent);
                    }
                    break;
                case "08":
                    {
                        // zone exit
                        udtEvent.Event = "Zone Exit";
                        udtEvent.Remarks = "";
                        SaveEvent(udtEvent);
                    }
                    break;
                case "09":
                    {
                        // car battery low
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Car Battery Low";
                        udtEvent.AlertLevel = 1;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "0A":
                    {
                        // backup battery low
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Backup Battery Low";
                        udtEvent.AlertLevel = 1;
                        SaveEvent(udtEvent);
                    }
                    break;
                case "0B":
                    {
                        // distance interval
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = "Distance Interval";
                        SaveEvent(udtEvent);
                    }
                    break;
                case "10":
                    {
                        // ionrn response
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = "IONRN Response";
                        SaveEvent(udtEvent);
                    }
                    break;
                case "12":
                case "13":
                    {
                        // ignition event
                        udtEvent.Event = "Ignition";
                        udtEvent.Remarks = (strType == "12" ? "ON" : "OFF");
                        SaveEvent(udtEvent);
                    }
                    break;
                default:
                    {
                        // debug report
                        udtEvent.Event = "Debug Report";
                        udtEvent.Remarks = strType;
                        SaveEvent(udtEvent);
                    }
                    break;
                }

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent10", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 11: SCE ION300

        /// <summary>
        /// checks message packet if device info (sce ion300 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckDevice11(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            try
            {
                // parse device info
                string[] arrData = strData.Split("|".ToCharArray());
                if (arrData.Length > 1)
                {
                    // update raw data

                    //[Dan:08Aug14] Use this imei to check for real device name
                    //udtData.Tag = arrData[1].Trim();
                    TagInfo udtTag = m_svcWlocate.GetTag(arrData[1].Trim());
                    udtData.Tag = (string.IsNullOrEmpty(udtTag.Name) ? arrData[1].Trim() : udtTag.Name);
                    //
                    
                    udtData.Timestamp = dtRxTime;
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckDevice11", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// checks message packet if position (sce ion300 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition11(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                string[] arrData = strData.Split("|".ToCharArray());
                if (arrData.Length > 1)
                {
                    // parse position data
                    // 6767 02 001B 00D8 53281B3B 009F5D6F 0C7F0F41 2B 015C 01F6000C1FA500F17C 01
                    strData = arrData[0].Trim();

                    //[Dan:08Aug14] Use this imei to check for real device name
                    //udtPos.Tag = arrData[1].Trim();
                    TagInfo udtTag = m_svcWlocate.GetTag(arrData[1].Trim());
                    udtPos.Tag = (string.IsNullOrEmpty(udtTag.Name) ? arrData[1].Trim() : udtTag.Name);
                    //
                    
                    udtPos.Timestamp = ParseTime11(strData.Substring(14, 8));
                    udtPos.RxTime = dtRxTime;
                    udtPos.PosY = ParseLatLong11(strData.Substring(22, 8));
                    udtPos.PosX = ParseLatLong11(strData.Substring(30, 8));
                    udtPos.PosZ = 0;
                    udtPos.Speed = Convert.ToInt32(strData.Substring(38, 2), 16);
                    udtPos.Course = Convert.ToInt32(strData.Substring(40, 4), 16);
                    udtPos.Ignition = -1;
                    string strFix = Convert.ToString(Convert.ToInt32(strData.Substring(62, 2), 16), 2).PadLeft(8, '0');
                    udtPos.FixID = (strFix.Substring(strFix.Length - 1, 1) == "1" ? 2 : 0);
                    udtPos.Fix = "";
                    udtPos.Satellites = (udtPos.FixID == 0 ? 0 : 4);
                    udtPos.Mileage = 0;
                    SavePosition(udtPos);

                    // check if alarm
                    if (strData.Substring(4, 2) != "02")
                        CheckEvent11(strData, dtRxTime, ref udtData);

                    // update raw data
                    udtData.Tag = udtPos.Tag;
                    udtData.Timestamp = udtPos.Timestamp;
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition11", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        private double ParseLatLong11(string strDms)
        {
            // 009F5D6F = 10444143
            // convert coordinate to decimal degrees
            return (((double)(Convert.ToInt32(strDms, 16)) / 30000) / 60);
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime11(string strTimestamp)
        {
            try
            {
                // parse timestamp
                return new DateTime(1970, 1, 1).AddSeconds(Convert.ToInt32(strTimestamp, 16));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// checks message packet if event (sce ion200 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent11(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // parse event data
                string[] arrData = strData.Split("|".ToCharArray());
                if (arrData.Length > 1)
                {
                    // initialize event parameters
                    strData = arrData[0].Trim();

                    //[Dan:08Aug14] Use this imei to check for real device name
                    //udtEvent.Tag = arrData[1].Trim();
                    TagInfo udtTag = m_svcWlocate.GetTag(arrData[1].Trim());
                    udtEvent.Tag = (string.IsNullOrEmpty(udtTag.Name) ? arrData[1].Trim() : udtTag.Name);
                    //
                    
                    udtEvent.Timestamp = dtRxTime;
                    udtEvent.RxTime = dtRxTime;
                    udtEvent.AckUserID = 1;
                    udtEvent.Flag = 0;

                    // check event type
                    string strType = strData.Substring(4, 2);
                    switch (strType)
                    {
                    case "03":
                        {
                            // heartbeat message packet
                            // 0000000 00 00 00 10 1
                            string strHeartbeat = Convert.ToString(Convert.ToInt32(strData.Substring(14, 4), 16), 2).PadLeft(16, '0');

                            // check ignition event
                            udtEvent.Event = "Ignition";
                            udtEvent.Remarks = (strHeartbeat.Substring(13, 2) == "11" ? "ON" : "OFF");
                            SaveEvent(udtEvent);
                        }
                        break;
                    case "04":
                        {
                            // alarm message packet
                            udtEvent.Timestamp = ParseTime11(strData.Substring(14, 8));
                            strType = strData.Substring(64, 2);
                            switch (strType)
                            {
                            case "01":
                                {
                                    // power off
                                    udtEvent.Event = "Power Status";
                                    udtEvent.Remarks = "Power Lost";
                                    udtEvent.AlertLevel = 2;
                                    SaveEvent(udtEvent);
                                }
                                break;
                            case "02":
                                {
                                    // panic button
                                    udtEvent.Event = "Panic Button";
                                    udtEvent.Remarks = "Emergency";
                                    udtEvent.AlertLevel = 2;
                                    SaveEvent(udtEvent);
                                }
                                break;
                            case "03":
                                {
                                    // power low
                                    udtEvent.Event = "Power Status";
                                    udtEvent.Remarks = "Battery Low";
                                    udtEvent.AlertLevel = 1;
                                    SaveEvent(udtEvent);
                                }
                                break;
                            case "08":
                            case "09":
                                {
                                    // gps antenna
                                    udtEvent.Event = "GPS Antenna";
                                    udtEvent.Remarks = (strType == "08" ? "Open" : "Short Circuit");
                                    SaveEvent(udtEvent);
                                }
                                break;
                            case "81":
                            case "82":
                                {
                                    // speeding
                                    udtEvent.Event = "Speeding";
                                    udtEvent.Remarks = (strType == "81" ? "OFF" : "ON");
                                    SaveEvent(udtEvent);
                                }
                                break;
                            case "85":
                            case "86":                                
                                {
                                    // driving alert
                                    udtEvent.Event = "Driving Alert";
                                    udtEvent.Remarks = (strType == "85" ? "Collision" : "Drop");
                                    SaveEvent(udtEvent);
                                }
                                break;
                            default:
                                {
                                    // vibration
                                    udtEvent.Event = "Debug Report";
                                    switch (strType)
                                    {
                                    case "04": udtEvent.Remarks = "Vibration"; break;
                                    case "05": udtEvent.Remarks = "Displacement"; break;
                                    case "06": udtEvent.Remarks = "Blindspot Enter"; break;
                                    case "07": udtEvent.Remarks = "Blindspot Exit"; break;
                                    case "83": udtEvent.Remarks = "Zone Enter"; break;
                                    case "84": udtEvent.Remarks = "Zone Exit"; break;
                                    }
                                    SaveEvent(udtEvent);
                                }
                                break;
                            }
                        }
                        break;
                    case "05":
                    case "06":
                        {
                            // alarm message packet
                            udtEvent.Timestamp = ParseTime11(strData.Substring(14, 8));
                            udtEvent.Event = "Debug Report";
                            udtEvent.Remarks = (strType == "05" ? "Terminal State" : "SMS Command Upload Data");
                            SaveEvent(udtEvent);
                        }
                        break;
                    default:
                        {
                            // debug report
                            udtEvent.Event = "Debug Report";
                            udtEvent.Remarks = strType;
                            SaveEvent(udtEvent);
                        }
                        break;
                    }

                    // update raw data
                    udtData.Tag = udtEvent.Tag;
                    udtData.Timestamp = udtEvent.Timestamp;
                    return true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent11", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 12: MU201

        /// <summary>
        /// checks message packet if position (mu201 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition12(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // parse position data
                // $GPRMC,031516.00,A,2457.81067,N,12125.53896,E,0.216,274.31,140211,,,A*67,AUTO, ,3912,79,135790246811220
                // $GPRMC,012709.00,V,0121.11929,N,10350.58035,E,0.292,,241114,,,A*6C,MOVE,4106,100,21,0,99.9,C0,0,0,0,M1,353816053366441
                // $GPRMC,012837.00,V,0121.11929,N,10350.58035,E,0.292,,241114,,,A*6E,STOP,4106,100,26,0,99.9,C0,0,0,0,M1,353816053366441
                string[] arrData = udtData.Data.Split(',');
                udtPos.Tag = arrData[arrData.Length - 1];
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime12(arrData[9], arrData[1]);
                udtPos.FixID = (arrData[2] == "A" ? 2 : 4);
                udtPos.Satellites = 0;
                udtPos.PosY = ParseLatLong12(arrData[3]);
                if (arrData[4] == "S") udtPos.PosY *= -1;
                udtPos.PosX = ParseLatLong12(arrData[5]);
                if (arrData[6] == "W") udtPos.PosX *= -1;
                udtPos.Speed = Convert.ToDouble(arrData[7]);
                udtPos.Course = (arrData[8] != "" ? Convert.ToDouble(arrData[8]) : 0);
                udtPos.Ignition = -1;
                udtPos.Mileage = 0;

                // check voltage parameter
                if (arrData[14].Contains(";") || arrData[15].Contains(";"))
                {
                    // get battery voltage
                    // $GPRMC,034429.00,A,2457.81213,N,12125.53903,E,0.189,,140211,,,A*7B,SOS,3.934V,3.793;56%,135790246811220
                    // $GPRMC,165724.00,A,2459.57367,N,12126.02097,E,0.671,182.53,180211,,,A*6B,AUTO,3.793;56% (LP),135790246811220
                    int iIndex = (arrData[14].Contains(";") ? 14 : 15);
                    string[] arrTemp = arrData[iIndex].Split(';');
                    udtPos.Battery = Convert.ToDouble(arrTemp[0]);
                    udtPos.Fuel = Convert.ToDouble(arrTemp[1].Substring(0, arrTemp[1].IndexOf('%'))) / 100;
                }
                else if (arrData.Length > 16)
                {
                    // get battery voltage
                    // $GPRMC,032903.00,A,2457.81147,N,12125.53901,E,0.018,,140211,,,A*71,POLL, ,3912,79,135790246811220
                    // $GPRMC,033334.00,A,2457.81122,N,12125.53836,E,0.341,10.26,140211,,,A*5C,MOVE, ,3912,79,135790246811220
                    udtPos.Battery = Convert.ToDouble(arrData[15]) / 1000;
                    udtPos.Fuel = Convert.ToDouble(arrData[16]) / 100;
                }

                // save position
                SavePosition(udtPos);

                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;

                // check event
                CheckEvent12(strData, dtRxTime, ref udtData);
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition12", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime12(string strDate, string strTime)
        {
            try
            {
                // parse timestamp
                // 241114 012709.00
                string strTimestamp = String.Format("{1}/{0}/{2} {3}:{4}:{5}",
                    strDate.Substring(0, 2), strDate.Substring(2, 2), strDate.Substring(4, 2),
                    strTime.Substring(0, 2), strTime.Substring(2, 2), strTime.Substring(4, 2));
                return DateTime.Parse(strTimestamp, CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        private double ParseLatLong12(string strDms)
        {
            // convert coordinate to decimal degrees
            // 0121.11929,N,10350.58035,E
            double lDegree = Math.Truncate(Convert.ToDouble(strDms) / 100);
            double lMinutes = Convert.ToDouble(strDms.Substring(strDms.IndexOf(".") - 2));
            return lDegree + (lMinutes / 60);
        }

        /// <summary>
        /// checks message packet if event (mu201 protocol)
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckEvent12(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // initialize event parameters
                // $GPRMC,034429.00,A,2457.81213,N,12125.53903,E,0.189,,140211,,,A*7B,SOS,3.934V,3.793;56%,135790246811220
                // $GPRMC,012709.00,V,0121.11929,N,10350.58035,E,0.292,,241114,,,A*6C,MOVE,4106,100,21,0,99.9,C0,0,0,0,M1,353816053366441
                // $GPRMC,012837.00,V,0121.11929,N,10350.58035,E,0.292,,241114,,,A*6E,STOP,4106,100,26,0,99.9,C0,0,0,0,M1,353816053366441
                string[] arrData = strData.Split(',');
                udtEvent.Tag = arrData[arrData.Length - 1];
                udtEvent.Timestamp = ParseTime12(arrData[9], arrData[1]);
                udtEvent.RxTime = dtRxTime;
                udtEvent.AckUserID = 1;
                udtEvent.Flag = 0;

                // get event type
                string strEvent = arrData[13];
                if (strEvent.StartsWith("B"))
                    strEvent = strEvent.Substring(1);

                // check event type
                switch (strEvent)
                {
                case "SOS":
                    {
                        // raise panic button alert
                        udtEvent.Event = "Panic Button";
                        udtEvent.Remarks = "Emergency";
                        udtEvent.AlertLevel = 2;
                        SaveEvent(udtEvent);
                    }
                    break;
                /*
                case "MOVE":
                    {
                        // movement
                        udtEvent.Event = "Motion Status";
                        udtEvent.Remarks = "Motion Alert";
                        SaveEvent(udtEvent);
                    }
                    break;
                */
                case "LP":
                    {
                        // main power low
                        udtEvent.Event = "Power Status";
                        udtEvent.Remarks = "Main Power Low";
                        udtEvent.AlertLevel = 1;
                        udtEvent.Flag = 0;
                        SaveEvent(udtEvent);
                    }
                    break;
                }

                // update raw data
                udtData.Tag = udtEvent.Tag;
                udtData.Timestamp = udtEvent.Timestamp;
                return true;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckEvent12", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }
        #endregion

        #region PROTOCOL 13: SMARTCOMM - GG450 

        /// <summary>
        /// checks message packet if position (smartcomm protocol - GG450)
        /// [Dan:17Nov14]
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="dtTimestamp"></param>
        /// <returns></returns>
        private bool CheckPosition13(string strData, DateTime dtRxTime, ref RawData udtData)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // sample data
                // 1st version: &,2008993113,20141114074054,103.802705,1.435211,0,326,0, 7,2,0.0,0,0.04,0.02,0,,0.0,0.0\r
                // 2nd version: &,2009052182,20141124123817,103.898714,1.325996,0,  0,0,13,2,0.0,0,0.02,0.01,0,,170.1,0.0,189.1,0.0\r
                string[] arrData = udtData.Data.Split(',');

                // parse position data
                udtPos.Tag = arrData[1];
                udtPos.RxTime = dtRxTime;
                udtPos.Timestamp = ParseTime10(arrData[2]);
                udtPos.PosX = Convert.ToDouble(arrData[3]);
                udtPos.PosY = Convert.ToDouble(arrData[4]);
                udtPos.Speed = Convert.ToDouble(arrData[5]);
                udtPos.Course = Convert.ToDouble(arrData[6]);
                udtPos.PosZ = Convert.ToInt32(arrData[7]);
                udtPos.Satellites = Convert.ToInt32(arrData[8]);
                //arrData[9] = Report Type ID = 1 = Timer based message
                udtPos.Mileage = Convert.ToDouble(arrData[10]) * 100;
                udtPos.Ignition = Convert.ToInt32(arrData[11]);
                
                udtPos.FuelLevel = Convert.ToDouble(arrData[18]) / 10;//mm to cm
                udtPos.ActualTemp = Convert.ToDouble(arrData[17]);//in Celsius
                udtPos.FixID = (udtPos.Timestamp == new DateTime(2000, 1, 1, 0, 0, 0) ? 0 : 1);
                
                // update raw data
                udtData.Tag = udtPos.Tag;
                udtData.Timestamp = udtPos.Timestamp;

                // save position
                SavePosition(udtPos);
                return true;

            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.CheckPosition13", String.Format("{0}\r{1}", ex.Message, strData));
            }
            return false;
        }

        /// <summary>
        /// converts string to datetime - GG450
        /// [Dan:17Nov14]
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        private DateTime ParseTime10(string strDateTime)
        {
            string strTimestamp = "";
            try
            {
                //20141117 213717
                // parse timestamp
                strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                    strDateTime.Substring(4, 2), strDateTime.Substring(6, 2), strDateTime.Substring(0, 4),
                    strDateTime.Substring(8, 2), strDateTime.Substring(10, 2), strDateTime.Substring(12, 2));
                DateTime timestamp = DateTime.Parse(strTimestamp, System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));
                return timestamp;
            }
            catch(Exception ex)
            {
                DatabaseMgrMySQL.LogError("ParseTime10", string.Format("{0}: {1}", strTimestamp, ex.Message));
            }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        #endregion

        /// <summary>
        /// save cell id as position
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <param name="udtCellID"></param>
        private void LocateCellID(EventInfo udtEvent, CellID udtCellID)
        {
            // build position info
            PosInfo udtPos = new PosInfo();
            udtPos.Tag = udtEvent.Tag;
            udtPos.FixID = -1;
            udtPos.Remarks = String.Format("{0}/{1:00}/{2:X4}/{3:X4}", udtCellID.mcc, udtCellID.mnc, udtCellID.lac, udtCellID.cid);
            udtPos.Timestamp = udtEvent.Timestamp;
            udtPos.RxTime = udtEvent.RxTime;

            // save cell id position
            SavePosition(udtPos);
        }

        /// <summary>
        /// saves new position to database
        /// </summary>
        /// <param name="udtPos"></param>
        private void SavePosition(PosInfo udtPos)
        {
            try
            {
                // save position
                m_svcWlocate.SavePosition(ref m_dbMgr, udtPos);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.SavePosition", ex.Message);
            }
        }

        /// <summary>
        /// saves new event to database
        /// </summary>
        /// <param name="udtEvent"></param>
        private void SaveEvent(EventInfo udtEvent)
        {
            try
            {
                // get supported event types
                if (m_arrEvents.Count == 0)
                    m_arrEvents = m_svcWlocate.GetNames(4, 1);

                // loop through event types
                foreach (NameInfo udtStatus in m_arrEvents)
                {
                    // check event if enabled
                    if (udtStatus.Name == udtEvent.Event)
                    {
                        // save event
                        udtEvent.StatusID = udtStatus.NameID;
                        m_svcWlocate.SaveEvent(ref m_dbMgr, udtEvent, true, true);
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("DeviceProtocol.SaveEvent", ex.Message);
            }
        }
    }
}
