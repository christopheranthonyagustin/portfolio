using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class ScsInfo
    {

        public DateTime OP_DATE { get; set; }
        public string BUS_NO { get; set; }
        public string SVC_NO { get; set; }
        public int DRV_NO { get; set; }
        public string DUTY_NO { get; set; }
        public string ACT_DEP_TIME { get; set; }
        public string ACT_ARR_TIME { get; set; }
        public string RESN_CODE_FOR_DEP { get; set; }
        public string RESN_DESC { get; set; }
        public string REMARKS_FOR_DEP { get; set; }
        public DateTime RX_TIME { get; set; }
        public int InterchangeID { get; set; }
        public string Interchange { get; set; }
        public int DepotID { get; set; }
        public string Depot { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}