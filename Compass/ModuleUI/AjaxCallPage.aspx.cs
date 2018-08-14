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

namespace Compass.ModuleUI
{
    public partial class AjaxCallPage : System.Web.UI.Page
    {       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object[] GetChartData(int UserId,int BranchId, string FromDate, string ToDate)
        {
            List<DashboardBE> dashboardData = new List<DashboardBE>();
            CompassBAL compassBAL = new CompassBAL();
            //Here MyDatabaseEntities  is our dbContext  

            DashboardBE dashboardBE = new DashboardBE();
            dashboardBE.jobFilters = new jobFiltersBE();
            dashboardBE.Action = "GetChartDataPO";
            dashboardBE.jobFilters.Id = UserId;
            dashboardBE.jobFilters.FromDate = !string.IsNullOrEmpty(FromDate) ? FromDate : "01/01/1900";
            dashboardBE.jobFilters.ToDate = !string.IsNullOrEmpty(ToDate) ? ToDate : "01/01/1900";
            dashboardBE.jobFilters.BranchId = Convert.ToInt32(BranchId);

            DataTable dtBranchWiseJobStatusDataForPOChart = compassBAL.GetBranchWiseJobStatusDataForPOChartBAL(dashboardBE);

            var   data = dtBranchWiseJobStatusDataForPOChart.AsEnumerable().ToList();
            
            var chartData = new object[data.Count + 1];
            chartData[0] = new object[]{
                    "DepartmentName",
                    "EmployeeHired"
                };
            int j = 0;
            foreach (var i in data)
            {
                j++;
                chartData[j] = new object[] { i.Field<string>("DepartmentName"), i.Field<int>("EmployeeHired") };
            }

            return chartData;
        }
    }
}