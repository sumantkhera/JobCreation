using Compass.BAL;
using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class Dashboard : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindDropdowns();
                BindBranchWiseJobStatusReport();
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
            jobFiltersBE jobFilters = new jobFiltersBE();
            DashboardDataDisplay Dasboarddatadisplay = new DashboardDataDisplay();
            jobFilters.Id = Convert.ToInt32(Session["UserId"]);        
            jobFilters.FromDate = !string.IsNullOrEmpty(txtFromDate.Text) ? txtFromDate.Text : "01/01/1900";
            jobFilters.ToDate = !string.IsNullOrEmpty(txtToDate.Text) ? txtToDate.Text : "01/01/1900"; 
            jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;            

            DataTable dtBranchWiseJobStatus = compassBAL.GetBranchWiseJobStatusReportBAL(jobFilters);

            //var dtBranchWiseJobStatusFinal = (from c in dtBranchWiseJobStatus.AsEnumerable()
            //                                  group c by new
            //                                  {
            //                                      Status = c.Field<string>("JobStatus"),
            //                                      PO = c.Field<int>("PO"),
            //                                      MerchandiseTransfer = c.Field<int>("MerchandiseTransfer"),
            //                                      WeekelyCashReport = c.Field<int>("WeekelyCashReport"),
            //                                      Other = c.Field<int>("Other")
            //                                  } into g
            //                                  select new DashboardDataDisplay
            //                                  {
            //                                      Status = g.Key.Status,
            //                                      PO = g.Key.PO,
            //                                      MerchandiseTransfer = g.Key.MerchandiseTransfer,
            //                                      WeekelyCashReport = g.Key.WeekelyCashReport,
            //                                      Other = g.Key.Other
            //                                  }).ToList();

            //DataTable dt = new DataTable();
            //dt.Columns.Add("Col A", typeof(int));
            //dt.Columns.Add("Col B", typeof(string));
            //dt.Columns.Add("Amount", typeof(int));

            //dtBranchWiseJobStatus.AsEnumerable().GroupBy(x => x.Field<string>("JobStatus")).Select(x =>
            //   new DashboardDataDisplay
            //   {
            //       Status = x.Field<string>("JobStatus")
            //   });
            ////x => x.Field<string>("JobStatus"));
            //gvBranchWiseJobStatus.DataSource = dtBranchWiseJobStatusFinal;
            //gvBranchWiseJobStatus.DataBind();
        }

        public class DashboardDataDisplay
        {
            public string Status { get; set; }
            public int PO{ get; set; }
            public int MerchandiseTransfer { get; set; }
            public int WeekelyCashReport { get; set; }
            public int Other { get; set; }
        }
    

        #endregion
    }
}