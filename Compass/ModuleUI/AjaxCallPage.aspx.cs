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

            var jobCountByType = dtBranchWiseJobStatus.AsEnumerable().Select(s => new {
                Status = s.Field<string>("JobStatus"),               
                Type = s.Field<string>("JobType"),                
            });


            var statuses = jobCountByType.Select(s => s.Status).Distinct().OrderBy(o => o);
            var types = jobCountByType.Select(s => s.Type).Distinct().OrderBy(o => o);
            
            var Jobdata = new object[statuses.Count() + 1, types.Count() + 1];
                        
            List<JobStatusChart> lstChartData = new List<JobStatusChart>();

            foreach (var type in types)
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

            //////////////////////////////////////

            //int i = 0;
            //foreach (var status in statuses)
            //{
            //    int k = 0;
            //    foreach (var type in types)
            //    {
            //        var count = jobCountByType.Where(w => w.Status == status && w.Type == type).Count();
            //        Jobdata[i, k] = new object[] { count, status , type };

            //        k = k + 1;
            //    }

            //    i = i + 1;               
            //}


            //for (int l = 0; l < Jobdata.Length; l++)
            //{
            //    for (int m = 0; m < Jobdata.Length; m++)
            //    {
            //        jobCountByTypeView.Count = Jobdata[l, m].ToString();
            //    }
            //}

            //foreach (var item in Jobdata)
            //{
            //    jobCountByTypeView.Count = item.co
            //}




            //var abc =  Jobdata[statuses.Count(),types.Count()].AsEnumerable().Select(s => new
            //{
            //    Status = s.Field<string>("JobStatus"),
            //    //StatusId = s.Field<int>(""),
            //    Type = s.Field<string>("JobType")
            //});


            //var data = Jobdata.AsEnumerable().ToList();

            //var chartData = new object[data.Count + 1];
            //chartData[0] = new object[]{
            //        "Status",
            //        "Count"
            //    };
            //int j = 0;
            //foreach (var i in data)
            //{
            //    j++;
            //    chartData[j] = new object[] { i.Field<string>("Status"), i.Field<int>("Count") };
            //}

            return lstChartData;
        }
    }

    public class ABC
    {

    }
}