using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class PatientInfo
    {
      
        public int PatientID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string DialysisCentre { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string CallerPhone { get; set; }
        public string CallerName { get; set; }
        public int ResellerID { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public int BloodType { get; set; }
        public string Remarks { get; set; }
        public string Remarks2 { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }
        public string Email { get; set; }
        public string Unit { get; set; }
        public string TreatmentDay1 { get; set; }
        public string TreatmentDay2 { get; set; }
        public string TreatmentDay3 { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}