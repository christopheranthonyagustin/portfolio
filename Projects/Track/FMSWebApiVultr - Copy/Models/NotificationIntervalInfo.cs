using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{

    public class NotificationIntervalInfo
    {
        public int NotifID { get; set; }
        public int Unit { get; set; }
        public int UnitID { get; set; }
        public string Description { get; set; }
    }
}