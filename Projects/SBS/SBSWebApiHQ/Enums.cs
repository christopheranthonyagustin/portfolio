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

         public enum StatusColorInt
        {
            GREEN = 0,
            AMBER = 1,
            RED = 2
        }		
		
		public enum PosInfoType
        {
            Event = 1,
            Enter = 2,
            Exit = 3,
            Pos = 4,
            Fix = 5,
            GPS = 6,
            Move = 7,
            Idle = 8,
            Ignition = 9,
            Temperature = 10,
            MileageDist = 11,
            Mileage = 12,
            ReverseGeocode = 13, 
            LiquidLevel = 14, 
            RFID = 15 
        }
    }
}