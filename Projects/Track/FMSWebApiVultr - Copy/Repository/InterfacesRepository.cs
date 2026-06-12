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
    public interface IAssetRepository
    {
        IEnumerable<AssetInfo> ClearAll();
        IEnumerable<AssetInfo> GetAll();
        AssetInfo Get(int assetID);
        IEnumerable<AssetInfo> GetAssetByName(string asset);
        IEnumerable<AssetInfo> GetAssetsEx(UserInfo param);
        AssetInfo Add(AssetInfo item);
        AssetInfo UpdateAsset(AssetInfo item);
        bool Remove(int assetID);
        bool Update(AssetInfo item);
        void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp);
        string GetImage(string strName, ref string strFill);
    }

    public interface IZoneRepository
    {
        IEnumerable<ZoneInfo> GetAll();
        ZoneInfo Get(int zoneID);
        IEnumerable<ZoneInfo> GetByCompany(ZoneInfo param);
        IEnumerable<ZoneInfo> GetByCompanyFilter(ZoneInfo param);
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

    public interface IDeviceRepository
    {
        IEnumerable<DeviceInfo> GetAll();
        IEnumerable<DeviceInfo> GetByCompany(DeviceInfo param);
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
        PosInfo Get(long posID);
        IEnumerable<PosInfo> Get(PosInfo value);
        PosInfo Add(PosInfo item);
        bool Remove(long posID);
        bool Update(PosInfo item);


    }

    public interface IJobRepository
    {
        IEnumerable<JobInfo> GetAll();
        JobInfo Get(int jobID);
        IEnumerable<JobInfo> GetByDriver(JobInfo param);
        IEnumerable<JobInfo> GetByCompany(JobInfo param);
        JobInfo Add(JobInfo item);
        bool Remove(int jobID);
        bool Update(JobInfo item);
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


    public interface IStatusRepository
    {

        IEnumerable<StatusInfo> GetAll();
        StatusInfo Get(int statusID);
        StatusInfo GetByDesc(string statusName);
        StatusInfo Add(StatusInfo currStatus);
        bool Remove(int statusID);
        bool Update(StatusInfo currStatus);

    }

    public interface IUtilizationRepository
    {
        IEnumerable<UtilizationInfo> GetAll();
        IEnumerable<UtilizationInfo> GetUtilizationInfo(UtilizationInfo value);
        UtilizationInfo Get(int utilID);
        UtilizationInfo Add(UtilizationInfo item);
        bool Remove(int utilID);
        bool Update(UtilizationInfo item);
    }

    public interface IIdlingRepository
    {
        IEnumerable<IdlingInfo> GetAll();
        IEnumerable<IdlingInfo> GetIdlingInfo(IdlingInfo value);
        IdlingInfo Get(int idlingID);
    }

    public interface IRouteRepository
    {
        IEnumerable<RouteInfo> GetAll();
        IEnumerable<RouteInfo> GetByCompany(RouteInfo param);
        RouteInfo Get(int routeID);
        RouteInfo Add(RouteInfo item);
        bool Remove(int routeID);
        bool Update(RouteInfo item);
    }

    public interface IRouteLocationRepository
    {
        IEnumerable<RouteLocationInfo> GetAll();
        IEnumerable<RouteLocationInfo> GetByDriver(RouteLocationInfo param);
        RouteLocationInfo Get(int locID);
        RouteLocationInfo Add(RouteLocationInfo item);
        bool Remove(int locID);
        bool Update(RouteLocationInfo item);
    }
    public interface IServicingRepository
    {
        IEnumerable<ServicingInfo> GetAll();
        IEnumerable<ServicingInfo> GetByCompany(ServicingInfo param);
        IEnumerable<ServicingInfo> GetServiceAsset(ServicingInfo param);
        ServicingInfo Get(int serviceID);
        ServicingInfo Add(ServicingInfo item);
        bool Remove(int serviceID);
        bool Update(ServicingInfo item);
    }

    public interface IMakeRepository
    {
        IEnumerable<MakeInfo> GetAll();
        MakeInfo Get(int makeID);
        MakeInfo Add(MakeInfo item);
        bool Remove(int makeID);
        bool Update(MakeInfo item);
    }

    public interface IFlagValueRepository
    {
        IEnumerable<FlagValueInfo> GetAll();
        IEnumerable<FlagValueInfo> GetAllFlag();
    }

    public interface ITransmissionRepository
    {
        IEnumerable<TransmissionInfo> GetAll();

    }

    public interface IFuelTypeRepository
    {
        IEnumerable<FuelTypeInfo> GetAll();

    }

    public interface IServiceTypeRepository
    {
        IEnumerable<ServiceTypeInfo> GetAll();

    }
    public interface IContractTypeRepository
    {
        IEnumerable<ContractTypeInfo> GetAll();

    }

    public interface INotifRepository
    {
        IEnumerable<NotificationIntervalInfo> GetAll();
        IEnumerable<NotificationIntervalInfo> GetNotifInterval(NotificationIntervalInfo param);
    }

    public interface IContractRepository
    {
        IEnumerable<ContractInfo> GetAll();
        IEnumerable<ContractInfo> GetContractFiltered(ContractInfo param);
        ContractInfo Get(int contractID);
        ContractInfo Add(ContractInfo item);
        bool Remove(int contractID);
        bool Update(ContractInfo item);
    }

    public interface IContractAlertRepository
    {
        IEnumerable<ContractAlertInfo> GetAll();
        IEnumerable<ContractAlertInfo> GetContractAlertFiltered(ContractAlertInfo param);
        ContractAlertInfo Get(int contractID);
        ContractAlertInfo Add(ContractAlertInfo item);
        bool Remove(int contractID);
        bool RemoveContract(int contractID);
        bool Update(ContractAlertInfo item);
    }


}


