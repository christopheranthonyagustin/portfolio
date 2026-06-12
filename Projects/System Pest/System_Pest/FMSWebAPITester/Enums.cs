using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi
{
    public class Enums
    {
        public enum DeviceType
        {
            UNKNOWN,
            GG400,
            COBAN103A
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