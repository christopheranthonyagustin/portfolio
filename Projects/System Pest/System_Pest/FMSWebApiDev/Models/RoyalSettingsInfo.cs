using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class RoyalSettingsInfo
    {
        public string EndpointURL { get; set; }
        public string Host { get; set; }
        public int Port { get; set; }
        public int TimeInterval { get; set; }
        public string AlertTitle { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public int CountDown { get; set; }
        public bool LoginUsername { get; set; }
        public bool LoginPassword { get; set; }
        public bool Paramedic { get; set; }
        public bool Driver { get; set; }
        public bool DateTime { get; set; }
        public bool Patient { get; set; }
        public bool Caller { get; set; }
        public bool CallerContact { get; set; }
        public bool MedCondition { get; set; }
        public bool Remarks { get; set; }
        public bool Trip { get; set; }
        public bool Amount { get; set; }
        public bool NewAmount { get; set; }
        public bool Payment { get; set; }
        public bool Origin { get; set; }
        public bool Destination { get; set; }
        public bool Unit { get; set; }
        public bool Bed { get; set; }
        public bool Accesories { get; set; }
        public bool Receipt { get; set; }
        public bool JobConn { get; set; }
        public bool GPSConn { get; set; }
        public string ErrorMessage { get; set; }

    }
}