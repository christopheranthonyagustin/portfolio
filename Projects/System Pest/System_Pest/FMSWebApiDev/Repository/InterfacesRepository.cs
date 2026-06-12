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

    public interface ISettingsRepository
    {
        IEnumerable<ComfortSettingsInfo> GetComfort();
        IEnumerable<RoyalSettingsInfo> GetRoyal();
        IEnumerable<DemoSettingsInfo> GetDemo();
        IEnumerable<ReverseGeocodeInfo> GetReverseGeocode(ReverseGeocodeInfo param);
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
        IEnumerable<ResellerInfo> GetAllReseller();
        IEnumerable<ResellerInfo> GetByReseller(ResellerInfo param);
        ResellerInfo Get(int resellerID);
        ResellerInfo Add(ResellerInfo item);
        bool Remove(int resellerID);
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
        PosInfo Get(int posID);
        IEnumerable<PosInfo> Get(PosInfo value);
        IEnumerable<PosInfo> GetCvr(PosInfo value);
        PosInfo Add(PosInfo item);
        bool Remove(int posID);
        bool Update(PosInfo item);


    }

    public interface IJobRepository
    {
        IEnumerable<JobInfo> GetAll();
        JobInfo Get(int jobID);
        IEnumerable<JobInfo> GetByCompany(JobInfo param);
        IEnumerable<JobInfo> GetByCompanyEx(JobInfo param);
        IEnumerable<JobInfo> GetJobList(JobInfo param);
        IEnumerable<JobInfo> GetIncompleteJobs(JobInfo param);
        JobInfo GetIncompleteJobsEx(JobInfo item);
        IEnumerable<JobInfo> ClearJobs();
        JobInfo LogoutAsset(JobInfo item);
        Object GetAssetByJobEx(Object item);
        JobInfo GetAssetByJobDriver(JobInfo item);
        JobInfo Add(JobInfo item);
        bool Remove(int jobID);
        bool Update(JobInfo item);

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

    public interface IPatientRepository
    {
        IEnumerable<PatientInfo> GetAll();
        IEnumerable<PatientInfo> ClearAll();
        IEnumerable<PatientInfo> GetByCompany(PatientInfo param);
        IEnumerable<PatientInfo> GetByPatient(PatientInfo param);
        PatientInfo Get(int patientID);
        PatientInfo Add(PatientInfo item);
        bool Remove(int patientID);
        bool Update(PatientInfo item);

    }

  
}


