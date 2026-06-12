using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class AssetInfo
    {
        // asset info
        //public AssetInfo Asset { get; set; }
        public int AssetID { get; set; }
        public string Name { get; set; }
        public int DriverID { get; set; }
        public DriverInfo Driver { get; set; }
        public int CategoryID { get; set; }
        public string Category { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Company { get; set; }
        public int CompanyID { get; set; }
        public int Home { get; set; }
        public string AlertZones { get; set; }
        public DateTime CurfewStart { get; set; }
        public DateTime CurfewEnd { get; set; }
        public int TagID { get; set; }
        public string Tag { get; set; }
        public string TagPhoneNo { get; set; }
        public string Icon { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string strImage { get; set; }
        public bool Selected { get; set; }
        public DateTime InstallDate { get; set; }


        // alert status
        public int StatusID { get; set; }
        public string Status { get; set; }
        public string StatusEx { get; set; }
        public string Remarks { get; set; }
        public string AlertShow { get; set; }
        public int AlertLevel { get; set; }
        public string AlertColor { get; set; }
        public string GpsColor { get; set; }
        public string GprsColor { get; set; }
		public int Gps { get; set; }
        public int Gprs { get; set; }

        public double SpeedLimit { get; set; }

        // position info
        public PosInfo LastPos { get; set; }
        public PosInfo LastGps { get; set; }
        public long LastEventID { get; set; }
        public long LastEnterID { get; set; }
        public long LastExitID { get; set; }
        public long LastPosID { get; set; }
        public long LastFixID { get; set; }
        public long LastGpsID { get; set; }
        public DateTime LastIdle { get; set; }
        public DateTime LastMove { get; set; }

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
        //public string Ignition { get; set; }
        public double Mileage { get; set; }
        public double Battery { get; set; }
        public double Fuel { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Location { get; set; }
        public string Engine { get; set; }
        public string EngineColor { get; set; }
        public double Temperature { get; set; }
        public double Temperature2 { get; set; }
        public string RFID { get; set; }

        public string ErrorMessage { get; set; }

        public int PosTypeID { get; set; }

        public int PosID { get; set; }

        public string Notified { get; set; }

        public int Port { get; set; }
        public string TagType { get; set; }
        public int DepotID { get; set; }
        public int InterchangeID { get; set; }

    }
}