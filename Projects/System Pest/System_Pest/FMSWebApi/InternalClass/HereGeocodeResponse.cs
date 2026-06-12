using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi.Here
{
    public class HereGeoCodeResponse
    {
        public Response Response { get; set; }
        public View[] View { get; set; }
    }


    public class Response
    {
        public MetaInfo MetaInfo { get; set; }
    }

    public class MetaInfo
    {
        public DateTime Timestamp { get; set; }

    }

    public class View
    {
        public string _type { get; set; }
        public string ViewId { get; set; }
        public Result[] Result { get; set; }

    }

    public class Result
    {
        public string Relevance { get; set; }
        public string Distance { get; set; }
        public string MatchLevel { get; set; }
        public MatchQuality MatchQuality { get; set; }
        public Location Location { get; set; }
        public NavigationPosition NavigationPosition { get; set; }
        public MapView MapView { get; set; }
        public Address Address { get; set; }
        public MapReference MapReference { get; set; }

    }

    public class MatchQuality
    {
        public string Country { get; set; }
        public string County { get; set; }
        public string City { get; set; }
        public string District { get; set; }
        public string[] Street { get; set; }

    }


    public class Location
    {
        public string LocationId { get; set; }
        public string LocationType { get; set; }
        public DisplayPosition DisplayPosition { get; set; }

    }

    public class DisplayPosition
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }

    }

    public class NavigationPosition
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }

    }

    public class MapView
    {
        public TopLeft TopLeft { get; set; }
        public BottomRight BottomRight { get; set; }

    }

    public class TopLeft
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }

    }
    public class BottomRight
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }

    }
    public class Address
    {
        public string Label { get; set; }
        public string Country { get; set; }
        public string County { get; set; }
        public string City { get; set; }
        public string District { get; set; }
        public string Street { get; set; }
        public AdditionalData[] AdditionalData { get; set; }

    }

    public class AdditionalData
    {
        public string value { get; set; }
        public string key { get; set; }

    }

    public class MapReference
    {
        public string ReferenceId { get; set; }
        public string MapId { get; set; }
        public string MapVersion { get; set; }
        public string Spot { get; set; }
        public string SideOfStreet { get; set; }
        public string CountryId { get; set; }
        public string CountyId { get; set; }
        public string CityId { get; set; }
        public string DistrictId { get; set; }


    }

}
