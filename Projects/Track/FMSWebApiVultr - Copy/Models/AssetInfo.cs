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
        public int AssetID { get; set; }
        public string Name { get; set; }
        public int DriverID { get; set; }
        public DriverInfo Driver { get; set; }
        public string DriverName { get; set; }
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
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public DateTime InstallDate { get; set; }


        // alert status
        public int StatusID { get; set; }
        public string Status { get; set; }
        public string StatusEx { get; set; }
        public string Remarks { get; set; }
        public int AlertLevel { get; set; }
		public int Gps { get; set; }
        public int Gprs { get; set; }
        public double IdleLimit { get; set; }
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
        public double Speed { get; set; }
        public int Ignition { get; set; }
        public double Mileage { get; set; }
        public double MileageDist { get; set; }
        public DateTime MileageDate { get; set; }
        public string Engine { get; set; }

        //New Update
        public int MakeID { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string LicensePlate { get; set; }
        public int TransmissionID { get; set; }
        public string Transmission { get; set; }
        public int FuelTypeID { get; set; }
        public string FuelType { get; set; }
        public string ChassisNo { get; set; }
        public int ModelYear { get; set; }
        public DateTime ImmatriculationDate { get; set; }
        public DateTime FirstContractDate { get; set; }
        public double CatalogValue { get; set; }
        public double ResidualValue { get; set; }
        public int SeatNo { get; set; }
        public int DoorNo { get; set; }
        public string Color { get; set; }
        public double CO2 { get; set; }
        public int Horsepower { get; set; }
        public double HorsepowerTaxation { get; set; }
        public int Power { get; set; }

        public string ErrorMessage { get; set; }
        public string Flag { get; set; }

    }
}