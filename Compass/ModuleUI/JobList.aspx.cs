using Compass.BAL;
using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class JobList : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindDropdowns();
                BindMethods();
                if (Convert.ToBoolean(value: Session["ServiceCompanyId"]) == true)
                {
                    btnAdd.Visible = true;
                }
                else
                {
                    btnAdd.Visible = false;
                }
            }
        }

        #region Methods       
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

        public void BindDropdowns()
        {
            DataTable dtJobType = compassBAL.GetJobTypeBAL();
            BindDropdown(ddlJobType, "jobName", "Id", dtJobType, "Select JobType");

            DataTable dtPriorityType = compassBAL.GetPriorityBAL();
            BindDropdown(ddlPriority, "PriorityType", "Id", dtPriorityType, "Select Priority");

            DataTable dtBranch = compassBAL.GetBranchBAL();
            BindDropdown(ddlBranch, "BranchName", "Id", dtBranch, "Select Branch");

            DataTable dtUsers = compassBAL.GetUserBAL();
            BindDropdown(ddlUser, "UserName", "Id", dtUsers, "Select User");

            DataTable dtStatus = compassBAL.GetStatusBAL();
            BindDropdown(ddlStatus, "Status", "Id", dtStatus, "Select Status");

            DataTable dtTeam = compassBAL.GetTeamBAL();
            BindDropdown(ddlTeam, "Name", "Id", dtTeam, "Select Team");
        }

        #endregion

        #region Methods       
        public void BindMethods()
        {
            int id = Convert.ToInt32(Session["UserId"]);
            DataTable dtJobList = compassBAL.GetJobListBAL(id);
            grdViewJobList.DataSource = dtJobList;
            grdViewJobList.DataBind();
        }
        #endregion

        protected void grdViewJobList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = grdViewJobList.SelectedRow;
            Label lblID = (Label)row.FindControl("lblID");
            Response.Redirect("~/ModuleUI/EditJob.aspx?JobId=" + lblID.Text);
        }

        protected void grdViewJobList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdViewJobList, "Select$" + e.Row.RowIndex);

                e.Row.Style.Add("cursor", "pointer");

                GridViewRow row = e.Row;
                Label lblPriorityType = (Label)row.FindControl("lblPriorityType");

                if (lblPriorityType.Text == "High")
                {
                    lblPriorityType.CssClass = "high-color";
                }
                if (lblPriorityType.Text == "Low")
                {
                    lblPriorityType.CssClass = "low-color";
                }
                if (lblPriorityType.Text == "Medium")
                {
                    lblPriorityType.CssClass = "medium-color";
                }
            }
        }

        protected void grdViewJobList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdViewJobList.PageIndex = e.NewPageIndex;
            jobFilters jobFilters = new jobFilters();
            if (jobFilters.Id == 0 || jobFilters.Id == null)
            {
                BindMethods();
            }
            else
            {
                jobFilters.ClientId = ddlTeam.SelectedValue != null ? Convert.ToInt32(ddlTeam.SelectedValue) : 0;
                jobFilters.PriorityID = ddlPriority.SelectedValue != null ? Convert.ToInt32(ddlPriority.SelectedValue) : 0;
                jobFilters.FromDate = txtFromDate.Text;
                jobFilters.ToDate = txtToDate.Text;
                jobFilters.JobNumber = txtJobNo.Text;
                jobFilters.AllocatedToUser = ddlUser.SelectedValue != null ? Convert.ToInt32(ddlUser.SelectedValue) : 0;
                jobFilters.JobStatusId = ddlStatus.SelectedValue != null ? Convert.ToInt32(ddlStatus.SelectedValue) : 0;
                jobFilters.JobTypeId = ddlJobType.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
                jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;

                DataTable dtJobList = compassBAL.GetJobListByFilterBAL(jobFilters);
                grdViewJobList.DataSource = dtJobList;
                grdViewJobList.DataBind();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            jobFilters jobFilters = new jobFilters();
            jobFilters.ClientId = ddlTeam.SelectedValue != null ? Convert.ToInt32(ddlTeam.SelectedValue) : 0;
            jobFilters.PriorityID = ddlPriority.SelectedValue != null ? Convert.ToInt32(ddlPriority.SelectedValue) : 0;
            jobFilters.FromDate = txtFromDate.Text;
            jobFilters.ToDate = txtToDate.Text;
            jobFilters.JobNumber = txtJobNo.Text;
            jobFilters.AllocatedToUser = ddlUser.SelectedValue != null ? Convert.ToInt32(ddlUser.SelectedValue) : 0;
            jobFilters.JobStatusId = ddlStatus.SelectedValue != null ? Convert.ToInt32(ddlStatus.SelectedValue) : 0;
            jobFilters.JobTypeId = ddlJobType.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
            jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;

            DataTable dtJobList = compassBAL.GetJobListByFilterBAL(jobFilters);
            grdViewJobList.DataSource = dtJobList;
            grdViewJobList.DataBind();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtJobNo.Text = "";
            ddlTeam.SelectedValue = "0";
            ddlPriority.SelectedValue = "0";
            ddlUser.SelectedValue = "0";
            ddlStatus.SelectedValue = "0";
            ddlJobType.SelectedValue = "0";
            ddlBranch.SelectedValue = "0";
        }
    }
}