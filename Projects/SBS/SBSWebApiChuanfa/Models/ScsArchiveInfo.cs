using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class ScsArchiveInfo
    {

        public DateTime OP_DATE { get; set; }
        public DateTime OP_DATE_START { get; set; }
        public DateTime OP_DATE_END { get; set; }
        public string SVC_NO { get; set; }
        public int DRV_NO { get; set; }
        public int InterchangeID { get; set; }
        public string Interchange { get; set; }
        public int DepotID { get; set; }
        public string Depot { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}