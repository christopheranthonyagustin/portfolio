using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class ContractAlertInfo
    {
        public long ContractAlertID { get; set; }
        public long ContractID { get; set; }
        public DateTime AlertDate { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public DateTime ContractCancelled { get; set; }
        public string CancelRemarks { get; set; }
        public int CompanyID { get; set; }
        public int isSent { get; set; }
        public int Flag { get; set; }
        public string FlagValue { get; set; }
    }
}