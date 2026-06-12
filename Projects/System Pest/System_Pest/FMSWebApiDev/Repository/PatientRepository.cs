using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Web.UI.WebControls;

namespace FMSWebApi.Repository
{
    public class PatientRepository : IPatientRepository
    {
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;max pool size=500;";
        private string mProjName = "TRACKLitePro";
        public IEnumerable<PatientInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PatientInfo> arrPatients = new List<PatientInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_patients";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();


                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        PatientInfo currPatient = DataMgrTools.BuildPatient(reader);

                        string strFill = "";
                        currPatient.Image = GetImage(String.Format("patients/{0}", currPatient.PatientID), ref strFill);
                        currPatient.ImageFill = strFill;

                        arrPatients.Add(currPatient);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(PatientRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrPatients.ToArray();
        }

        public IEnumerable<PatientInfo> ClearAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PatientInfo> arrPatients = new List<PatientInfo>();

            return arrPatients.ToArray();
        }

        public IEnumerable<PatientInfo> GetByCompany(PatientInfo param)
        {

            List<PatientInfo> arrPatients = new List<PatientInfo>();
            PatientInfo currPatient = new PatientInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_patients WHERE reseller_id = @ResellerID";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID order by patient_name asc";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currPatient = DataMgrTools.BuildPatient(reader);
                                    string strFill = "";
                                    currPatient.Image = GetImage(String.Format("patients/{0}", currPatient.PatientID), ref strFill);
                                    currPatient.ImageFill = strFill;
                                    arrPatients.Add(currPatient);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByPatientID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrPatients;
        }

        public IEnumerable<PatientInfo> GetByPatient(PatientInfo param)
        {

            List<PatientInfo> arrPatients = new List<PatientInfo>();
            PatientInfo currPatient = new PatientInfo();
            object objTemp = new object();


            string query = "SELECT * FROM view_patients WHERE patient_name = @Name";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", param.Name);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currPatient = DataMgrTools.BuildPatient(reader);
                                    arrPatients.Add(currPatient);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByPatient)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrPatients;
        }

        public PatientInfo Get(int id)
        {
            PatientInfo currPatient = new PatientInfo();
            string query = string.Format("SELECT * FROM patients WHERE patient_id = {0}", id);
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currPatient = DataMgrTools.BuildPatient(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(PatientRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currPatient;
        }

        public PatientInfo Add(PatientInfo currPatient)
        {

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO patients (patient_name, unit, address, dialysis_centre, phone, birthdate, caller_phone, caller_name" +
                                ", company_id, reseller_id, bloodtype, remarks, remarks2, created_date, modified_date, created_by, modified_by, created_byName, modified_byName, email, day1, day2, day3) " +
                                "VALUES (@Name, @unit, @Address, @DialysisCentre, @Phone, @DateOfBirth, @CallerPhone, @CallerName, @CompanyID, @ResellerID, @BloodType, @Remarks, @Remarks2"
                                + ", @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy, @CreatedByName, @ModifiedByName, @Email, @TreatmentDay1, @TreatmentDay2, @TreatmentDay3)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currPatient.Name);
                        cmd.Parameters.AddWithValue("@Unit", currPatient.Unit);
                        cmd.Parameters.AddWithValue("@Address", currPatient.Address);
                        cmd.Parameters.AddWithValue("@DialysisCentre", currPatient.DialysisCentre);
                        cmd.Parameters.AddWithValue("@Phone", currPatient.Phone);
                        cmd.Parameters.AddWithValue("@DateOfBirth", currPatient.DateOfBirth);
                        cmd.Parameters.AddWithValue("@CallerPhone", currPatient.CallerPhone);
                        cmd.Parameters.AddWithValue("@CallerName", currPatient.CallerName);
                        cmd.Parameters.AddWithValue("@CompanyID", currPatient.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", currPatient.ResellerID);
                        cmd.Parameters.AddWithValue("@BloodType", currPatient.BloodType);
                        cmd.Parameters.AddWithValue("@Remarks", currPatient.Remarks);
                        cmd.Parameters.AddWithValue("@Remarks2", currPatient.Remarks2);
                        cmd.Parameters.AddWithValue("@CreatedDate", currPatient.CreatedDate);
                        cmd.Parameters.AddWithValue("@ModifiedDate", currPatient.ModifiedDate);
                        cmd.Parameters.AddWithValue("@CreatedBy", currPatient.CreatedBy);
                        cmd.Parameters.AddWithValue("@ModifiedBy", currPatient.ModifiedBy);
                        cmd.Parameters.AddWithValue("@CreatedByName", currPatient.CreatedByName);
                        cmd.Parameters.AddWithValue("@ModifiedByName", currPatient.ModifiedByName);
                        cmd.Parameters.AddWithValue("@Email", currPatient.Email);
                        cmd.Parameters.AddWithValue("@TreatmentDay1", currPatient.TreatmentDay1);
                        cmd.Parameters.AddWithValue("@TreatmentDay2", currPatient.TreatmentDay2);
                        cmd.Parameters.AddWithValue("@TreatmentDay3", currPatient.TreatmentDay3);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(PatientRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currPatient;
        }

        public bool Remove(int patientID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM patients WHERE patient_id = {0}", patientID);
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(PatientRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            DeleteImage(String.Format("patients/{0}", patientID));


            return retVal;
        }

        public bool Update(PatientInfo currPatient)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE patients SET patient_name = @Name, unit = @Unit, address = @Address, dialysis_centre = @DialysisCentre, phone = @Phone, birthdate = @DateOfBirth, caller_phone = @CallerPhone, caller_name = @CallerName, " +
                                            "company_id = @CompanyID, reseller_id = @ResellerID, bloodtype = @BloodType, remarks = @Remarks, remarks2 = @Remarks2" +
                                            ", created_date = @CreatedDate, modified_date = @ModifiedDate, created_by = @CreatedBy, modified_by = @ModifiedBy, created_byName = @CreatedByName, modified_byName = @ModifiedByName, email = @Email, day1 = @TreatmentDay1, day2 = @TreatmentDay2, day3 = @TreatmentDay3 WHERE patient_id = @PatientID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currPatient.Name);
                        cmd.Parameters.AddWithValue("@Unit", currPatient.Unit);
                        cmd.Parameters.AddWithValue("@Address", currPatient.Address);
                        cmd.Parameters.AddWithValue("@DialysisCentre", currPatient.DialysisCentre);
                        cmd.Parameters.AddWithValue("@Phone", currPatient.Phone);
                        cmd.Parameters.AddWithValue("@DateOfBirth", currPatient.DateOfBirth);
                        cmd.Parameters.AddWithValue("@CallerPhone", currPatient.CallerPhone);
                        cmd.Parameters.AddWithValue("@CallerName", currPatient.CallerName);
                        cmd.Parameters.AddWithValue("@CompanyID", currPatient.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", currPatient.ResellerID);
                        cmd.Parameters.AddWithValue("@BloodType", currPatient.BloodType);
                        cmd.Parameters.AddWithValue("@Remarks", currPatient.Remarks);
                        cmd.Parameters.AddWithValue("@Remarks2", currPatient.Remarks2);
                        cmd.Parameters.AddWithValue("@CreatedDate", currPatient.CreatedDate);
                        cmd.Parameters.AddWithValue("@ModifiedDate", currPatient.ModifiedDate);
                        cmd.Parameters.AddWithValue("@CreatedBy", currPatient.CreatedBy);
                        cmd.Parameters.AddWithValue("@ModifiedBy", currPatient.ModifiedBy);
                        cmd.Parameters.AddWithValue("@CreatedByName", currPatient.CreatedByName);
                        cmd.Parameters.AddWithValue("@ModifiedByName", currPatient.ModifiedByName);
                        cmd.Parameters.AddWithValue("@Email", currPatient.Email);
                        cmd.Parameters.AddWithValue("@TreatmentDay1", currPatient.TreatmentDay1);
                        cmd.Parameters.AddWithValue("@TreatmentDay2", currPatient.TreatmentDay2);
                        cmd.Parameters.AddWithValue("@TreatmentDay3", currPatient.TreatmentDay3);
                        cmd.Parameters.AddWithValue("@PatientID", currPatient.PatientID);
                        
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(PatientRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    //string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);
                    string strUri = String.Format("{0}/images/{1}", "http://103.237.168.119/trackliteprodevwebapi", strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        // return image path
                        strFill = "Uniform";
                        return String.Format("{0}?dt={1:ddMMMyyHHmmss}", strUri, File.GetLastWriteTimeUtc(strFile));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + "-(Get Image)", System.Diagnostics.EventLogEntryType.Error);     
            }

            // image file not found
            strFill = "None";
            return strName;
        }

        /// <summary>
        /// deletes image file
        /// </summary>
        /// <param name="strName"></param>
        public void DeleteImage(string strName)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    // check file path
                    string strFile = String.Format("{0}images\\{1}.{2}",
                        HostingEnvironment.ApplicationPhysicalPath, strName, strType);
                    if (File.Exists(strFile))
                    {
                        // return image path
                        File.Delete(strFile);
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + "-(Delete Image)", System.Diagnostics.EventLogEntryType.Error);      
            }
        }

        
    }
}