using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// user info
    /// </summary>
    public class UserInfo
    {
        public int UserID { get; set; }
        public string Name { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public int RoleID { get; set; }
        public string Role { get; set; }
        public string Phone{ get; set; }
        public string Email { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public string Assets { get; set; }
        public string Notifications { get; set; }
        public string Status { get; set; }
        public string Reports { get; set; }
        public int LanguageID { get; set; }
        public string Language { get; set; }
        public string Culture { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
    }
}