using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi.Repository
{
    public interface IObjectRepository
    {
        Object GetAll();
        Object Get(int id);
        Object Add(Object item);
        bool Remove(int id);
        bool Update(Object item);
    }

    public interface IAssetRepository
    {
        IEnumerable<AssetInfo> GetAll();
        AssetInfo Get(int assetID);
        IEnumerable<AssetInfo> GetAssetsEx(UserInfo param);
        AssetInfo Add(AssetInfo item);
        bool Remove(int assetID);
        bool Update(AssetInfo item);

        void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp);

        string GetImage(string strName, ref string strFill);
    }
    public interface ISearchAssetRepository
    {
        IEnumerable<SearchAsset> GetAll();
        SearchAsset Get(int assetID);
        IEnumerable<SearchAsset> GetAssetsEx(SearchAsset param);
        SearchAsset Add(SearchAsset item);
        bool Remove(int assetID);
        bool Update(SearchAsset item);

        void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp);

        string GetImage(string strName, ref string strFill);
    }
    public interface IZoneRepository
    {
        IEnumerable<ZoneInfo> GetAll();
        ZoneInfo Get(int zoneID);
        IEnumerable<ZoneInfo> GetByCompany(ZoneInfo param);
        ZoneInfo Add(ZoneInfo item);
        bool Remove(int zoneID);
        bool Update(ZoneInfo item);
    }
    public interface IDriverRepository
    {
        IEnumerable<DriverInfo> GetAll();
        IEnumerable<DriverInfo> GetByCompany(DriverInfo param);
        DriverInfo Get(int driverID);
        DriverInfo Add(DriverInfo item);
        bool Remove(int driverID);
        bool Update(DriverInfo item);

    }
    public interface IScsRepository
    {
        IEnumerable<ScsInfo> GetAll();
        IEnumerable<ScsArchiveInfo> GetAllEx();
        IEnumerable<ScsInfo> GetScs(ScsInfo param);
        IEnumerable<ScsArchiveInfo> GetScsArchive(ScsArchiveInfo param);
        IEnumerable<ScsArchiveInfo> GetScsArchiveEx(ScsArchiveInfo param);

    }
    public interface ISearchDriverRepository
    {
        IEnumerable<SearchDriver> GetAll();
        IEnumerable<SearchDriver> GetByCompany(SearchDriver param);
        SearchDriver Get(int driverID);
        SearchDriver Add(SearchDriver item);
        bool Remove(int driverID);
        bool Update(SearchDriver item);

    }
    public interface ICompanyRepository
    {
        IEnumerable<CompanyInfo> GetAll();
        IEnumerable<CompanyInfo> GetByCompany(CompanyInfo param);
        CompanyInfo Get(int companyID);
        CompanyInfo Add(CompanyInfo item);
        bool Remove(int companyID);
        bool Update(CompanyInfo item);

        int GetCompanyID(string strCompany);
    }
    public interface IResellerRepository
    {
        IEnumerable<ResellerInfo> GetAll();
        IEnumerable<ResellerInfo> GetByResellerID(ResellerInfo param);
        ResellerInfo Get(int resellerID);
        ResellerInfo Add(ResellerInfo item);
        bool Remove(int resellerID);
        bool Update(ResellerInfo item);
    }
    public interface IUserRepository
    {
        IEnumerable<UserInfo> GetAll();
        IEnumerable<UserInfo> GetByCompany(UserInfo param);
        UserInfo Get(int userID);
        UserInfo Add(UserInfo item);
        bool Remove(int userID);
        bool Update(UserInfo item);
    }

    public interface ISearchUserRepository
    {
        IEnumerable<SearchUser> GetAll();
        IEnumerable<SearchUser> GetByCompany(SearchUser param);
        SearchUser Get(int userID);
        SearchUser Add(SearchUser item);
        bool Remove(int userID);
        bool Update(SearchUser item);
    }
    public interface IDeviceRepository
    {
        IEnumerable<DeviceInfo> GetAll();
        IEnumerable<DeviceInfo> GetByCompany(DeviceInfo param);
        DeviceInfo Get(int deviceID);
        DeviceInfo Add(DeviceInfo item);
        bool Remove(int deviceID);
        bool Update(DeviceInfo item);
    }
    public interface ISearchDeviceRepository
    {
        IEnumerable<SearchDevice> GetAll();
        IEnumerable<SearchDevice> GetByCompany(SearchDevice param);
        SearchDevice Get(int deviceID);
        SearchDevice Add(SearchDevice item);
        bool Remove(int deviceID);
        bool Update(SearchDevice item);
    }
    public interface ICategoryRepository
    {
        IEnumerable<CategoryInfo> GetAll();
        CategoryInfo Get(int categoryID);
        CategoryInfo Add(CategoryInfo item);
        bool Remove(int categoryID);
        bool Update(CategoryInfo item);
    }
    public interface IZoneTypeRepository
     {
         IEnumerable<ZoneTypeInfo> GetAll();
         ZoneTypeInfo Get(int zonetypeID);
         ZoneTypeInfo Add(ZoneTypeInfo item);
         bool Remove(int zonetypeID);
         bool Update(ZoneTypeInfo item);
     }
    public interface IDeviceTypeRepository
    {
        IEnumerable<DeviceTypeInfo> GetAll();
        DeviceTypeInfo Get(int devicetypeID);
        DeviceTypeInfo Add(DeviceTypeInfo item);
        bool Remove(int devicetypeID);
        bool Update(DeviceTypeInfo item);
    }
    public interface IReportRepository
     {
         IEnumerable<ReportInfo> GetAll();
         ReportInfo Get(int reportID);
         ReportInfo Add(ReportInfo item);
         bool Remove(int reportID);
         bool Update(ReportInfo item);
     }
    public interface IRoleRepository
     {
         //IEnumerable<RoleInfo> GetAll();
         IEnumerable<RoleInfo> GetByRoleID(RoleInfo param);
         RoleInfo Get(int roleID);
         RoleInfo Add(RoleInfo item);
         int GetByUserID(int iUserID);
         bool Remove(int roleID);
         bool Update(RoleInfo item);
     }
    public interface ILanguageRepository
     {
         IEnumerable<LanguageInfo> GetAll();
         LanguageInfo Get(int languageID);
         LanguageInfo Add(LanguageInfo item);
         bool Remove(int languageID);
         bool Update(LanguageInfo item);
     }
    public interface IPosRepository
    {
        IEnumerable<PosInfo> GetAll();
        IEnumerable<TriggerInfo> GetAllEx();
        PosInfo Get(int posID);
        IEnumerable<PosInfo> Get(PosInfo value);
        IEnumerable<PosInfo> GetEx(PosInfo value);
        IEnumerable<TriggerInfo> GetTriggerData(TriggerInfo value);
        PosInfo Add(PosInfo item);
        bool Remove(int posID);
        bool Update(PosInfo item);

    }

    public interface IBcRankingRepository
    {
        IEnumerable<BcRankingInfo> GetAll();
        BcRankingInfo Get(int posID);
        IEnumerable<BcRankingInfo> GetBcRanking(BcRankingInfo value);
    }

    public interface IBcPerformanceRepository
    {
        IEnumerable<BcPerformanceInfo> GetAll();
        BcPerformanceInfo Get(int posID);
        IEnumerable<BcPerformanceInfo> GetBcPerformance(BcPerformanceInfo value);
    }

    public interface IOverallPerformanceRepository
    {
        IEnumerable<OverallPerformanceInfo> GetAll();
        OverallPerformanceInfo Get(int posID);
        IEnumerable<OverallPerformanceInfo> GetOverallPerformance(OverallPerformanceInfo value);
    }

    public interface IOaPerfParamsRepository
    {
        IEnumerable<OaPerfParamsInfo> GetAll();
        IEnumerable<OaPerfParamsInfo> GetOverallPerformanceParam(OaPerfParamsInfo value);
        OaPerfParamsInfo Get(int sessionID);
        OaPerfParamsInfo Add(OaPerfParamsInfo item);
        bool Remove(int sessionID);
    }

    public interface IOaPerfDrvRepository
    {
        IEnumerable<OaPerfDrvInfo> GetAll();
        IEnumerable<OaPerfDrvInfo> GetOverallPerformanceParam(OaPerfDrvInfo value);
        OaPerfDrvInfo Get(int sessionID);
        OaPerfDrvInfo Add(OaPerfDrvInfo item);
        bool Remove(int sessionID);
    }

    public interface IDailyPerformanceRepository
    {
        DailyPerformanceInfo GetAll();
        //DailyPerformanceInfo Get(int posID);
        DailyPerformanceInfo GetDailyPerformance(DailyPerformanceInfo value);
    }
    public interface IEventRepository
     {
         IEnumerable<EventInfo> GetAll();
         EventInfo Get(int eventID);
         IEnumerable<EventInfo> Get(EventInfo value);
         EventInfo Add(EventInfo item);
         bool Remove(int eventID);
         bool Update(EventInfo item);
         string FlagEvent(EventInfo udtEvent);
         string FlagEvent(ref DataMgrTools dbMgr, EventInfo udtEvent);
         string SaveEvent(EventInfo udtEvent, bool bRemarks, bool bNotify);
         void NotifyEvent(EventInfo udtEvent);
         void ListContactInfo(ref List<string> arrRecipients, string strContact);

     }
    public interface IMessageRepository
    {
        IEnumerable<MessageInfo> GetAll();
        IEnumerable<MessageInfo> Get(MessageInfo param);
        MessageInfo Get(int id);

        MessageInfo Add(MessageInfo currMessage);

        bool Remove(int messageID);

        bool Update(MessageInfo currMessage);

        string SaveMessage(MessageInfo udtMessage);


    }

    public interface IDepotRepository
    {

        IEnumerable<DepotInfo> GetAll();
        DepotInfo Get(int depotID);
        DepotInfo GetByDesc(string depotName);
        DepotInfo Add(DepotInfo currDepot);
        bool Remove(int depotID);
        bool Update(DepotInfo currDepot);

    }

    public interface IInterchangeRepository
    {

        IEnumerable<InterchangeInfo> GetAll();
        IEnumerable<InterchangeInfo> GetInterchange(InterchangeInfo param);
        InterchangeInfo Get(int interchangeID);
        InterchangeInfo GetByDesc(string interchangeName);
        InterchangeInfo Add(InterchangeInfo currInterchange);
        bool Remove(int interchangeID);
        bool Update(InterchangeInfo currInterchange);

    }

    public interface ISvcRepository
    {

        IEnumerable<SvcInfo> GetAll();
        IEnumerable<SvcInfo> GetSvc(SvcInfo param);
        SvcInfo Get(int svcID);
        SvcInfo GetByDesc(string svcNumber);
        SvcInfo Add(SvcInfo currSvc);
        bool Remove(int svcID);
        bool Update(SvcInfo currSvc);

    }

    public interface IStatusRepository
    {

        IEnumerable<StatusInfo> GetAll();
        StatusInfo Get(int statusID);
        StatusInfo GetByDesc(string statusName);
        StatusInfo Add(StatusInfo currStatus);
        bool Remove(int statusID);
        bool Update(StatusInfo currStatus);

    }
    public interface ISafetyEventsRepository
    {
        IEnumerable<SafetyEventsInfo> GetAll();
        IEnumerable<SafetyEventsInfo> GetSafetyEventsInfo(SafetyEventsInfo value);
        SafetyEventsInfo Get(int safetyID);
    }
    public interface ISummaryRepository
    {
        IEnumerable<SummaryInfo> GetAll();
        IEnumerable<SummaryInfo> GetSummaryInfo(SummaryInfo value);
        SummaryInfo Get(int summaryID);
    }
    
}


