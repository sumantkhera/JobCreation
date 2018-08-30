using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Compass.BAL;
using CompassBE;
using System.Data;
using CompassBE.ViewModel;

namespace Compass.ModuleUI
{
    public partial class AjaxCallPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetChartData(int UserId, int BranchId, string FromDate, string ToDate)
        {
            List<DashboardBE> dashboardData = new List<DashboardBE>();
            CompassBAL compassBAL = new CompassBAL();
            //Here MyDatabaseEntities  is our dbContext  

            DashboardBE dashboardBE = new DashboardBE();
            dashboardBE.jobFilters = new jobFiltersBE();
            dashboardBE.jobFilters.Id = UserId;
            dashboardBE.jobFilters.FromDate = !string.IsNullOrEmpty(FromDate) ? FromDate : "01/01/1900";
            dashboardBE.jobFilters.ToDate = !string.IsNullOrEmpty(ToDate) ? ToDate : "01/01/1900";
            dashboardBE.jobFilters.BranchId = Convert.ToInt32(BranchId);

            DataTable dtBranchWiseJobStatus = compassBAL.GetBranchWiseJobStatusReportBAL(dashboardBE);


            JobCountByType jobCountByTypeView = new JobCountByType();

            var jobCountByType = dtBranchWiseJobStatus.AsEnumerable().Select(s => new
            {
                Status = s.Field<string>("JobStatus"),
                Type = s.Field<string>("JobType"),
            });


            var statuses = jobCountByType.Select(s => s.Status).Distinct().OrderBy(o => o);
            var types = jobCountByType.Select(s => s.Type).Distinct().OrderBy(o => o);

            var typeList = types.Where(s => s != "Other").ToList();
            typeList.Add(types.Where(s => s == "Other").FirstOrDefault());

            var Jobdata = new object[statuses.Count() + 1, typeList.Count() + 1];

            List<JobStatusChart> lstChartData = new List<JobStatusChart>();

            foreach (var type in typeList)
            {
                var statusData = jobCountByType.Where(w => w.Type == type)
                    .GroupBy(g => g.Status)
                    .Select(s => new
                    {
                        Status = s.Key,
                        Count = s.Count()
                    }).ToList();

                List<StatusCount> StatusCount = new List<StatusCount>();
                foreach (var status in statusData)
                {
                    StatusCount.Add(new StatusCount { Status = status.Status, Count = status.Count });
                }

                lstChartData.Add(new JobStatusChart
                {
                    Name = type,
                    StatusCount = StatusCount
                });
            }

            return lstChartData;
        }
    }

    public class ABC
    {

    }
}