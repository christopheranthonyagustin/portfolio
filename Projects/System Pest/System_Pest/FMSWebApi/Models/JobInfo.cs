using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class JobInfo
    {
        public long JobID { get; set; }
        public string JobNumber { get; set; }
        public string Company { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public DriverInfo DriverInfo { get; set; }
        public int AssetCompanyID { get; set; }
        public string AssetCompany { get; set; }
        public int AssetResellerID { get; set; }
        public string AssetReseller { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public double Amount { get; set; }      
        public string PIC { get; set; }
        public string Destination { get; set; }
        public string Phone { get; set; }
        public string Unit { get; set; }
        public int Flag { get; set; }
        public string FlagValue { get; set; }
        public string Remarks { get; set; }
        public string Receipt { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public string Technician { get; set; }
        public string Postal { get; set; }
        public DateTime JobAccepted { get; set; }
        public DateTime JobCompleted { get; set; }
        public string CusEmail { get; set; }
        public string Site { get; set; }
        public List<PestTreatmentInfo> Pest { get; set; }
        public List<FindingsInfo> Findings { get; set; }
        public AcInfo AcInfo { get; set; }
        public AcMyInfo AcMyInfo { get; set; }
        public double ReceivedAmount { get; set; }   
        public int PaymentType { get; set; }
        public string Recommendations { get; set; }
        public string ReferenceNo { get; set; }
        public int FormType { get; set; }
        public string TechSignatures { get; set; }
        public string TechSignaturesFill { get; set; }
        public string ClientSignatures { get; set; }
        public string ClientSignaturesFill { get; set; }
        public string Forms { get; set; }
        public string FormsFill { get; set; }
        public string Groups { get; set; }
        public string ErrorMessage { get; set; }
    }
}