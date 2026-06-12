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
        UserInfo Add(UserInfo item);
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
        AssetInfo Get(long assetID);
        IEnumerable<AssetInfo> GetAssetByName(AssetInfo param);
        IEnumerable<AssetInfo> GetAssetsEx(UserInfo param);
        AssetInfo LogoutAssetByTag(AssetInfo item);
        AssetInfo GetAssetByTag(AssetInfo item);
        AssetInfo Add(AssetInfo item);
        AssetInfo UpdateAsset(AssetInfo item);
        bool Remove(long assetID);
        bool Update(AssetInfo item);
        void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, long iAssetID, DateTime dtTimestamp);
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
        IEnumerable<DriverInfo> ClearAll();
        IEnumerable<DriverInfo> GetAll();
        IEnumerable<DriverInfo> GetByCompany(DriverInfo param);
        DriverInfo Get(int driverID);
        DriverInfo Add(DriverInfo item);
        bool Remove(int driverID);
        bool Update(DriverInfo item);
        bool UpdateDriver(UpdateDriverInfo item);
        DriverInfo GetForgotPassword(DriverInfo param);
        IEnumerable<DriverInfo> GetDriverByName(DriverInfo param);
    }

    public interface ICustomerRepository
    {
        IEnumerable<CustomerInfo> GetAll();
        IEnumerable<CustomerInfo> GetByCompany(CustomerInfo param);
        CustomerInfo Get(int id);
        CustomerInfo Add(CustomerInfo item);
        bool Remove(int id);
        bool Update(CustomerInfo item);
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

    public interface IStockMovementRepository
    {
        IEnumerable<StockMovementInfo> GetAll();
        IEnumerable<StockMovementInfo> GetByRouteNo(StockMovementInfo param);
        StockMovementInfo GetByUploadNo(string upload_no, string order_no, string sku);
        StockMovementInfo Get(int id);
        StockMovementInfo Add(StockMovementInfo item);
        Task<StockMovementInfo> AddImportAsync(StockMovementInfo item);
        bool Remove(int id);
        bool Update(StockMovementInfo item);
    }

    public interface IBigSellerOrderRepository
    {
        IEnumerable<BigSellerOrderInfo> GetAll();
        IEnumerable<BigSellerOrderInfo> GetByUploadNo(BigSellerOrderInfo param);
        BigSellerOrderInfo Get(int id);
        BigSellerOrderInfo Add(BigSellerOrderInfo item);
        Task<BigSellerOrderInfo> AddImportAsync(BigSellerOrderInfo item);
        Task<BigSellerOrderInfo> SaveGI(BigSellerOrderInfo item);
        bool Remove(int id);
        bool Update(BigSellerOrderInfo item);
    }


    public interface IVrpSettingsRepository
    {
        IEnumerable<VrpSettingsInfo> GetAll();
        IEnumerable<VrpSettingsInfo> GetByRouteNo(VrpSettingsInfo param);
        VrpSettingsInfo Get(int id);
        VrpSettingsInfo Add(VrpSettingsInfo item);
        Task<VrpSettingsInfo> AddImportAsync(VrpSettingsInfo item);
        bool Remove(int id);
        bool Update(VrpSettingsInfo item);
        bool CheckAsset(string route_no, long asset_id, int company_id);
        bool CheckDriver(string route_no, long driver_id, int company_id);
    }
    public interface IVrpSettingsAreaRepository
    {
        IEnumerable<VrpSettingsAreaInfo> GetAll();
        IEnumerable<VrpSettingsAreaInfo> GetById(VrpSettingsAreaInfo param);
        VrpSettingsAreaInfo Get(int id);
        VrpSettingsAreaInfo Add(VrpSettingsAreaInfo item);
        bool Remove(int id);
        bool Update(VrpSettingsAreaInfo item);
        bool RemoveVrpSettingsArea(VrpSettingsAreaInfo item);
    }
    public interface IVrpRouteRepository
    {
        IEnumerable<VrpRouteInfo> GetAll();
        VrpRouteInfo Get(long id);
        IEnumerable<VrpRouteInfo> GetByRouteNo(VrpRouteInfo param);
        VrpRouteInfo AddOrder(VrpRouteInfo item);
        VrpRouteInfo DeleteOrder(VrpRouteInfo item);
        bool Update(VrpRouteInfo item);
        bool UpdateRoutes(VrpRouteInfo item);
        bool Cancel(VrpRouteInfo item);
        bool CancelByRouteID(VrpRouteInfo item);
    }
    public interface IVrpPickupDeliveryRepository
    {
        IEnumerable<VrpPickupDeliveryInfo> GetAll();
        IEnumerable<VrpPickupDeliveryInfo> GetByRouteNo(VrpPickupDeliveryInfo param);
        IEnumerable<VrpPickupDeliveryInfo> GetOrders(VrpPickupDeliveryInfo param);
        bool UpdatePickupDelivery(VrpPickupInfo item);
    }
    public interface IVrpPickupRepository
    {
        IEnumerable<VrpPickupInfo> GetAll();
        IEnumerable<VrpPickupInfo> GetByRouteNo(VrpPickupInfo param);
        VrpPickupInfo Get(int id);
        VrpPickupInfo Add(VrpPickupInfo item);
        VrpPickupInfo AddImport(VrpPickupInfo item);
        bool Remove(int id);
        bool RemovePickup(VrpPickupInfo item);
        bool Update(VrpPickupInfo item);
        bool UpdatePickupDriver(VrpPickupInfo item);
    }
    public interface IVrpPickupItemRepository
    {
        IEnumerable<VrpPickupItemInfo> GetAll();
        IEnumerable<VrpPickupItemInfo> GetByID(VrpPickupItemInfo param);
        VrpPickupItemInfo Get(int id);
        VrpPickupItemInfo Add(VrpPickupItemInfo item);
        Task<VrpPickupItemInfo> AddImportAsync(VrpPickupItemInfo item);
        bool Remove(int id);
        bool RemovePickupItem(VrpPickupItemInfo item);
        bool Update(VrpPickupItemInfo item);
    }
    public interface IVrpDeliveryRepository
    {
        IEnumerable<VrpDeliveryInfo> GetAll();
        IEnumerable<VrpDeliveryInfo> GetByRouteNo(VrpDeliveryInfo param);
        VrpDeliveryInfo Get(int id);
        VrpDeliveryInfo Add(VrpDeliveryInfo item);
        VrpDeliveryInfo AddImport(VrpDeliveryInfo item);
        bool Remove(int id);
        bool RemovePickup(VrpDeliveryInfo item);
        bool Update(VrpDeliveryInfo item);
        bool UpdateDeliveryDriver(VrpDeliveryInfo item);
    }
    public interface IVrpDeliveryItemRepository
    {
        IEnumerable<VrpDeliveryItemInfo> GetAll();
        IEnumerable<VrpDeliveryItemInfo> GetByID(VrpDeliveryItemInfo param);
        VrpDeliveryItemInfo Get(int id);
        VrpDeliveryItemInfo Add(VrpDeliveryItemInfo item);
        Task<VrpDeliveryItemInfo> AddImportAsync(VrpDeliveryItemInfo item);
        bool Remove(int id);
        bool RemoveDeliveryItem(VrpDeliveryItemInfo item);
        bool Update(VrpDeliveryItemInfo item);
    }
    public interface ISupplierRepository
    {
        IEnumerable<SupplierInfo> GetAll();
        IEnumerable<SupplierInfo> GetByCompanyID(SupplierInfo param);
        SupplierInfo Get(int id);
        SupplierInfo Add(SupplierInfo item);
        bool Remove(int id);
        bool Update(SupplierInfo item);
    }

    public interface IMainInventoryItemRepository
    {
        IEnumerable<MainInventoryItemInfo> GetAll();
        IEnumerable<MainInventoryItemInfo> GetByCompanyID(MainInventoryItemInfo param);
        MainInventoryItemInfo Get(long id);
        MainInventoryItemInfo Add(MainInventoryItemInfo item);
        bool Remove(int id);
        bool Update(MainInventoryItemInfo item);
        bool UpdateItem(MainInventoryItemInfo item);
    }
    public interface IMainInventoryHistoryRepository
    {
        IEnumerable<MainInventoryHistoryInfo> GetAll();
        MainInventoryHistoryInfo Get(int id);
        IEnumerable<MainInventoryHistoryInfo> GetByCompany(MainInventoryHistoryInfo param);
        IEnumerable<MainInventoryHistoryInfo> GetByCategory(MainInventoryHistoryInfo param);
        IEnumerable<MainInventoryHistoryInfo> ClearHistory();
        MainInventoryHistoryInfo Add(MainInventoryHistoryInfo item);
        IEnumerable<MainInventoryHistoryInfo> UpdateAll(MainInventoryHistoryInfo param);
        bool Remove(int id);
        bool Update(MainInventoryHistoryInfo item);
    }
    public interface IMainInventoryBranchRepository
    {
        IEnumerable<MainInventoryBranchInfo> GetAll();
        IEnumerable<MainInventoryBranchInfo> GetByCompanyID(MainInventoryBranchInfo param);
        MainInventoryBranchInfo Get(int id);
        MainInventoryBranchInfo Add(MainInventoryBranchInfo item);
        bool Remove(int id);
        bool Update(MainInventoryBranchInfo item);
    }
    public interface IMainInventoryPurchaseRepository
    {
        IEnumerable<MainInventoryPurchaseInfo> GetAll();
        MainInventoryPurchaseInfo Get(int id);
        IEnumerable<MainInventoryPurchaseInfo> GetByCompany(MainInventoryPurchaseInfo param);
        IEnumerable<MainInventoryPurchaseInfo> ClearPurchase();
        MainInventoryPurchaseInfo Add(MainInventoryPurchaseInfo item);
        bool Remove(int id);
        bool Update(MainInventoryPurchaseInfo item);

    }
    public interface ISubSupplierRepository
    {
        IEnumerable<SubSupplierInfo> GetAll();
        IEnumerable<SubSupplierInfo> GetByCompanyID(SubSupplierInfo param);
        SubSupplierInfo Get(int id);
        SubSupplierInfo Add(SubSupplierInfo item);
        bool Remove(int id);
        bool Update(SubSupplierInfo item);
    }

    public interface ISubInventoryBranchRepository
    {
        IEnumerable<SubInventoryBranchInfo> GetAll();
        IEnumerable<SubInventoryBranchInfo> GetByCompanyID(SubInventoryBranchInfo param);
        SubInventoryBranchInfo Get(int id);
        SubInventoryBranchInfo Add(SubInventoryBranchInfo item);
        bool Remove(int id);
        bool Update(SubInventoryBranchInfo item);
    }
    public interface ISubInventoryPurchaseRepository
    {
        IEnumerable<SubInventoryPurchaseInfo> GetAll();
        SubInventoryPurchaseInfo Get(int id);
        IEnumerable<SubInventoryPurchaseInfo> GetByCompany(SubInventoryPurchaseInfo param);
        IEnumerable<SubInventoryPurchaseInfo> ClearPurchase();
        SubInventoryPurchaseInfo Add(SubInventoryPurchaseInfo item);
        bool Remove(int id);
        bool Update(SubInventoryPurchaseInfo item);
    }
    public interface ISubInventoryItemRepository
    {
        IEnumerable<SubInventoryItemInfo> GetAll();
        IEnumerable<SubInventoryItemInfo> GetByCompanyID(SubInventoryItemInfo param);
        SubInventoryItemInfo Get(long id);
        SubInventoryItemInfo Add(SubInventoryItemInfo item);
        bool Remove(int id);
        bool Update(SubInventoryItemInfo item);
        bool UpdateItem(SubInventoryItemInfo item);
    }
    public interface ISubInventoryHistoryRepository
    {
        IEnumerable<SubInventoryHistoryInfo> GetAll();
        SubInventoryHistoryInfo Get(int id);
        IEnumerable<SubInventoryHistoryInfo> GetByCompany(SubInventoryHistoryInfo param);
        IEnumerable<SubInventoryHistoryInfo> ClearHistory();
        SubInventoryHistoryInfo Add(SubInventoryHistoryInfo item);
        bool Remove(int id);
        bool Update(SubInventoryHistoryInfo item);
        IEnumerable<SubInventoryHistoryInfo> UpdateAll(SubInventoryHistoryInfo param);
    }
    public interface IRegionRepository
    {
        IEnumerable<RegionInfo> GetAll();
        IEnumerable<RegionInfo> GetByCompanyID(RegionInfo param);
        RegionInfo Get(int id);
        RegionInfo Add(RegionInfo item);
        bool Remove(int id);
        bool Update(RegionInfo item);
    }
    public interface IDistrictRepository
    {
        IEnumerable<DistrictInfo> GetAll();
        IEnumerable<DistrictInfo> GetByCompanyID(DistrictInfo param);
        DistrictInfo Get(int id);
        DistrictInfo Add(DistrictInfo item);
        bool Remove(int id);
        bool Update(DistrictInfo item);
    }
    public interface IVrpInitLocationRepository
    {
        IEnumerable<VrpInitLocationInfo> GetAll();
        IEnumerable<VrpInitLocationInfo> GetByRouteNo(VrpInitLocationInfo param);
        VrpInitLocationInfo Get(int id);
        VrpInitLocationInfo Add(VrpInitLocationInfo item);
        bool Remove(int id);
        bool Update(VrpInitLocationInfo item);
    }

    public interface IUserRepository
    {
        IEnumerable<UserInfo> GetAll();
        IEnumerable<UserInfo> GetAllUser();
        IEnumerable<UserInfo> GetByCompany(UserInfo param);
        IEnumerable<UserInfo> GetByEmail(UserInfo param);
        IEnumerable<UserInfo> GetByUser(UserInfo param);
        UserInfo Get(int userID);
        UserInfo Add(UserInfo item);
        bool Remove(int userID);
        bool Update(UserInfo item);
        bool UpdateUser(UpdateUserInfo item);
        UserInfo GetForgotPassword(UserInfo param);
        bool UpdateUserPassword(UpdateUserInfo item);
    }

    public interface IDeviceRepository
    {
        IEnumerable<DeviceInfo> GetAll();
        IEnumerable<DeviceInfo> GetAllDevice();
        IEnumerable<DeviceInfo> GetByCompany(DeviceInfo param);
        IEnumerable<DeviceInfo> GetByDevice(DeviceInfo param);
        DeviceInfo Get(int deviceID);
        DeviceInfo Add(DeviceInfo item);
        bool Remove(int deviceID);
        bool Update(DeviceInfo item);
        bool UpdateTag(DeviceInfo item);
    }
    public interface ICategoryRepository
    {
        IEnumerable<CategoryInfo> GetAll();
        CategoryInfo Get(int id);
        CategoryInfo Add(CategoryInfo item);
        bool Remove(int id);
        bool Update(CategoryInfo item);
    }
    public interface IAssetFeatureRepository
    {
        IEnumerable<AssetFeatureInfo> GetAll();
        IEnumerable<AssetFeatureInfo> GetFeature(AssetFeatureInfo param);
        AssetFeatureInfo Get(int id);
        AssetFeatureInfo Add(AssetFeatureInfo item);
        bool Remove(int id);
        bool Update(AssetFeatureInfo item);
    }

    public interface IStockTypeRepository
    {
        IEnumerable<StockTypeInfo> GetAll();
        StockTypeInfo Get(int id);
        StockTypeInfo Add(StockTypeInfo item);
        bool Remove(int id);
        bool Update(StockTypeInfo item);
    }


    public interface IDriverStatusRepository
    {
        IEnumerable<DriverStatusInfo> GetAll();
        DriverStatusInfo Get(int dsID);
        DriverStatusInfo Add(DriverStatusInfo item);
        bool Remove(int dsID);
        bool Update(DriverStatusInfo item);
    }

    public interface IDriverScheduleRepository
    {
        IEnumerable<DriverScheduleInfo> GetAll();
        IEnumerable<DriverScheduleInfo> GetByDriver(DriverScheduleInfo param);
        DriverScheduleInfo Get(int dsID);
        DriverScheduleInfo Add(DriverScheduleInfo item);
        bool Remove(int dsID);
        bool Update(DriverScheduleInfo item);
    }
    public interface IDriverAttendanceRepository
    {
        IEnumerable<DriverAttendance> ClearAll();
        IEnumerable<DriverAttendance> GetByDriver(DriverAttendance param);
        IEnumerable<DriverAttendanceChart> ClearChart();
        IEnumerable<DriverAttendanceChart> GetByDriverChart(DriverAttendanceChart param);
    }
    public interface IDriverPerformanceRepository
    {
        IEnumerable<VrpDriverPerformance> ClearAll();
        IEnumerable<VrpDriverPerformance> GetByDriver(VrpDriverPerformance param);
        IEnumerable<VrpDriverPerformanceChart> ClearChart();
        IEnumerable<VrpDriverPerformanceChart> GetByDriverChart(VrpDriverPerformanceChart param);
    }
    public interface IDepartmentRepository
    {
        IEnumerable<DepartmentInfo> GetAll();
        DepartmentInfo Get(int deptID);
        DepartmentInfo Add(DepartmentInfo item);
        bool Remove(int deptID);
        bool Update(DepartmentInfo item);
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
        PosInfo AddOneMap(PosInfo item);
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
        bool UpdateRoute(RouteInfo item);
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

    public interface IRouteSalesOrderRepository
    {
        IEnumerable<RouteSalesOrderInfo> GetAll();
        IEnumerable<RouteSalesOrderInfo> GetByID(RouteSalesOrderInfo param);
        RouteSalesOrderInfo Get(int locID);
        RouteSalesOrderInfo Add(RouteSalesOrderInfo item);
        bool Remove(int locID);
        bool Update(RouteSalesOrderInfo item);
    }

    public interface IRouteSalesItemRepository
    {
        IEnumerable<RouteSalesItemInfo> GetAll();
        IEnumerable<RouteSalesItemInfo> GetByID(RouteSalesItemInfo param);
        RouteSalesItemInfo Get(int itemID);
        RouteSalesItemInfo Add(RouteSalesItemInfo item);
        bool Remove(int itemID);
        bool Update(RouteSalesItemInfo item);
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

    public interface ISettingsRepository
    {
       
        IEnumerable<LocationIQForwardGeoCodeResponse> ClearGeocoding();
        IEnumerable<LocationIQForwardGeoCodeResponse> GetForwardGeocoding(LocationIQForwardGeoCode param);
        IEnumerable<LocationIQGeoCodeResponse> GetRetrieveAddress(LocationIQGeoCodeResponse param);
        IEnumerable<LocationIQGeoCodeResponse> GetLocationIQReverseGeocode(LocationIQGeoCodeResponse param);
    }

}


