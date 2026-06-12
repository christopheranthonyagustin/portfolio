using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// event info
    /// </summary>
    public class EventInfo
    {

        public long EventID { get; set; }

        public int TagID { get; set; }

        public string Tag { get; set; }

        public int AssetID { get; set; }

        public string Asset { get; set; }

        public string Driver { get; set; }

        public string Event { get; set; }

        public int StatusID { get; set; }

        public string Remarks { get; set; }

        public int AlertLevel { get; set; }

        public int AlertLevelEx { get; set; }

        public int Flag { get; set; }

        public long PosID { get; set; }

        public PosInfo Position { get; set; }

        public string Location { get; set; }

        public int ZoneID { get; set; }

        public ZoneInfo Zone { get; set; }

        public DateTime Timestamp { get; set; }

        public DateTime RxTime { get; set; }

        public int AckUserID { get; set; }
        public int AckRoleID { get; set; }

        public string AckUser { get; set; }

        public DateTime AckTime { get; set; }

        public int CompanyID { get; set; }

        public string RFID { get; set; }

        public string ErrorMessage { get; set; }
        public double Speed { get; set; }

    }
}