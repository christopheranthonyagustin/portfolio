using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvc
{
    public static class Device
    {
        public static string IMEI { get; set; }
        public static string Interval { get; set; }

        public static Enums.DeviceType GetType(string rawData)
        {
            if (rawData.Contains(Consts.GG400WT_HEAD))
                return Enums.DeviceType.GG400;
            else if (rawData.Contains(Consts.COBAN103A_HEAD))
                return Enums.DeviceType.COBAN103A;
            else if (rawData.Contains(Consts.N32A_HEAD))
                return Enums.DeviceType.N32A;
            else if (rawData.Contains(Consts.GG900_HEAD))
                return Enums.DeviceType.GG900;
            //else if (rawData.Contains(Consts.AVL301_HEAD))
            //    return Enums.DeviceType.AVL301;
            else if (rawData.Contains(Consts.MobileEye_HEAD))
                return Enums.DeviceType.MobileEye;
            //else if (rawData.Contains(Consts.MDVR_HEAD))
            //    return Enums.DeviceType.MDVR;
            //else if (rawData.Contains(Consts.iRevo_HEAD))
            //    return Enums.DeviceType.iRevo;
            else
                return Enums.DeviceType.UNKNOWN;
        }
    }
}
