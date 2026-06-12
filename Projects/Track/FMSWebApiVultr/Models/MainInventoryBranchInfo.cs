using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class MainInventoryBranchInfo
    {
        public long BranchID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int CompanyID { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }

    }
}