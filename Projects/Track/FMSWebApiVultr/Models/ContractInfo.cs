using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class ContractInfo
    {
        public long ContractID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Name { get; set; }
        public string ContractNo { get; set; }
        public long AssetID { get; set; }
        public string Asset { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public int ContractTypeID { get; set; }
        public string ContractType { get; set; }
        public int CompanyID { get; set; }
        public int UserID { get; set; }
        public DateTime InvoiceDate { get; set; }
        public DateTime ContractStart { get; set; }
        public DateTime ContractEnd { get; set; }
        public string ContractInterval { get; set; }
        public string NotificationInterval { get; set; }
        public string TermsAndConditions { get; set; }
        public double OdometerAtCreation { get; set; }
        public double ContractPrice { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        //public List<ContractAlertInfo> ContractJob { get; set; }
    }
}