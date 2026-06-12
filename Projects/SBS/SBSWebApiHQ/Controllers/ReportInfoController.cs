using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ReportInfoController : ApiController
    {
        private static readonly IReportRepository repository = new ReportRepository();

        public IEnumerable<ReportInfo> GetAllReports()
        {
            return repository.GetAll();
        }

        public ReportInfo GetAsset(int reportID)
        {
            ReportInfo currReport = repository.Get(reportID);
            if (currReport == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currReport;
        }

        public IEnumerable<ReportInfo> GetReportByName(string reportname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, reportname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public ReportInfo PostAsset(ReportInfo currReport)
        {
            currReport = repository.Add(currReport);
            return currReport;
        }

        public void PutReport(int reportID, ReportInfo currReport)
        {
            currReport.ReportID = reportID;
            if (!repository.Update(currReport))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteReport(int reportID)
        {
            ReportInfo currReport = repository.Get(reportID);
            if (currReport == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(reportID);
        }

    }
}
