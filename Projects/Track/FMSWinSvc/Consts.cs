using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvc
{
    public class Consts
    {
        //GG400 Const
        public const string GG400WT_HEAD = "STX";
        public const string GG400WT_DATA = "$GPRMC";

        //Coban103A
        public const string COBAN103A_HEAD = "imei";
        //public const string LOGFILE = DateTime.Now.ToString("ddMMMyy") + "_logs.txt";

        //GG400 Const
        public const string GG900_HEAD = "$MG";
        //public const string GG900_DATA = "$MG";

        //AVL301
        public const string AVL301_HEAD = "24";
        //public const string AVL301_DATA = "";

        //MobileEye
        public const string MobileEye_HEAD = "MobileEye";
        //public const string MobileEye_DATA = "";

        //MDVR
        public const string MDVR_HEAD = "MDVR";
        public const string MDVR_DATA = "";

        //iRevo
        public const string iRevo_HEAD = "iRevo";
        public const string iRevo_DATA = "";
    }
}
