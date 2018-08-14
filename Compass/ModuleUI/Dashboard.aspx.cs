using Compass.BAL;
using CompassBE;
using CompassBE.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class Dashboard : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();
        protected int? UserID = 0;
        protected int? BranchId = 0;
        protected string FromDate = null;
        protected string ToDate = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindDropdowns();
                BindBranchWiseJobStatusReport();
                hdntxtFromDate.Value = txtFromDate.Text;
                hdntxtToDate.Value = txtToDate.Text;
                hdnUserId.Value = Convert.ToString(Session["UserId"]);

            }
        }

        #region Methods    

        public void BindDropdowns()
        {
            DataTable dtBranch = compassBAL.GetBranchBAL();
            BindDropdown(ddlBranch, "BranchName", "Id", dtBranch, "All Branches");
        }

        private static void BindDropdown(DropDownList ddl, string text, string value, DataTable dt, string selection)
        {
            try
            {
                if (dt.Rows.Count < 1)
                    dt.Rows.Add(new string[] { "0", "No Entries Present" });
                ddl.DataSource = dt;
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem(selection, "0"));
            }
            catch (Exception ex)
            {
                // ex.Message;
            }
        }       


        public void BindBranchWiseJobStatusReport()
        {            
            DashboardBE dashboardBE = new DashboardBE();

            dashboardBE.jobFilters = new jobFiltersBE();

            dashboardBE.jobFilters.Id = Session["UserId"] != null ? Convert.ToInt32(Session["UserId"]):1;
            dashboardBE.jobFilters.FromDate = !string.IsNullOrEmpty(txtFromDate.Text) ? txtFromDate.Text : "01/01/1900";
            dashboardBE.jobFilters.ToDate = !string.IsNullOrEmpty(txtToDate.Text) ? txtToDate.Text : "01/01/1900";
            dashboardBE.jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;


            UserID = dashboardBE.jobFilters.Id;
            BranchId = dashboardBE.jobFilters.BranchId;
            FromDate = dashboardBE.jobFilters.FromDate;
            ToDate = dashboardBE.jobFilters.ToDate;

            DataTable dtBranchWiseJobStatus = compassBAL.GetBranchWiseJobStatusReportBAL(dashboardBE);

            var jobCountByType = dtBranchWiseJobStatus.AsEnumerable().Select(s => new {
                Status = s.Field<string>("JobStatus"),
                //StatusId = s.Field<int>(""),
                Type = s.Field<string>("JobType"),
                //TypeId = s.Field<int>("")
            });

            StringBuilder sHTML = new StringBuilder();

            var statuses = jobCountByType.Select(s => s.Status).Distinct().OrderBy(o => o);
            var types = jobCountByType.Select(s => s.Type).Distinct().OrderBy(o => o);
            
            if (statuses.Count() > 0 && types.Count() > 0)
            {
                sHTML.Append("<table>");

                //Print header row
                sHTML.Append("<tr>");
                sHTML.Append("<th>");
                sHTML.Append("Status");
                sHTML.Append("</th>");
                foreach (var type in types)
                {
                    sHTML.Append("<th>");
                    sHTML.Append(type);
                    sHTML.Append("</th>");
                }
                sHTML.Append("</tr>");

                //Print count rows
                foreach (var status in statuses)
                {
                    sHTML.Append("<tr>");
                    sHTML.Append("<td>");
                    sHTML.Append(status);
                    sHTML.Append("</td>");

                    foreach (var type in types)
                    {
                        var count = jobCountByType.Where(w => w.Status == status && w.Type == type).Count();

                        sHTML.Append("<td>");
                        sHTML.Append(count);
                        sHTML.Append("</td>");
                    }
                    sHTML.Append("</tr>");
                }

                sHTML.Append("</table>");
                divTable.InnerHtml = sHTML.ToString();
            }
        }


        #endregion

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            BindBranchWiseJobStatusReport();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToDate.Text = "";           
            ddlBranch.SelectedValue = "0";
            BindBranchWiseJobStatusReport();
        }
    }
}