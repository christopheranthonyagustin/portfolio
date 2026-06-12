using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvc
{
    public class Enums
    {
        public enum DeviceType
        {       
            GG400,
            COBAN103A,
            GG900,
            MDT,
            AT07,
            //N32A,
            //AVL301,
            //GT06N,       
            //MobileEye,
            MDVR,
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
