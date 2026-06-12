using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class TriggerInfo
    {
        public long PosID { get; set; }
        public double PosX { get; set; }
        public double PosY { get; set; }
        public double Speed { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Headway { get; set; }
        public string Event { get; set; }
        public string EventValue { get; set; }
        public DateTime OpDate  { get; set; }
        public string SvcNo { get; set; }
        public int DrvNo { get; set; }
        public string Drv { get; set; }
        public string DutyNo { get; set; }
        public int CompanyID { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }

    }
}