using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class PosInfo
    {
        public long PosID { get; set; }
        public int TagID { get; set; }
        public string Tag { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string Driver { get; set; }
        public int FixID { get; set; }
        public string Fix { get; set; }
        public int Satellites { get; set; }
        public double PosX { get; set; }
        public double PosY { get; set; }
        public double PosZ { get; set; }
        public double Speed { get; set; }
        public double Course { get; set; }
        public double HDOP { get; set; }        
        public int Ignition { get; set; }
        public string Engine { get; set; }
        public double Mileage { get; set; }
        public double Battery { get; set; }
        public double Fuel { get; set; }
        public long LocID { get; set; }
        public string Location { get; set; }
        public int ZoneID { get; set; }
        public string Zone { get; set; }
        public string Remarks { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public Double Temperature { get; set; }
        public Double Temperature2 { get; set; }
        public string RFID { get; set; }
        public Double FuelLevel { get; set; }
        public Double ActualTemp { get; set; }
        public bool IsBuffer { get; set; }
    }
}