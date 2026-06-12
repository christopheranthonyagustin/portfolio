using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public static int GetDriverId(string driverName)
        {
            DriverInfo currDriver = new DriverInfo();
            try
            {
                DriverRepository driverRepo = new DriverRepository();
                currDriver = driverRepo.GetByName(driverName);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetDriverId", System.Diagnostics.EventLogEntryType.Error);
            }
            return currDriver.DriverID;
        }


        public static int GetTagId(string tagName)
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