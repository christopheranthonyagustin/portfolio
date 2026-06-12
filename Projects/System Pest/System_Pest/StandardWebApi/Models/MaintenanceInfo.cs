using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class MaintenanceInfo
    {
        public long MaintenanceID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Address { get; set; }
        public string Postal { get; set; }
        public string Unit { get; set; }
        public string CusCompany { get; set; }
        public string PIC { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Site { get; set; }
        public DateTime ContractStart { get; set; }
        public DateTime ContractEnd { get; set; }
        public string MaintenanceInterval { get; set; }
        public string NotificationInterval { get; set; }
        public string Remarks { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string ParamFlag { get; set; }
        public string ReferenceNo { get; set; }
        public List<MaintenanceJobInfo> MaintenanceJob { get; set; }
    }
}