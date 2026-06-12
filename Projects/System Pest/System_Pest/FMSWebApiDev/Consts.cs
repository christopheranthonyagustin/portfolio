using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi
{
    public class Consts
    {
        public const string PROJECT_NAME = "TRACKLitePro";
		public const int MIN_SPEED = 5;
        public const string DBConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;";
		
        //Asset/Vehicle Error messages
        public const string ERR_ASSET_CATEGORYERROR = "Category Error";
        public const string ERR_ASSET_DEVICEINUSE = "Device already assigned. Select a different device for vehicle.";
        public const string ERR_DRIVERERROR = "Phone User Error";
        public const string ERR_COMPANYERROR = "Company Error";
        public const string ERR_RESELLERERROR = "Reseller Error";
        public const string ERR_JOBERROR = "Job Error";
        public const string ERR_DEVICE_ERROR = "Device Error";
        public const string ERR_EVENTERROR = "Event Error";
        public const string ERR_USER_ROLEERROR = "Role Error";
        public const string ERR_USER_LANGUAGEERROR = "Language Error";
        public const string ERR_ASSETERROR = "Asset Error";
        public const string ERR_LOGIN = "Invalid User";
        public const string ERR_LOGINDRIVER = "Invalid Phone User";
        public const string ERR_LOGINDRIVERDUPLICATE = "Phone User didn't logout";
    }
}