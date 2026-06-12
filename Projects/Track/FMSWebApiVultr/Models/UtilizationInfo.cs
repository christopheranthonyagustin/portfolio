using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class UtilizationInfo
    {
      public long UtilId {get; set;}
      public long AssetID {get; set;}
      public string Driver {get; set;}
      public DateTime Date {get; set;}
      public DateTime StartTime {get; set;}
      public DateTime EndTime {get; set;}
      public double Stop {get; set;}
      public double StopEx {get; set;}
      public double Idle {get; set;}
      public double Move {get; set;}
      public int StopCount {get; set;}
      public double Mileage {get; set;}
      public DateTime LastIgnition {get; set;}
      public string Location {get; set;}
      public string Asset {get; set;}
      public int CategoryId {get; set;}
      public int CompanyId {get; set;}
      public string Tag {get; set;}
      public string Category { get; set; }
    }
}