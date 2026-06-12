using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WlocateWeb
{
    /// <summary>
    /// starcuff web service interface
    /// </summary>
    [ServiceContract]
    public interface IFmsWcf
    {
        /// <summary>
         /// RFID Structure
         /// [Dan:21Jul14] Added from Soonpoh source by Marlo 
         /// </summary>
         /// <param name="iUserID"></param>
         /// <returns></returns>
        [OperationContract] List<RFIDInfo> GetRFID(int iUserID);
        [OperationContract] string DeleteRFID(RFIDInfo rfid);
        [OperationContract] string SaveRFID(RFIDInfo rfid);
        [OperationContract] string GetRFIDDriver(string rfidCode);

         /// <summary>
         /// driver structure
         ///[Dan:21Jul14] Added from Soonpoh source by Marlo
         /// </summary>
         /// <param name="iUserID"></param>
         /// <returns></returns>
        [OperationContract] List<DriverInfo> GetDrivers(int iUserID);
        [OperationContract] string SaveDriver(DriverInfo udtDriver, int iUserID);
        [OperationContract] string DeleteDriver(int iDriverID);
        [OperationContract] string SaveDrivers(List<DriverInfo> arrDrivers, int iUserID);
        [OperationContract] DateTime GetDriverLogin(DateTime dtDateLocal, int iDriverID, int iAssetID, int iUserID, int iCompanyID);
        [OperationContract] List<DriverInfo> GetDriverLogins(DateTime dtStartLocal, DateTime dtEndLocal, int iDriverID, int iAssetID, int iUserID, int iCompanyID);

        /// <summary>
        /// other functions
        /// </summary>
        /// <returns></returns>
        [OperationContract] string CheckLicense(int iUserID);
        [OperationContract] string GetAppKey(string strKey);
        [OperationContract] DateTime GetServerTime();
        [OperationContract] List<FeatureInfo> GetFeatures();
        [OperationContract] List<NameInfo> GetNames(int iType, int iUserID);
        [OperationContract] Dictionary<string, string> GetStrings(int iLanguageID);
        [OperationContract] Dictionary<string, string> GetApiKeys();
        [OperationContract] string GetServerNoticeMessage();
        [OperationContract] string UpdateMileageReport(int iCompanyID, DateTime dtStart, DateTime dtEnd);

        /// <summary>
        /// company functions
        /// </summary>
        /// <returns></returns>
        [OperationContract] List<CompanyInfo> GetAllCompanies(int iUserID);
        [OperationContract] List<CompanyInfo> GetCompanies(int iUserID);
        [OperationContract] string SaveCompany(CompanyInfo udtCompany);
        [OperationContract] string DeleteCompany(int iCompanyID);

        /// <summary>
        /// user functions
        /// </summary>
        /// <returns></returns>
        [OperationContract] List<UserInfo> GetUsers(int iUserID);
        [OperationContract] string SaveUser(UserInfo udtUser);
        [OperationContract] string DeleteUser(int iUserID);

        /// <summary>
        /// user log in functions
        /// </summary>
        [OperationContract] string LogInUser(string User, string Password);
        [OperationContract] UserInfo GetUser(string Key);
        [OperationContract] Response ResetPassword(string User, string Email);    
        [OperationContract] string UnlockUser(int iUserID);
 
        /// <summary>
        /// user activity functions
        /// </summary>
        [OperationContract] List<GenUserActivityInfo> GetUserActivity(GenUserActivityInfo userActivity);
        [OperationContract] string SaveUserActivity(int iUserID, DateTime dtStart, DateTime dtEnd, bool isLoginFreqUpdated);

        /// <summary>
        /// geocode/address functions
        /// </summary>
        [OperationContract] string Geocode(string strLocation);
        [OperationContract] string ReverseGeocode(double lLatitude, double lLongitude);
        [OperationContract] string UpdateNoAddress(int iUserID, int companyID);
        [OperationContract] AssetInfo UpdateAddress(AssetInfo udtAsset);

        /// <summary>
        /// zone functions
        /// </summary>
        [OperationContract] List<ZoneInfo> GetZones(int iUserID);
        [OperationContract] List<ZoneInfo> GetActiveZones(int iUserID);
        [OperationContract] string SaveZone(ZoneInfo udtZone);
        [OperationContract] string DeleteZone(int iZoneID);

        /// <summary>
        /// tag functions
        /// </summary>
        [OperationContract] List<TagInfo> GetTags(int iUserID);
        [OperationContract] TagInfo GetTag(string Imei);//[Dan:25Mar14]
        [OperationContract] string SaveTag(TagInfo udtTag);
        [OperationContract] string DeleteTag(int iTagID);

        /// <summary>
        /// asset functions
        /// </summary>
        /// <returns></returns>
        [OperationContract] AssetInfo GetAsset(string strTag);
        [OperationContract] List<AssetInfo> GetAssets(int iUserID);
        [OperationContract] List<AssetInfo> GetAssetsEx(int iUserID, int iCompanyID);
        [OperationContract] string SaveAsset(AssetInfo udtAsset, int iUserID);
        [OperationContract] string DeleteAsset(int iAssetID);
        [OperationContract] List<ZoneInfo> GetAssetZones(int iAssetID, int iCompanyID);
        [OperationContract] List<AssetInfo> GetAssetsAll(int iUserID); //[Chinky:20Nov2013]
        [OperationContract] List<DownAssetsInfo> GetDownAssets(int numnotified, int downminutes);
        [OperationContract] int UpdateNotifiedDownAssets(string assetid);

        /// <summary>
        /// api functions
        /// </summary>
        [OperationContract] List<AssetInfo> GetAssetsApi(string strKey);
        [OperationContract] List<PosInfo> GetPositionsApi(PosInfo posFilter, string strKey);

        /// <summary>
        /// locate asset functions
        /// </summary>
        [OperationContract] List<AssetInfo> FindAssets(string strPhone, string strName);
        [OperationContract] AssetInfo FindAsset(long iPosID);
        [OperationContract] AssetInfo FindAssetByName(string strName);
        
        /// <summary>
        /// activity functions
        /// </summary>
        [OperationContract] List<ActivityInfo> GetActivities(ActivityInfo actFilter, int iUserID, string strCompany);
        [OperationContract] string SaveActivity(ActivityInfo udtActivity, int iUserID);
        [OperationContract] string SaveActivities(List<ActivityInfo> arrActivities, int iUserID);
        [OperationContract] string UpdateActivity(long iActivityID, int iStatusID);
        [OperationContract] string DeleteActivity(long iActivityID);
        [OperationContract] string DeleteActivities(string strActivityIds);
        
        /// <summary>
        /// trip plan functions
        /// </summary>
        [OperationContract] List<PlanInfo> GetPlans(int iUserID, string strCompany);
        [OperationContract] string SavePlan(PlanInfo udtPlan);
        [OperationContract] string SavePlans(List<PlanInfo> arrPlans);
        [OperationContract] string DeletePlan(int iPlanID);

        /// <summary>
        /// trip functions
        /// </summary>
        [OperationContract] List<TripInfo> GetTrips(EventInfo evtFilter, int iUserID, string strCompany);
        [OperationContract] string DeleteTrip(long iTripID);
        [OperationContract] List<TripInfo> RegenTrips(string tag, DateTime startdate, DateTime enddate);

        /// <summary>
        /// trip regeneration help functions
        /// [Dan:13Oct2013]
        /// </summary>
        [OperationContract] DateTime GetPresenceInZone(PosInfo udtPos, int statusId, string zone);
        [OperationContract] long GetEntryTimeOriginZone(TripInfo udtTrip, int statusId, string zone, DateTime dtStart, DateTime dtEnd);
        [OperationContract] DateTime GetEntryTimeDestinationZone(TripInfo udtTrip, int statusId, string zone, DateTime dtStart, DateTime dtEnd);
        [OperationContract] double GetPosInfo(long posID);
        [OperationContract] List<PlanInfo> RegenGetPlans(int iDestID, string strCompany);

        /// <summary>
        /// trip zones functions
        /// </summary>
        [OperationContract] List<TripZoneInfo> GetTripsZone(TripZoneInfo udtTripZone, int iUserID, string strCompany);

        /// <summary>
        /// event functions
        /// </summary>
        [OperationContract] List<EventInfo> GetEvents(EventInfo evtFilter, int iUserID, string strCompany);
        [OperationContract] string SaveEvent(EventInfo udtEvent);
        [OperationContract] string CancelEvent(EventInfo udtEvent, bool bResetFlag);
        [OperationContract] string FlagEvent(EventInfo udtEvent);

        /// <summary>
        /// position functions
        /// </summary>
        [OperationContract] List<PosInfo> GetPositions(PosInfo posFilter, int iUserID, string strCompany);
        [OperationContract] string SavePosition(PosInfo udtPos);
        [OperationContract] string SavePositionUDP(PosInfo udtPos);//[Dan:30Nov12]
        [OperationContract] PosInfo GetAssetLastPos(string iAssetName);//[Chinky:02Mar2014]
        [OperationContract] PosInfo GetLastestAssetInfo(int AssetID, int PostypeID, int PosID); //[Chinky:20Oct2014]

        /// <summary>
        /// report functions
        /// </summary>
        [OperationContract] List<ZoneReport> GetZoneReport(EventInfo evtFilter, int iUserID, string strCompany);
        [OperationContract] List<SpeedReport> GetSpeedReport(PosInfo posFilter, int iUserID, string strCompany);
        [OperationContract] List<UtilizeReport> GetUtilizeReport(UtilizeReport utilFilter, int iUserID, string strCompany);
        [OperationContract] List<MileageReport> GetMileageReport(MileageReport mileFilter, int iUserID, string strCompany);
        [OperationContract] List<MixerReport> GetMixerReport(EventInfo evtFilter, int iUserID, string strCompany);
                
        /// <summary>
        /// sms functions
        /// </summary>
        [OperationContract] List<PhoneInfo> GetPhones(int iUserID);
        [OperationContract] List<MessageInfo> GetMessages(MessageInfo msgFilter, DateTime dtStart, DateTime dtEnd, int iUserID);
        [OperationContract] List<MessageInfo> GetMessagesEx(int iMessageID);
        [OperationContract] string FlagMessages(string strMessageIds);  
        [OperationContract] string SaveMessage(MessageInfo udtMessage);
        [OperationContract] string DeleteMessage(int iMessageID);
      
        /// <summary>
        /// live data functions
        /// </summary>
        [OperationContract] List<RawData> GetRawData(string Key, RawData Filter, DateTime Start, DateTime End);
        [OperationContract] Response ProcessRawData(string Key, List<RawData> arrData);

        /// <summary>
        /// file functions
        /// </summary>
        [OperationContract] string UploadFile(FileUpload udtFile);
        [OperationContract] string GetFile(string strName);

        /// <summary>
        /// cell id functions
        /// </summary>
        [OperationContract] string LocateCellID(EventInfo udtEvent, CellID udtCellID);
        [OperationContract] List<CellID> GetCellIds(CellID udtFilter);
        [OperationContract] List<CellID> GetZoneCellIds(int iZoneID);
        [OperationContract] List<string> GetCidParams(string strParam, CellID udtFilter);
        [OperationContract] string SaveCellIds(List<CellID> arrCellIds);

        /// <summary>
        /// OTA functions
        /// </summary>
        [OperationContract] string CheckOTAReply(DateTime dtOTASent, string assetName);
        [OperationContract] List<OTACommand> GetOTACommands(int userID);
    }

    [DataContract]
    public class OTACommand
    {
        [DataMember] public int CommandID { get; set; }
        [DataMember] public int TagTypeID { get; set; }
        [DataMember] public string TagTypeName { get; set; }
        [DataMember] public string CommandString { get; set; }
        [DataMember] public string CommandName { get; set; }
        [DataMember] public int ParamCount { get; set; }
        [DataMember] public string Notes { get; set; }
    }

    [DataContract]
    public class DownAssetsInfo
    {
        [DataMember] public int asset_id { get; set; }
        [DataMember] public string asset { get; set; }
        [DataMember] public string tag { get; set; }
        [DataMember] public string tagphone { get; set; }
        [DataMember] public string company{ get; set; }
        [DataMember] public int company_id{ get; set; }
        [DataMember] public DateTime lastupdate {get;set;}
        [DataMember] public int notified {get;set;}
    }

    /// <summary>
    /// user activity info
    /// </summary>
    [DataContract]
    public class GenUserActivityInfo
    {
        [DataMember] public int UserActivityID { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public int Year { get; set; }
        [DataMember] public int MonthNum { get; set; }
        [DataMember] public string Month { get; set; }
        [DataMember] public double TotalHours { get; set; }
        [DataMember] public int LoginFreq { get; set; }
    }

    /// <summary>
    /// feature info
    /// </summary>
    [DataContract]
    public class FeatureInfo
    {
        [DataMember] public int FeatureID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public int RoleID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Image { get; set; }
    }

    /// <summary>
    /// company info
    /// </summary>
    [DataContract]
    public class CompanyInfo
    {
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public int UserLimit { get; set; }
        [DataMember] public int ZoneLimit { get; set; }
        [DataMember] public int AssetLimit { get; set; }
        [DataMember] public int SmsLimit { get; set; }
        [DataMember] public string Reports { get; set; }
        [DataMember] public string Categories { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public int Flag { get; set; }
    }

    /// <summary>
    /// user info
    /// </summary>
    [DataContract]
    public class UserInfo
    {
        [DataMember] public int UserID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public string User { get; set; }
        [DataMember] public string Password { get; set; }
        [DataMember] public string ApiKey { get; set; }
        [DataMember] public int RoleID { get; set; }
        [DataMember] public string Role { get; set; }
        [DataMember] public string Phone{ get; set; }
        [DataMember] public string Email { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public string Assets { get; set; }
        [DataMember] public string Notifications { get; set; }
        [DataMember] public string Status { get; set; }
        [DataMember] public string Reports { get; set; }
        [DataMember] public int LanguageID { get; set; }
        [DataMember] public string Language { get; set; }
        [DataMember] public string Culture { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public string Menus { get; set; }
    }

    /// <summary>
    /// zone info
    /// </summary>
    [DataContract]
    public class ZoneInfo
    {
        [DataMember] public int ZoneID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public string Type { get; set; }
        [DataMember] public string Perimeter { get; set; }
        [DataMember] public string CellIds { get; set; }
        [DataMember] public string Location { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public string Color { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string TagID { get; set; }
        [DataMember] public List<ZoneTap> ZoneTapInfo {get;set;}

    }

        //Zone Tap Info
    [DataContract]
    public class ZoneTap
    {
        [DataMember] public int ZoneTapID {get;set;}
        [DataMember] public string TagID {get;set;}
        [DataMember] public string Driver {get;set;}
        [DataMember] public string RFID {get;set;}
        [DataMember] public DateTime TapIn {get;set;}
        [DataMember] public DateTime TapOut {get;set;}
        [DataMember] public string ZoneIn {get;set;}
        [DataMember] public string ZoneOut {get;set;}
        [DataMember] public string Asset {get;set;}
        [DataMember] public string EmployeeId {get;set;}
        [DataMember]public string Remarks {get;set;}
        [DataMember] public string EmployeeType {get;set;}
    }


    /// <summary>
    /// tag info
    /// </summary>
    [DataContract]
    public class TagInfo
    {
        [DataMember] public int TagID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public string Imei { get; set; }
        [DataMember] public string Phone { get; set; }
        [DataMember] public int Interval { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public int ServerPort { get; set; }
        [DataMember] public string ServerIP { get; set; }
        [DataMember] public DateTime LastModified { get; set; }
        [DataMember] public DateTime InstallDate { get; set; }        
        [DataMember] public string InstallRemarks { get; set; }
        [DataMember] public bool IsSentOut { get; set; }
    }

    /// <summary>
    /// asset info and status
    /// </summary>
    [DataContract]
    public class AssetInfo
    {
        // asset info
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public int CategoryID { get; set; }
        [DataMember] public string Category { get; set; }
        [DataMember] public string Phone { get; set; }
        [DataMember] public string Email { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public int Home { get; set; }
        [DataMember] public string AlertZones { get; set; }
        [DataMember] public DateTime CurfewStart { get; set; }
        [DataMember] public DateTime CurfewEnd { get; set; }
        [DataMember] public int TagID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string TagPhone { get; set; }
        [DataMember] public double IdleLimit { get; set; }
        [DataMember] public double SpeedLimit { get; set; }
        [DataMember] public double BaseMileage { get; set; }
        [DataMember] public double Mileage { get; set; }
        [DataMember] public double MileageDist { get; set; }
        [DataMember] public DateTime MileageDate { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Notifications { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public DateTime InstallDate { get; set; }
        [DataMember] public string InstallRemarks { get; set; }

        // alert status
        [DataMember] public PosInfo LastPos { get; set; }
        [DataMember] public PosInfo LastGps { get; set; }
        [DataMember] public long LastEventID { get; set; }
        [DataMember] public long LastEnterID { get; set; }
        [DataMember] public long LastExitID { get; set; }
        [DataMember] public long LastPosID { get; set; }
        [DataMember] public long LastFixID { get; set; }
        [DataMember] public long LastGpsID { get; set; }
        [DataMember] public DateTime LastIdle { get; set; }
        [DataMember] public DateTime LastMove { get; set; }

        // asset status
        [DataMember] public int StatusID { get; set; }
        [DataMember] public string Status { get; set; }
        [DataMember] public string StatusEx { get; set; }
        [DataMember] public string Remarks { get; set; }
        [DataMember] public int AlertLevel { get; set; }
        [DataMember] public int Gps { get; set; }
        [DataMember] public int Gprs { get; set; }
        [DataMember] public int Ignition { get; set; }
        [DataMember] public double Temperature { get; set; }
        [DataMember] public double Temperature2 { get; set; }
        [DataMember] public string RFID { get; set; }
    
        // activity info
        [DataMember] public List<ActivityInfo> Activities { get; set; }
        [DataMember] public List<TripInfo> Trips { get; set; }

        //[DataMember] public List<ZoneTap> TapInfo {get;set;}
        [DataMember] public int RFID_Status {get;set;}   
    }

    /// <summary>
    /// activity info
    /// </summary>
    [DataContract]
    public class ActivityInfo
    {
        [DataMember] public long ActivityID { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public DateTime StartTime { get; set; }
        [DataMember] public DateTime EndTime { get; set; }
        [DataMember] public DateTime ArriveTime { get; set; }
        [DataMember] public DateTime DepartTime { get; set; }
        [DataMember] public string ArriveTimeEx { get; set; }
        [DataMember] public string DepartTimeEx { get; set; }
        [DataMember] public string StartOffset { get; set; }
        [DataMember] public string EndOffset { get; set; }
        [DataMember] public string ActivityNum { get; set; }
        [DataMember] public string AccountNum { get; set; }
        [DataMember] public ZoneInfo ZoneInfo { get; set; }
        [DataMember] public int ZoneID { get; set; }
        [DataMember] public string Zone { get; set; }
        [DataMember] public int CategoryID { get; set; }
        [DataMember] public string Category { get; set; }
        [DataMember] public int StatusID { get; set; }
        [DataMember] public string Status { get; set; }
        [DataMember] public int Order { get; set; }
        [DataMember] public double Distance { get; set; }
    }

    /// <summary>
    /// trip plan info
    /// </summary>
    [DataContract]
    public class PlanInfo
    {
        [DataMember] public int PlanID { get; set; }
        [DataMember] public int OriginID { get; set; }
        [DataMember] public string Origin { get; set; }
        [DataMember] public int DestinationID { get; set; }
        [DataMember] public string Destination { get; set; }
        [DataMember] public double Duration { get; set; }
        [DataMember] public string DurationEx { get; set; }
        [DataMember] public double Price { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public DateTime LastTrip { get; set; }
    }

    /// <summary>
    /// trip info
    /// </summary>
    [DataContract]
    public class TripInfo
    {
        [DataMember] public long TripID { get; set; }
        [DataMember] public int PlanID { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public int OriginID { get; set; }
        [DataMember] public string Origin { get; set; }
        [DataMember] public DateTime OriginEnter { get; set; }
        [DataMember] public DateTime OriginExit { get; set; }
        [DataMember] public string OriginDuration { get; set; }
        [DataMember] public int DestinationID { get; set; }
        [DataMember] public string Destination { get; set; }
        [DataMember] public DateTime DestinationEnter { get; set; }
        [DataMember] public DateTime DestinationExit { get; set; }        
        [DataMember] public string DestinationDuration { get; set; }
        [DataMember] public string TravelDuration { get; set; }
        [DataMember] public double Mileage { get; set; }
        [DataMember] public double Price { get; set; }
        [DataMember] public double Diesel { get; set; }
    }

    /// <summary>
    /// Trips Zone Info
    /// </summary>
    [DataContract]
    public class TripZoneInfo
    {
        [DataMember] public long TripsZoneID { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public DateTime RxTime { get; set; }
        [DataMember] public int ZoneID { get; set; }
        [DataMember] public string ZoneName { get; set; }
        [DataMember] public int CompanyID  { get; set; }
        [DataMember] public string CompanyName  { get; set; }
        [DataMember] public int TripID  { get; set; }
        [DataMember] public int AssetID  { get; set; }
        [DataMember] public string AssetName  { get; set; }
    }

    /// <summary>
    /// event info
    /// </summary>
    [DataContract]
    public class EventInfo
    {
        [DataMember] public long EventID { get; set; }
        [DataMember] public int TagID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Event { get; set; }
        [DataMember] public int StatusID { get; set; }
        [DataMember] public string Remarks { get; set; }
        [DataMember] public int AlertLevel { get; set; }
        [DataMember] public int Flag { get; set; }
        [DataMember] public long PosID { get; set; }
        [DataMember] public PosInfo Position { get; set; }
        [DataMember] public string Location { get; set; }
        [DataMember] public string Zone { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public DateTime RxTime { get; set; }
        [DataMember] public int AckUserID { get; set; }
        [DataMember] public string AckUser { get; set; }
        [DataMember] public DateTime AckTime { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string RFID { get; set; }
    }

    /// <summary>
    /// position info
    /// </summary>
    [DataContract]
    public class PosInfo
    {
        [DataMember] public long PosID { get; set; }
        [DataMember] public int TagID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public int FixID { get; set; }
        [DataMember] public string Fix { get; set; }
        [DataMember] public int Satellites { get; set; }
        [DataMember] public double PosX { get; set; }
        [DataMember] public double PosY { get; set; }
        [DataMember] public double PosZ { get; set; }
        [DataMember] public double Speed { get; set; }
        [DataMember] public double Course { get; set; }
        [DataMember] public double HDOP { get; set; }        
        [DataMember] public int Ignition { get; set; }
        [DataMember] public string Engine { get; set; }
        [DataMember] public double Mileage { get; set; }
        [DataMember] public double Battery { get; set; }
        [DataMember] public double Fuel { get; set; }
        [DataMember] public long LocID { get; set; }
        [DataMember] public string Location { get; set; }
        [DataMember] public int ZoneID { get; set; }
        [DataMember] public string Zone { get; set; }
        [DataMember] public string Remarks { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public DateTime RxTime { get; set; }
        [DataMember] public Double Temperature { get; set; }
        [DataMember] public Double Temperature2 { get; set; }
        [DataMember] public string RFID { get; set; }

        //[Chinky:08Sept2014] Support for Ultrasonic Liquid Level Sensor
        [DataMember] public Double FuelLevel { get; set; }
        [DataMember] public Double ActualTemp { get; set; }

        //[Dan:23Sep14] Support for Buffered Data (More on RugGear)
        [DataMember] public bool IsBuffer { get; set; }
    }


    /// <summary>
    /// speed report info
    /// </summary>
    [DataContract]
    public class SpeedReport
    {
        [DataMember] public long PosID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Location { get; set; }
        [DataMember] public double Speed { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
    }

    /// <summary>
    /// utilization report info
    /// </summary>
    [DataContract]
    public class UtilizeReport
    {
        [DataMember] public long UtilID { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public int CategoryID { get; set; }
        [DataMember] public string Category { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public DateTime Date { get; set; }
        [DataMember] public string DateEx { get; set; }
        [DataMember] public DateTime StartTime { get; set; }
        [DataMember] public string StartTimeEx { get; set; }
        [DataMember] public DateTime EndTime { get; set; }
        [DataMember] public string EndTimeEx { get; set; }
        [DataMember] public string TotalTime { get; set; }
        [DataMember] public double Stop1 { get; set; }
        [DataMember] public string Stop1Ex { get; set; }
        [DataMember] public double Stop2 { get; set; }
        [DataMember] public string Stop2Ex { get; set; }
        [DataMember] public double Idle { get; set; }
        [DataMember] public string Idle1Ex { get; set; }
        [DataMember] public string Idle2Ex { get; set; }
        [DataMember] public double Move { get; set; }
        [DataMember] public string Move1Ex { get; set; }
        [DataMember] public string Move2Ex { get; set; }
        [DataMember] public int StopCount { get; set; }
        [DataMember] public double Mileage { get; set; }
        [DataMember] public DateTime LastIgnition { get; set; }
        [DataMember] public double Idle1ExMins { get; set; }
        [DataMember] public double AveIdle1ExMins { get; set; }
        [DataMember] public string Location { get; set; }
    }

    /// <summary>
    /// zone report info
    /// </summary>
    [DataContract]
    public class ZoneReport
    {
        [DataMember] public long EnterID { get; set; }
        [DataMember] public long ExitID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Zone { get; set; }
        [DataMember] public DateTime EntryTime { get; set; }
        [DataMember] public DateTime ExitTime { get; set; }
        [DataMember] public string ExitTimeEx { get; set; }
        [DataMember] public string Duration { get; set; }
    }

    /// <summary>
    /// mileage report info
    /// </summary>
    [DataContract]
    public class MileageReport
    {
        [DataMember] public long MileageID { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public int CategoryID { get; set; }
        [DataMember] public string Category { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public DateTime Date { get; set; }
        [DataMember] public string DateEx { get; set; }
        [DataMember] public DateTime StartTime { get; set; }
        [DataMember] public string StartTimeEx { get; set; }
        [DataMember] public DateTime EndTime { get; set; }
        [DataMember] public string EndTimeEx { get; set; }
        [DataMember] public string TotalTime { get; set; }
        [DataMember] public double Mileage { get; set; }
    }

    /// <summary>
    /// mixer report info
    /// </summary>
    [DataContract]
    public class MixerReport
    {
        [DataMember] public long EventID { get; set; }
        [DataMember] public string Event { get; set; }
        [DataMember] public string Remarks { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Zone { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
    }

    /// <summary>
    /// message info
    /// </summary>
    [DataContract]
    public class MessageInfo
    {
        [DataMember] public int MessageID { get; set; }
        [DataMember] public string Sender { get; set; }
        [DataMember] public string Recipients { get; set; }
        [DataMember] public string Message { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public int StatusID { get; set; }
        [DataMember] public string Status { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Company { get; set; }
    }

    /// <summary>
    /// phonebook info
    /// </summary>
    [DataContract]
    public class PhoneInfo
    {
        [DataMember] public string Name { get; set; }
        [DataMember] public string Phone { get; set; }
        [DataMember] public string Role { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public bool Selected { get; set; }
    }

    /// <summary>
    /// raw data info
    /// </summary>
    [DataContract]
    public class RawData
    {
        [DataMember] public long DataID { get; set; }
        [DataMember] public string Data { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public int AssetID { get; set; }
        [DataMember] public string Asset { get; set; }
        [DataMember] public int TagID { get; set; }
        [DataMember] public string Tag { get; set; }
        [DataMember] public string ServerIP { get; set; }
        [DataMember] public int ServerPort { get; set; }
        [DataMember] public DateTime Timestamp { get; set; }
        [DataMember] public DateTime RxTime { get; set; }
    }

    /// <summary>
    /// file upload info
    /// </summary>
    [DataContract]
    public class FileUpload
    {
        [DataMember] public string FileName { get; set; }
        [DataMember] public byte[] FileData { get; set; }
    }

    /// <summary>
    /// cell id info
    /// </summary>
    [DataContract]
    public class CellID
    {
        [DataMember] public long ControlNo { get; set; }
        [DataMember] public string mcc { get; set; }
        [DataMember] public string mnc { get; set; }
        [DataMember] public string lac { get; set; }
        [DataMember] public string cid { get; set; }
        [DataMember] public double lat { get; set; }
        [DataMember] public double lon { get; set; }
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
        ReverseGeocode = 13, //[Dan:09Jul14] 
        FuelLevel = 14, //[Chinky:08Sept2014]
        RFID = 15 //[Chinky:20Oct2014]
    }


    /// <summary>
    /// name info
    /// </summary>
    [DataContract]
    public class NameInfo
    {
        [DataMember] public int NameID { get; set; }
        [DataMember] public string Name { get; set; }
    }

    /// <summary>
    /// string info
    /// </summary>
    [DataContract]
    public class StringInfo
    {
        [DataMember] public int StringID { get; set; }
        [DataMember] public string String { get; set; }
        [DataMember] public string Default { get; set; }
    }

    [DataContract]
    public class RoutePoint
    {
        [DataMember] public double Latitude { get; set; }
        [DataMember] public double Longitude { get; set; }
    }

    [DataContract]
    public class GoogleStep
    {
        [DataMember] public RoutePoint StartLoc { get; set; }
        [DataMember] public RoutePoint EndLoc { get; set; }
        [DataMember] public string Duration { get; set; }
        [DataMember] public string Instruction { get; set; }
    }

    [DataContract]
    public class GoogleRoute
    {
        [DataMember] public string Summary { get; set; }
        [DataMember] public string TotalDuration { get; set; }
        [DataMember] public string TotalDistance { get; set; }
        [DataMember] public string EncodedPath { get; set; }
        [DataMember] public List<GoogleStep> Steps { get; set; }
    }

    /// <summary>
    /// error code definitions
    /// </summary>
    [DataContract]
    public enum ErrorCode
    {
        [EnumMember] OK = 0,
        [EnumMember] RECORD_EXISTING = -1,
        [EnumMember] MISSING_PARAM = -2,
        [EnumMember] INVALID_PARAM = -3,
        [EnumMember] OPERATION_FAILED = -4,
        [EnumMember] DATABASE_ERROR = -5,
        [EnumMember] DUPLICATE_TRANSACT = -6,
        [EnumMember] INVALID_STATE = -7,
        [EnumMember] ADD_FAILED = -8,
        [EnumMember] DEL_FAILED = -9,
        [EnumMember] UPDATE_FAILED = -10,
        [EnumMember] MAX_LIMIT = -11,
        [EnumMember] ACCESS_DENIED = -12,
        [EnumMember] STATUS_PENDING = -13,
        [EnumMember] TIME_OUT = -14
    }

    /// <summary>
    /// response info
    /// </summary>
    [DataContract]
    public class Response
    {
        [DataMember(EmitDefaultValue = false)] public string Status { get; set; }
        [DataMember(EmitDefaultValue = false)] public long ErrorCode { get; set; }
        [DataMember(EmitDefaultValue = false)] public string ErrMessage { get; set; }
    }

    /// <summary>
    /// location coordinate
    /// </summary>
    [DataContract(Namespace = Constant.Namespace)]
    public class LatLong
    {
        [DataMember(EmitDefaultValue = false)] public double Latitude { get; set; }
        [DataMember(EmitDefaultValue = false)] public double Longitude { get; set; }
    }

    #region RFID Feature
    /// <summary>
    /// RFID info
    /// [Dan:21Jul14] Added from Soonpoh source by Marlo
    /// </summary>
    [DataContract]
    public class RFIDInfo
    {
        [DataMember] public int RfidID { get; set; }
        [DataMember] public string RFID { get; set; }
        [DataMember] public string Driver { get; set; }
        [DataMember] public string Remarks { get; set; }
        [DataMember] public DateTime DateAdded { get; set; }
        [DataMember] public DateTime DateModified { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public string Company { get; set; }
        [DataMember] public int Created_UserID { get; set; }
        [DataMember] public int Modified_UserID { get; set; }
        [DataMember] public string Created_User { get; set; }
        [DataMember] public string Modified_User { get; set; }
    }

    /// <summary>
    /// DriverInfo info
    /// [Dan:21Jul14] Added from Soonpoh source by Marlo
    /// </summary>
    [DataContract]
    public class DriverInfo
    {
        [DataMember] public int DriverID { get; set; }
        [DataMember] public string Name { get; set; }
        [DataMember] public string Address { get; set; }
        [DataMember] public string Phone { get; set; }
        [DataMember] public DateTime DateOfBirth { get; set; }
        [DataMember] public string RelativeName { get; set; }
        [DataMember] public string RelativePhone { get; set; }
        [DataMember] public string RFID {get; set;}
        [DataMember] public string Company { get; set; }
        [DataMember] public string Image { get; set; }
        [DataMember] public string ImageFill { get; set; }
        [DataMember] public int CompanyID { get; set; }
        [DataMember] public DateTime LoginLocal { get; set; }
        [DataMember] public string Remarks {get;set;}
        [DataMember] public int BloodType {get;set;}
        [DataMember] public DateTime LastTap {get;set;}

    }
    #endregion
}
