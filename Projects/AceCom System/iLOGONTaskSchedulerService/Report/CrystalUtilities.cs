using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using Common.Objects;

namespace iLOGONTaskSchedulerService.Report
{
    public class CrystalUtilities
    {
        private string ServerName
        {
            get;
            set;
        }

        private string DbName
        {
            get;
            set;
        }

        private string UserName
        {
            get;
            set;
        }

        private string Password
        {
            get;
            set;
        }


        public string Generate(Common.Objects.UserObj CurrentUser, string path, string rptFilename, string param, Dictionary<string, string> cParam, string TaskCode, string IsNumber)
        {
            string OutputFileName = "";
            if(TaskCode == "sp_TaskScheduler_103")
            {
                OutputFileName = rptFilename.Substring(0, rptFilename.Length - 4) + "_" + IsNumber + "_" + DateTime.Now.ToString("ddMMMyyyy_HH-mm-ss-fff") + ".pdf";
            }
            else
            {
                OutputFileName = rptFilename.Substring(0, rptFilename.Length - 4) + "_" + DateTime.Now.ToString("ddMMMyyyy_HH-mm-ss-fff") + ".pdf";
            }

            ReportDocument reportDocument = new ReportDocument();
            reportDocument.Load(path + rptFilename);

            GeneratePrintQueue(CurrentUser, path, rptFilename, OutputFileName);

            GetCredentials(CurrentUser);
            if (Logon(reportDocument, ServerName, DbName, UserName, Password) == true)
            {
                #region ( not used .. this is for Crystal Reports -> Parameters like {?abc} on the report )
                if (cParam != null)
                {
                    ParameterFieldDefinition paramField;
                    ParameterDiscreteValue discreteParam;
                    ParameterValues currentValues;

                    foreach (KeyValuePair<string, string> kpv in cParam)
                    {
                        paramField = reportDocument.DataDefinition.ParameterFields[kpv.Key];
                        discreteParam = new ParameterDiscreteValue { Value = kpv.Value };
                        currentValues = paramField.CurrentValues;
                        currentValues.Add(discreteParam);
                        paramField.ApplyCurrentValues(currentValues);
                    }
                }
                #endregion
                if (!string.IsNullOrEmpty(param))
                {
                    if (reportDocument.DataDefinition.RecordSelectionFormula.Length > 0)
                        reportDocument.DataDefinition.RecordSelectionFormula += " AND " + param;
                    else
                        reportDocument.DataDefinition.RecordSelectionFormula += param;
                }

                ExportOptions exportOptions;
                CrystalDecisions.Shared.DiskFileDestinationOptions diskOptions = new CrystalDecisions.Shared.DiskFileDestinationOptions();
                diskOptions.DiskFileName = path + OutputFileName;

                exportOptions = reportDocument.ExportOptions;
                exportOptions.DestinationOptions = diskOptions;
                exportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
                exportOptions.ExportFormatType = CrystalDecisions.Shared.ExportFormatType.PortableDocFormat;
                reportDocument.Export();
                reportDocument.Close();
                reportDocument.Dispose();
            }
            else
            {
                OutputFileName = "";
            }

            return OutputFileName;
        }

        public string GenerateReport(Common.Objects.UserObj CurrentUser, string path, string rptFilename, string[] param, string[] values, int noofparam, Dictionary<string, string> cParam)
        {
            string OutputFileName = rptFilename.Substring(0, rptFilename.Length - 4) + "_" + DateTime.Now.ToString("ddMMMyyyy_HH-mm-ss-fff") + ".pdf";
            ReportDocument reportDocument = new ReportDocument();
            reportDocument.Load(path + rptFilename);

            //DB 21/Apr/2017 - New function to insert PrintQueue table for direct printing()
            GeneratePrintQueue(CurrentUser, path, rptFilename, OutputFileName);

            GetCredentials(CurrentUser);
            if (Logon(reportDocument, ServerName, DbName, UserName, Password) == true)
            {
                #region ( not used .. this is for Crystal Reports -> Parameters like {?abc} on the report )
                if (cParam != null)
                {
                    // Instead, modify the query instead of passing parameters
                    ParameterFieldDefinition paramField;
                    ParameterDiscreteValue discreteParam;
                    ParameterValues currentValues;

                    foreach (KeyValuePair<string, string> kpv in cParam)
                    {
                        paramField = reportDocument.DataDefinition.ParameterFields[kpv.Key];
                        discreteParam = new ParameterDiscreteValue { Value = kpv.Value };
                        currentValues = paramField.CurrentValues;
                        currentValues.Add(discreteParam);
                        paramField.ApplyCurrentValues(currentValues);
                    }
                }
                #endregion

                //add the param here 
                for (int i = 0; i < noofparam; i++)
                {
                    reportDocument.SetParameterValue("@" + param[i], values[i]);
                }

                ExportOptions exportOptions;
                CrystalDecisions.Shared.DiskFileDestinationOptions diskOptions = new CrystalDecisions.Shared.DiskFileDestinationOptions();
                diskOptions.DiskFileName = path + OutputFileName;

                exportOptions = reportDocument.ExportOptions;
                exportOptions.DestinationOptions = diskOptions;
                exportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
                exportOptions.ExportFormatType = CrystalDecisions.Shared.ExportFormatType.PortableDocFormat;
                reportDocument.Export();
                reportDocument.Close();
                reportDocument.Dispose();
            }
            else
            {
                OutputFileName = "";
            }

            return OutputFileName;
        }

        public void GeneratePrintQueue(Common.Objects.UserObj CurrentUser, string path, string rptFilename, string OutputFileName)
        {
            string UserId = CurrentUser.UserId;
            DataSet ResultDS = new DataAccess.UserXBind().GetUserXBindByIDTypebyRefValueStatus(CurrentUser, UserId, "DirectPrint", rptFilename, "10");
            if (ResultDS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ResultDS.Tables[0].Rows.Count; i++)
                {
                    string PrinterType = ResultDS.Tables[0].Rows[i]["usrdef01"].ToString();
                    string PrinterAddress = ResultDS.Tables[0].Rows[i]["usrdef02"].ToString();
                    string PrinterTray = ResultDS.Tables[0].Rows[i]["usrdef03"].ToString();
                    string status = ResultDS.Tables[0].Rows[i]["status"].ToString();
                    new DataAccess.UserXBind().InsertUserxPrintQueue(CurrentUser, UserId, rptFilename, OutputFileName, PrinterType, PrinterAddress, PrinterTray, status);
                }
            }
        }

        private bool GetCredentials(Common.Objects.UserObj CurrentUser)
        {
            bool valid = true;
            string[] _values = CurrentUser.DBConnStr.Split(';');

            foreach (string iVal in _values)
            {
                if (iVal.ToLower().Contains("server="))
                {
                    ServerName = iVal.Substring(iVal.ToLower().IndexOf("server=") + 7, iVal.Length - 7);
                    ServerName = ServerName.Replace(";", "");
                }

                else if (iVal.ToLower().Contains("data source="))
                {
                    ServerName = iVal.Substring(iVal.ToLower().IndexOf("data source=") + 12, iVal.Length - 12);
                    ServerName = ServerName.Replace(";", "");
                }

                else if (iVal.ToLower().Contains("database="))
                {
                    DbName = iVal.Substring(iVal.ToLower().IndexOf("database=") + 9, iVal.Length - 9);
                    DbName = DbName.Replace(";", "");
                }
                else if (iVal.ToLower().Contains("initial catalog="))
                {
                    DbName = iVal.Substring(iVal.ToLower().IndexOf("initial catalog=") + 16, iVal.Length - 16);
                    DbName = DbName.Replace(";", "");
                }

                else if (iVal.ToLower().Contains("user id="))
                {
                    UserName = iVal.Substring(iVal.ToLower().IndexOf("user id=") + 8, iVal.Length - 8);
                    UserName = UserName.Replace(";", "");
                }

                else if (iVal.ToLower().Contains("password="))
                {
                    Password = iVal.Substring(iVal.ToLower().IndexOf("password=") + 9, iVal.Length - 9);
                    Password = Password.Replace(";", "");
                }
            }

            if (ServerName.Length == 0 || DbName.Length == 0 || UserName.Length == 0 || Password.Length == 0)
                valid = false;

            return valid;
        }

        internal string Generate(UserObj currentUser, string v, string prefix, object p, object parm)
        {
            throw new NotImplementedException();
        }

        private Boolean Logon(ReportDocument cr, String server, String db, string id, string pass)
        {
            ConnectionInfo ci = new ConnectionInfo();
            SubreportObject subObj;

            ci.ServerName = server;
            ci.DatabaseName = db;
            ci.UserID = id;
            ci.Password = pass;

            if (!ApplyLogon(cr, ci))
            {
                return false;
            }

            foreach (ReportObject obj in cr.ReportDefinition.ReportObjects)
            {
                if (obj.Kind == ReportObjectKind.SubreportObject)
                {
                    subObj = (SubreportObject)obj;

                    if (!ApplyLogon(cr.OpenSubreport(subObj.SubreportName), ci))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        private Boolean ApplyLogon(ReportDocument cr, ConnectionInfo ci)
        {
            TableLogOnInfo li;

            foreach (CrystalDecisions.CrystalReports.Engine.Table tbl in cr.Database.Tables)
            {
                li = tbl.LogOnInfo;
                li.ConnectionInfo = ci;
                tbl.ApplyLogOnInfo(li);

                if (tbl.TestConnectivity())
                {
                    if (tbl.Location.IndexOf(".") > 0)
                        tbl.Location = tbl.Location.Substring(tbl.Location.LastIndexOf(".") + 1);
                    else
                        tbl.Location = tbl.Location;
                }
                else
                    return false;
            }
            return true;
        }
    }

    public class CrystalParams
    {
        private System.Data.DataTable crystalParamsDT;

        public CrystalParams()
        {
            crystalParamsDT = new System.Data.DataTable();
            crystalParamsDT.Columns.Add("query");
        }

        public void AddParam(string table, string column, string value, Type Database_Type)
        {
            System.Data.DataRow iRow = crystalParamsDT.NewRow();
            if (Database_Type.Name.ToLower() == "string")
                iRow[0] = "{" + table + "." + column + "}" + " = " + "'" + value + "'";
            else if (Database_Type.Name.ToLower() == "int32")
                iRow[0] = "{" + table + "." + column + "}" + " = " + value;
            else if (Database_Type.Name.ToLower() == "bool")
                iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " = " + value;
            else if (Database_Type.Name.ToLower() == "decimal")
                iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " = " + value;
            crystalParamsDT.Rows.Add(iRow);
        }

        //added by TT 22/Sep/2016 Ticket #3980 - Point#33 For Wildcard
        public void AddParamLike(string table, string column, string value, Type Database_Type)
        {
            System.Data.DataRow iRow = crystalParamsDT.NewRow();

            //Crystal uses * as its wild card, not %
            if (value.ToUpper().StartsWith("*") || value.ToUpper().EndsWith("*"))
            {
                if (Database_Type.Name.ToLower() == "string")
                    iRow[0] = "{" + table + "." + column + "}" + " LIKE " + "'" + value + "'";
                else if (Database_Type.Name.ToLower() == "int32")
                    iRow[0] = "{" + table + "." + column + "}" + " LIKE " + value;
                else if (Database_Type.Name.ToLower() == "bool")
                    iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " LIKE " + value;
                else if (Database_Type.Name.ToLower() == "decimal")
                    iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " LIKE " + value;
            }
            else
            {
                if (Database_Type.Name.ToLower() == "string")
                    iRow[0] = "{" + table + "." + column + "}" + " = " + "'" + value + "'";
                else if (Database_Type.Name.ToLower() == "int32")
                    iRow[0] = "{" + table + "." + column + "}" + " = " + value;
                else if (Database_Type.Name.ToLower() == "bool")
                    iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " = " + value;
                else if (Database_Type.Name.ToLower() == "decimal")
                    iRow[0] = iRow[0] = "{" + table + "." + column + "}" + " = " + value;
            }

            crystalParamsDT.Rows.Add(iRow);
        }

        public bool AddRange(string table, string column, string fromValue, string toValue)
        {
            bool valid = true;
            DateTime fromDate, toDate;
            bool fromValid = false;
            bool toValid = false;

            System.Data.DataRow iRow = crystalParamsDT.NewRow();

            fromValid = DateTime.TryParse(fromValue, out fromDate);
            toValid = DateTime.TryParse(toValue, out toDate);

            if (fromValue == "")
            {
                fromDate = DateTime.Parse("19000101");
                fromValid = true;
            }

            if (toValue == "")
            {
                toDate = DateTime.Parse("29990101");
                toValid = true;
            }

            if (fromValid && toValid)
            {
                iRow[0] = "{" + table + "." + column + "}" + " IN " + "CDate(" + fromDate.ToString("yyyy,MM,dd") + ")"
                    + " to " + "CDate(" + toDate.ToString("yyyy,MM,dd") + ")";
                crystalParamsDT.Rows.Add(iRow);
            }

            else
                valid = false;

            return valid;
        }

        public void AddParamDirect(string CrystalParams)
        {
            System.Data.DataRow iRow = crystalParamsDT.NewRow();
            iRow[0] = CrystalParams;
            crystalParamsDT.Rows.Add(iRow);
        }

        public string GenerateParams()
        {
            StringBuilder _val = new StringBuilder();

            for (int i = 0; i < crystalParamsDT.Rows.Count; i++)
            {
                if (i > 0)
                {
                    _val.Append(" AND ");
                    _val.Append(crystalParamsDT.Rows[i][0].ToString());
                }

                else
                {
                    _val.Append(crystalParamsDT.Rows[i][0].ToString());
                }
            }
            return _val.ToString();
        }
    }
}
