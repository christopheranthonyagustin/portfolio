using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class ZoneInfo
    {
        public int ZoneID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int TypeID { get; set; }
        public string Perimeter { get; set; }
        public string CellIds { get; set; }
        public string Location { get; set; }
        public string Company { get; set; }
        public int CompanyID { get; set; }
        public int ResellerID { get; set; }
        public string Color { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string Tag { get; set; }
        public string TagID { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastModified { get; set; }
        public int Created_UserID { get; set; }
        public int Modified_UserID { get; set; }
        public string Created_User { get; set; }
        public string Modified_User { get; set; }
        public string ErrorMessage { get; set; }
        //public List<ZoneTap> ZoneTapInfo { get; set; }
    }
}