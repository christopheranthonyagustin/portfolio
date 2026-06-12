using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSMsg
{
    public class Enums
    {
        public enum DeviceType
        {       
            GG400,
            COBAN103A,
            GG900,
            N32A,
            //AVL301,
            MobileEye,
            //MDVR,
            //iRevo,
            UNKNOWN
         
        };

        public enum Engine
        {
            STOP,
            IDLE,
            MOVE
        }

        public enum Status
        {
            Enabled,
            Disabled
        }
    }
}
