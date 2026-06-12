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

    public interface ISettingsRepository
    {
        IEnumerable<GoogleDistanceMatrixResponse> Clear();
        IEnumerable<LocationIQForwardGeoCodeResponse> ClearGeocoding();
        IEnumerable<ReverseGeocodeInfo> GetReverseGeocode(ReverseGeocodeInfo param);
        IEnumerable<GoogleDistanceMatrixResponse> GetDistanceMatrix(GoogleDistanceMatrixResponse param);
        IEnumerable<LocationIQForwardGeoCodeResponse> GetForwardGeocoding(LocationIQForwardGeoCode param);
        IEnumerable<LocationIQGeoCodeResponse> GetLocationIQReverseGeocode(LocationIQGeoCodeResponse param);
    }


    public interface IAppRepository
    {
        Object GetAll();
        Object Get(int id);
        Object Add(Object item);
        Object CountDriver(Object item);
        Object CheckDriver(Object item);
        bool Remove(int id);
        bool Update(Object item);
    }


    public interface IAssetRepository
    {
        IEnumerable<AssetInfo> GetAll();
        IEnumerable<AssetInfo> ClearAssets();
        AssetInfo Get(int assetID);
        IEnumerable<AssetInfo> GetByDriver(AssetInfo param);
        IEnumerable<AssetInfo> GetByAssetID(AssetInfo param);
        IEnumerable<AssetInfo> GetAssetsEx(UserInfo param);
        IEnumerable<AssetInfo> GetByAsset(AssetInfo param);
        AssetInfo Add(AssetInfo item);
        AssetInfo GetAssetByTag(AssetInfo item);
        Object GetAssetByTagEx(Object item);
        AssetInfo LogoutAssetByTag(AssetInfo item);
        AssetInfo BreakAssetByTag(AssetInfo item);
        AssetInfo OnboardOffload(AssetInfo item);
        OnboardOffloadInfo OnboardOffloadEx(OnboardOffloadInfo item);
        bool Remove(int assetID);
        bool Update(AssetInfo item);
        void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp);
        string GetImage(string strName, ref string strFill);
    }

    public interface IZoneRepository
    {
        IEnumerable<ZoneInfo> GetAll();
        IEnumerable<ZoneInfo> GetAllZone();
        IEnumerable<ZoneInfo> GetByZone(ZoneInfo param);
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
        IEnumerable<DriverInfo> GetByCompanyEx(DriverInfo param);
        IEnumerable<DriverInfo> GetAllDriver();
        IEnumerable<DriverInfo> GetByDriver(DriverInfo param);
        DriverInfo Get(int driverID);
        DriverInfo Add(DriverInfo item);
        bool Remove(int driverID);
        bool Update(DriverInfo item);

    }

    public interface ICompanyRepository
    {
        IEnumerable<CompanyInfo> GetAll();
        IEnumerable<CompanyInfo> GetByCompany(CompanyInfo param);
        IEnumerable<CompanyInfo> GetAllCompany();
        IEnumerable<CompanyInfo> GetByCompanyName(CompanyInfo param);
        CompanyInfo Get(int CompanyID);
        CompanyInfo Add(CompanyInfo item);
        bool Remove(int CompanyID);
        bool Update(CompanyInfo item);
        int GetCompanyID(string strCompany);
    }

    public interface IResellerRepository
    {
        IEnumerable<ResellerInfo> GetAll();
        IEnumerable<ResellerInfo> GetByResellerID(ResellerInfo param);
        IEnumerable<ResellerInfo> GetAllReseller();
        IEnumerable<ResellerInfo> GetByReseller(ResellerInfo param);
        ResellerInfo Get(int ResellerID);
        ResellerInfo Add(ResellerInfo item);
        bool Remove(int ResellerID);
        bool Update(ResellerInfo item);
    }

    public interface IUserRepository
    {
        IEnumerable<UserInfo> GetAll();
        IEnumerable<UserInfo> GetByCompany(UserInfo param);
        IEnumerable<UserInfo> GetAllUser();
        IEnumerable<UserInfo> GetByUser(UserInfo param);
        UserInfo Get(int userID);
        UserInfo Add(UserInfo item);
        bool Remove(int userID);
        bool Update(UserInfo item);
    }

    public interface IDeviceRepository
    {
        IEnumerable<DeviceInfo> GetAll();
        IEnumerable<DeviceInfo> GetAllTags();
        IEnumerable<DeviceInfo> GetByCompany(DeviceInfo param);
        IEnumerable<DeviceInfo> GetTagCompany(DeviceInfo param);
        IEnumerable<DeviceInfo> GetAllDevice();
        IEnumerable<DeviceInfo> GetByDevice(DeviceInfo param);
        IEnumerable<DeviceInfo> GetByKey(DeviceInfo param);
        DeviceInfo Get(int deviceID);
        DeviceInfo Add(DeviceInfo item);
        bool Remove(int deviceID);
        bool Update(DeviceInfo item);
    }

    public interface ICategoryRepository
    {
        IEnumerable<CategoryInfo> GetAll();
        CategoryInfo Get(int categoryID);
        CategoryInfo Add(CategoryInfo item);
        bool Remove(int categoryID);
        bool Update(CategoryInfo item);
    }
    public interface IPestRepository
    {
        IEnumerable<PestInfo> GetAll();
        IEnumerable<PestInfo> GetAllEx();
        IEnumerable<PestInfo> GetByPestName(PestInfo param);
        PestInfo Get(int pestID);
        PestInfo Add(PestInfo item);
        bool Remove(int pestID);
        bool Update(PestInfo item);

    }
    public interface ITreatmentRepository
    {
        IEnumerable<TreatmentInfo> GetAll();
        IEnumerable<TreatmentInfo> GetAllEx();
        IEnumerable<TreatmentInfo> GetByTreatmentName(TreatmentInfo param);
        TreatmentInfo Get(int treatmentID);
        TreatmentInfo Add(TreatmentInfo item);
        bool Remove(int treatmentID);
        bool Update(TreatmentInfo item);

    }
    public interface IPestTreatmentRepository
    {
        IEnumerable<PestTreatmentInfo> GetAll();
        PestTreatmentInfo Get(int id);
        PestTreatmentInfo GetByPestTreatment(PestTreatmentInfo param);
        PestTreatmentInfo Add(PestTreatmentInfo item);
        bool Remove(int id);
        bool Update(PestTreatmentInfo item);
    }
    public interface IMainPestTreatmentRepository
    {
        IEnumerable<MainPestTreatmentInfo> GetAll();
        MainPestTreatmentInfo Get(int id);
        MainPestTreatmentInfo GetByPestTreatment(MainPestTreatmentInfo param);
        MainPestTreatmentInfo Add(MainPestTreatmentInfo item);
        bool Remove(int id);
        bool Update(MainPestTreatmentInfo item);
    }
    public interface IFindingsRepository
    {
        IEnumerable<FindingsInfo> GetAll();
        FindingsInfo Get(int id);
        FindingsInfo GetByFindings(FindingsInfo param);
        FindingsInfo Add(FindingsInfo item);
        bool Remove(int id);
        bool Update(FindingsInfo item);
    }
    public interface IFindingsMaintenanceRepository
    {
        IEnumerable<FindingsMaintenanceInfo> GetAll();
        FindingsMaintenanceInfo Get(int id);
        FindingsMaintenanceInfo GetByFindings(FindingsMaintenanceInfo param);
        FindingsMaintenanceInfo Add(FindingsMaintenanceInfo item);
        bool Remove(int id);
        bool Update(FindingsMaintenanceInfo item);
    }
    public interface IAocRepository
    {
        IEnumerable<AocInfo> GetAll();
        AocInfo Get(int aocID);
    }
    public interface IRecommendationsRepository
    {
        IEnumerable<RecommendationsInfo> GetAll();
        IEnumerable<RecommendationsInfo> GetAllEx();
        IEnumerable<RecommendationsInfo> GetByRecommendationName(RecommendationsInfo param);
        RecommendationsInfo Get(int recommendationID);
        RecommendationsInfo Add(RecommendationsInfo item);
        bool Remove(int recommendationID);
        bool Update(RecommendationsInfo item);
    }
    public interface IAcRepository
    {
        IEnumerable<AcInfo> GetAll();
        IEnumerable<AcInfo> GetAllEx();
        IEnumerable<AcInfo> GetAc(AcInfo param);
        AcInfo Get(int acID);
    }

    public interface IAcMyRepository
    {
        IEnumerable<AcMyInfo> GetAll();
        IEnumerable<AcMyInfo> GetAllEx();
        IEnumerable<AcMyInfo> GetAc(AcMyInfo param);
        AcMyInfo Get(int acID);
    }

    public interface IEmailFlagRepository
    {
        IEnumerable<EmailFlagInfo> GetAll();
        EmailFlagInfo Get(int emailflagID);

    }

    public interface IZoneTypeRepository
     {
         IEnumerable<ZoneTypeInfo> GetAll();
         ZoneTypeInfo Get(int zonetypeID);
         ZoneTypeInfo Add(ZoneTypeInfo item);
         bool Remove(int zonetypeID);
         bool Update(ZoneTypeInfo item);
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
         long GetByUserID(long iUserID);
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
        PosInfo Get(int posID);
        IEnumerable<PosInfo> Get(PosInfo value);
        IEnumerable<PosInfo> GetCvr(PosInfo value);
        PosInfo Add(PosInfo item);
        bool Remove(int posID);
        bool Update(PosInfo item);
        bool UpdateLocation(PosInfo item);


    }

    public interface IJobRepository
    {
        IEnumerable<JobInfo> GetAll();
        IEnumerable<JobOverviewInfo> GetAllOverview();
        JobInfo Get(int jobID);
        IEnumerable<AppInfo> Clear();
        IEnumerable<JobInfo> GetHistory(JobInfo param);
        IEnumerable<JobOverviewInfo> GetJobOverview(JobOverviewInfo param);
        IEnumerable<AppInfo> GetByCompany(AppInfo param);
        IEnumerable<JobInfo> GetByCompanyEx(JobInfo param);
        IEnumerable<JobInfo> GetJobList(JobInfo param);
        IEnumerable<JobInfo> GetIncompleteJobs(JobInfo param);
        JobInfo GetIncompleteJobsEx(JobInfo item);
        IEnumerable<JobInfo> ClearJobs();
        JobInfo Add(JobInfo item);
        bool Remove(int jobID);
        bool Update(JobInfo item);

    }
    public interface IInventoryRepository
    {
        IEnumerable<InventoryInfo> GetAll();
        InventoryInfo Get(int inventoryID);
        IEnumerable<InventoryInfo> GetByCompany(InventoryInfo param);
        IEnumerable<InventoryInfo> ClearInventory();
        IEnumerable<InventoryInfo> GetByInventory(InventoryInfo param);
        InventoryInfo Add(InventoryInfo item);
        bool Remove(int inventoryID);
        bool Update(InventoryInfo item);

    }
    public interface IInventoryHistoryRepository
    {
        IEnumerable<InventoryHistoryInfo> GetAll();
        InventoryHistoryInfo Get(int historyID);
        IEnumerable<InventoryHistoryInfo> GetByCompany(InventoryHistoryInfo param);
        IEnumerable<InventoryHistoryInfo> ClearHistory();
        InventoryHistoryInfo Add(InventoryHistoryInfo item);
        bool Remove(int historyID);
        bool Update(InventoryHistoryInfo item);

    }

    public interface ISearchJobRepository
    {
        IEnumerable<SearchJob> GetAll();
        SearchJob Get(int jobID);
        IEnumerable<SearchJob> GetByCompany(SearchJob param);
        SearchJob Add(SearchJob item);
        bool Remove(int jobID);
        bool Update(SearchJob item);
       
    }

    public interface IEventRepository
     {
         IEnumerable<EventInfo> GetAll();
         EventInfo Get(int eventID);
         IEnumerable<EventInfo> Get(EventInfo value);
         EventInfo Add(EventInfo item);
         EventInfo SaveLoginEvent(EventInfo item);
         EventInfo SaveLogoutEvent(EventInfo item);
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


    public interface ISearchMessageRepository
    {
        IEnumerable<SearchMessage> GetAll();
        IEnumerable<SearchMessage> Get(SearchMessage param);
        SearchMessage Get(int id);

        SearchMessage Add(SearchMessage currMessage);

        bool Remove(int messageID);

        bool Update(SearchMessage currMessage);

        string SaveMessage(SearchMessage udtMessage);


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

    public interface ICustomerRepository
    {
        IEnumerable<CustomerInfo> GetAll();
        IEnumerable<CustomerInfo> ClearCustomers();
        IEnumerable<CustomerInfo> GetByMember(CustomerInfo param);
        IEnumerable<CustomerInfo> GetByCompany(CustomerInfo param);
        IEnumerable<CustomerInfo> GetByCompanyEx(CustomerInfo param);
        CustomerInfo Get(int memberID);
        CustomerInfo Add(CustomerInfo item);
        bool Remove(int memberID);
        bool Update(CustomerInfo item);
    }

    public interface IMaintenanceRepository
    {
        IEnumerable<MaintenanceInfo> GetAll();
        IEnumerable<MaintenanceInfo> GetAllEx();
        MaintenanceInfo Get(int maintenanceID);
        IEnumerable<MaintenanceInfo> GetMaintenance(MaintenanceInfo param);
        IEnumerable<MaintenanceInfo> GetMaintenanceFilter(MaintenanceInfo param);
        IEnumerable<MaintenanceInfo> GetNextMaintenance(MaintenanceInfo param);
        IEnumerable<MaintenanceInfo> GetAutoCompleteCompany(MaintenanceInfo param);
        IEnumerable<MaintenanceInfo> GetAutoCompleteAddress(MaintenanceInfo param);      
        MaintenanceInfo Add(MaintenanceInfo item);
        bool Remove(int maintenanceID);
        bool Update(MaintenanceInfo item);

    }
    public interface IMaintenanceJobRepository
    {
        IEnumerable<MaintenanceJobInfo> GetAll();
        IEnumerable<MaintenanceJobInfo> GetAllEx();
        IEnumerable<MaintenanceCalJobInfo> GetAllCal();
        MaintenanceJobInfo Get(long maintenancejobID);
        MaintenanceJobInfo GetMaintenance(int maintenancejobID);
        IEnumerable<MaintenanceJobInfo> GetMaintenanceJob(MaintenanceJobInfo param);
        IEnumerable<MaintenanceCalJobInfo> GetMaintenanceJobByCal(MaintenanceCalJobInfo param);
        MaintenanceJobInfo Add(MaintenanceJobInfo item);
        MaintenanceJobInfo Email(MaintenanceJobInfo item);
        Task<MaintenanceJobInfo> CustomEmailAsync(MaintenanceJobInfo item);
        MaintenanceJobInfo BulkDelete(MaintenanceJobInfo item);
        IEnumerable<MaintenanceJobInfo> EmailBlast(MaintenanceJobInfo item);
        bool Remove(long maintenancejobID);
        bool RemoveMainJob(long maintenancejobID);
        bool Update(MaintenanceJobInfo item);
        bool UpdateFlag(MaintenanceJobInfo item);
        bool UpdateReference(MaintenanceJobInfo item);

    }
 
}


