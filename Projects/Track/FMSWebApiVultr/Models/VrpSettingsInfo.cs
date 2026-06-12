using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpSettingsInfo
    {
        public long VrpSettingsID { get; set; }
        public string RouteNo { get; set; }
        public long AssetID { get; set; }
        public string Asset { get; set; }
        public long DriverID { get; set; }
        public string Driver { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public double StartLatitude { get; set; }
        public double StartLongitude { get; set; }
        public string StartAddress { get; set; }
        public string StartUnit { get; set; }
        public string StartBuilding { get; set; }
        public string StartPostal { get; set; }
        public double EndLatitude { get; set; }
        public double EndLongitude { get; set; }
        public string EndAddress { get; set; }
        public string EndUnit { get; set; }
        public string EndBuilding { get; set; }
        public string EndPostal { get; set; }
        public double WeightCapacity { get; set; }
        public double VolumeCapacity { get; set; }
        public double DistanceCapacity { get; set; }
        public int LoadDuration { get; set; }
        public int UnLoadDuration { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
        public DateTime BreaktimeStart { get; set; }
        public DateTime BreaktimeEnd { get; set; }
        public string Features { get; set; }
        public string Regions { get; set; }
        public int isOvertime { get; set; }
        public int CompanyID { get; set; }
        public string ErrorMessage { get; set; }
    }
}