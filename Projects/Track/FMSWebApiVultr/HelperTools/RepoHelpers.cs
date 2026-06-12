using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace FMSWebApi
{
    public class RepoHelpers
    {
        public static int GetCompanyId(string coyName)
        {
            CompanyInfo currCoy = new CompanyInfo();
            try
            {
                CompanyRepository coyRepo = new CompanyRepository();
                currCoy = coyRepo.GetByName(coyName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetCompanyId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currCoy.CompanyID;
        }

        public static long GetAssetId(string assetName, int companyID)
        {
            AssetInfo currAsset = new AssetInfo();
            try
            {
                AssetRepository assetRepo = new AssetRepository();
                currAsset = assetRepo.GetByName(assetName, companyID);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetAssetId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currAsset.AssetID;
        }

        public static long GetCustomerId(string cusName, int companyID)
        {
            CustomerInfo currCus = new CustomerInfo();
            try
            {
                CustomerRepository cusRepo = new CustomerRepository();
                currCus = cusRepo.GetByName(cusName, companyID);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetCustomerId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currCus.CustomerID;
        }

        public static long GetDriverId(string driverName, int companyID)
        {
            DriverInfo currDriver = new DriverInfo();
            try
            {
                DriverRepository driverRepo = new DriverRepository();
                currDriver = driverRepo.GetByName(driverName, companyID);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetDriverId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currDriver.DriverID;
        }

        public static long GetCusItemId(string reference_no, long company_id)
        {
            SubInventoryItemInfo currCusItemID = new SubInventoryItemInfo();
            try
            {
                SubInventoryItemRepository cusItemRepo = new SubInventoryItemRepository();
                currCusItemID = cusItemRepo.GetByReferenceNo(reference_no, company_id);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetCusItemId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currCusItemID.SubInventoryItemID;
        }

        public static string GetFeatureId(string features)
        {
            string retVal = "";
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            try
            {
                AssetFeatureRepository assetFeatureRepo = new AssetFeatureRepository();

                string[] arrFeatures = features.Split(",".ToCharArray());

                for (int i = 0; i < arrFeatures.Length; i++)
                {
                    currFeature = assetFeatureRepo.GetByName(arrFeatures[i]);
                    if (i == arrFeatures.Length - 1) retVal += string.Format("{0}", currFeature.FeatureID.ToString());
                     else retVal += string.Format("{0}{1}", currFeature.FeatureID.ToString(), ",");
                }           
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetFeatureId", System.Diagnostics.EventLogEntryType.Error);
            }
            return retVal; 
        }
    


        public static string GetAccessoriesId(string accessories, int companyID)
        {
            string retVal = "";
            MainInventoryItemInfo currAccessories = new MainInventoryItemInfo();
            try
            {
                MainInventoryItemRepository accessoriesRepo = new MainInventoryItemRepository();

                string[] arrAccessories = accessories.Split(",".ToCharArray());

                for (int i = 0; i < arrAccessories.Length; i++)
                {
                    currAccessories = accessoriesRepo.GetByName(arrAccessories[i], companyID);
                    if (i == arrAccessories.Length - 1) retVal += string.Format("{0}", currAccessories.MainInventoryItemID.ToString());
                    else retVal += string.Format("{0}{1}", currAccessories.MainInventoryItemID.ToString(), ",");
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetFeatureId", System.Diagnostics.EventLogEntryType.Error);
            }
            return retVal;
        }

        public static long GetPickupId(string route_no, string order_no)
        {
            VrpPickupInfo currPickup = new VrpPickupInfo();
            try
            {
                VrpPickupRepository pickupRepo = new VrpPickupRepository();
                currPickup = pickupRepo.GetByOrder(route_no, order_no);

            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetPickupId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currPickup.PickupID;
        }

        public static long GetRegionId(string regionName, int companyID)
        {
            RegionInfo currRegion = new RegionInfo();
            try
            {
                RegionRepository regionRepo = new RegionRepository();
                currRegion = regionRepo.GetByName(regionName, companyID);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetRegionId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currRegion.RegionID;
        }


        public static long GetTagId(string tagName)
        {
            DeviceInfo currDevice = new DeviceInfo();
            try
            {
                DeviceRepository deviceRepo = new DeviceRepository();
                currDevice = deviceRepo.GetByName(tagName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetTagId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currDevice.DeviceID;
        }


        public static int GetCategoryId(string categoryName)
        {
            CategoryInfo currCategory = new CategoryInfo();
            try
            {
                CategoryRepository categoryRepo = new CategoryRepository();
                currCategory = categoryRepo.GetByName(categoryName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetCategoryId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currCategory.CategoryID;
        }


        public static int GetRoleId(string roleName)
        {
            RoleInfo currRole = new RoleInfo();
            try
            {
                RoleRepository roleRepo = new RoleRepository();
                currRole = roleRepo.GetByRole(roleName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetRoleId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currRole.RoleID;
        }


        public static int GetLangId(string langName)
        {
            LanguageInfo currLang = new LanguageInfo();
            try
            {
                LanguageRepository langRepo = new LanguageRepository();
                currLang = langRepo.GetByLanguage(langName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetLanguageId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currLang.LanguageID;
        }


        public static long GetEventId(string eventName)
        {
            EventInfo currEvent = new EventInfo();
            try
            {
                EventRepository eventRepo = new EventRepository();
                currEvent = eventRepo.GetByEvent(eventName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetEventId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currEvent.EventID;
        }


        public static object ConvertFlagStr(string status)
        {
            return status;
        }

        public static object ConvertFlagInt(int status)
        {
            return status;
        }
    }
}