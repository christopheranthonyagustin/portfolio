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
        public string Driver { get; set; }
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
        public bool Selected { get; set; }

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

        //// activity info
        //public List<ActivityInfo> Activities { get; set; }
        //public List<TripInfo> Trips { get; set; }
        ////public List<ZoneTap> TapInfo { get; set; }

        /// <summary>
        /// class constructor
        /// </summary>
        /// <param name="udtAsset"></param>
        //public AssetPosEx(AssetInfo udtAsset)
        //{
        //    try
        //    {
        //        // asset info
        //        this.Asset = udtAsset;
        //        this.AssetID = udtAsset.AssetID;
        //        this.Name = udtAsset.Name;
        //        this.CategoryID = udtAsset.CategoryID;
        //        this.Category = udtAsset.Category;
        //        this.TagID = udtAsset.TagID;
        //        this.Tag = udtAsset.Tag;
        //        this.TagPhoneNo = udtAsset.TagPhone;
        //        this.Driver = udtAsset.Driver;
        //        this.Phone = udtAsset.Phone;
        //        this.Company = udtAsset.Company;
        //        this.Home = udtAsset.Home;
        //        this.AlertZones = udtAsset.AlertZones;
        //        this.CurfewStart = udtAsset.CurfewStart;
        //        this.CurfewEnd = udtAsset.CurfewEnd;
        //        //this.Icon = String.Format("images/category_{0}.png", udtAsset.CategoryID);
        //        this.Icon = String.Format("images/category_{0}.png", (udtAsset.CategoryID > 26 ? 10 : udtAsset.CategoryID));
        //        this.Image = udtAsset.Image;
        //        this.ImageFill = udtAsset.ImageFill;
        //        this.Temperature = 0.0;
        //        this.Temperature2 = 0.0;
        //        this.RFID = "";

        //        // alert status
        //        this.StatusID = udtAsset.StatusID;
        //        this.Status = udtAsset.Status;
        //        this.StatusEx = udtAsset.StatusEx;
        //        this.Remarks = udtAsset.Remarks;
        //        this.AlertLevel = udtAsset.AlertLevel;
        //        this.AlertShow = (udtAsset.AlertLevel > 0) ? "Visible" : "Collapsed";

        //        // check gps status
        //        switch (udtAsset.Gps)
        //        {
        //            case 0: this.GpsColor = "#598527"; break;//green
        //            case 1: this.GpsColor = "#e88105"; break;//amber
        //            case 2: this.GpsColor = "#a00000"; break;//red
        //            default: this.GpsColor = "Transparent"; break;
        //        }

        //        // check gprs status
        //        switch (udtAsset.Gprs)
        //        {
        //            case 0: this.GprsColor = "#598527"; break;
        //            case 1: this.GprsColor = "#e88105"; break;
        //            case 2: this.GprsColor = "#a00000"; break;
        //            default: this.GprsColor = "Transparent"; break;
        //        }

        //        // get alert color
        //        switch (udtAsset.AlertLevel)
        //        {
        //            case 1: this.AlertColor = "#e88105"; break;
        //            case 2: this.AlertColor = "#a00000"; break;
        //            default: this.AlertColor = "Transparent"; break;
        //        }

        //        // get last positions
        //        this.Engine = "STOP";
        //        this.LastPos = udtAsset.LastPos;
        //        this.LastGps = udtAsset.LastGps;

        //        // check position
        //        if (this.LastPos != null)
        //        {
        //            // position info
        //            this.FixID = this.LastPos.FixID;
        //            this.Fix = this.LastPos.Fix;
        //            this.Satellites = this.LastPos.Satellites;
        //            this.PosX = this.LastPos.PosX;
        //            this.PosY = this.LastPos.PosY;
        //            this.PosZ = this.LastPos.PosZ;
        //            this.Speed = this.LastPos.Speed;
        //            this.Course = this.LastPos.Course;
        //            this.HDOP = this.LastPos.HDOP;
        //            this.Ignition = this.LastPos.Ignition;
        //            this.Mileage = this.LastPos.Mileage;
        //            this.Battery = this.LastPos.Battery;
        //            this.Fuel = this.LastPos.Fuel;
        //            this.Timestamp = this.LastPos.Timestamp;
        //            this.RxTime = this.LastPos.RxTime;
        //            this.Location = String.Format("{0}\r{1}", this.LastPos.Zone, this.LastPos.Location).Trim();
        //            this.Engine = this.LastPos.Engine;
        //            this.Temperature = udtAsset.Temperature;
        //            this.Temperature2 = udtAsset.Temperature2;
        //            this.RFID = (udtAsset.RFID != null ? udtAsset.RFID : "");
        //        }

        //        // check engine status
        //        switch (this.Engine.ToUpper())
        //        {
        //            case "MOVE": this.EngineColor = "#598527"; break;
        //            case "STOP": this.EngineColor = "#495f75"; break;
        //            case "IDLE": this.EngineColor = "#e88105"; break;
        //        }

        //        // get activities
        //        this.Activities = (udtAsset.Activities == null ? new List<ActivityInfo>() : udtAsset.Activities);//[Dan:11Aug14] Added initializer in case list is null
        //        this.Trips = (udtAsset.Trips == null ? new List<TripInfo>() : udtAsset.Trips);//[Dan:11Aug14] Added initializer in case list is null
        //        //this.TapInfo = udtAsset.TapInfo;
        //    }
        //    catch { }
        //}

    }
}