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
        bool IsResetClicked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Convert.ToBoolean(Session["IsServiceCompanyUser"]) == false)
                {
                    btnAdd.Visible = true;
                }
                else
                {
                    btnAdd.Visible = false;
                }

                BindDropdowns();
                BindMethods();
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
            BindDropdown(ddlJobType, "jobName", "Id", dtJobType, "All JobTypes");

            DataTable dtPriorityType = compassBAL.GetPriorityBAL();
            BindDropdown(ddlPriority, "PriorityType", "Id", dtPriorityType, "All Priorities");

            DataTable dtBranch = compassBAL.GetBranchBAL();
            BindDropdown(ddlBranch, "BranchName", "Id", dtBranch, "All Branches");           


            bool IsServiceCompanyUser = Convert.ToBoolean(Session["IsServiceCompanyUser"]);

            if (IsServiceCompanyUser)
            {
                DataTable dtUsers = compassBAL.GetUserForServiceCompanyBAL(0);
                ddlUser.Enabled = true;
                BindDropdown(ddlUser, "UserName", "Id", dtUsers, "All Users");
            }
            else
            {
                BindDropdown(ddlUser, "UserName", "Id", null, "All Users");
                ddlUser.Enabled = false;
                ddlUser.Items.Insert(0, new ListItem("All Users", "0"));
            }

            DataTable dtStatus = compassBAL.GetStatusBAL();
            lstStatus.DataSource = dtStatus;
            lstStatus.DataTextField = "Status";
            lstStatus.DataValueField = "Id";
            lstStatus.DataBind();

            DataTable dtTeam = compassBAL.GetTeamBAL();
            BindDropdown(ddlTeam, "Name", "Id", dtTeam, "All Teams");

            int branchId = 0;
            if (Session["BranchId"] != null)
            {
                if (int.TryParse(Session["BranchId"].ToString(), out branchId))
                {
                    if (ddlBranch.Items.FindByValue(branchId.ToString()) != null)
                    {
                        ddlBranch.SelectedValue = branchId.ToString();
                    }
                }
            }
            var clientid = Convert.ToInt32(Session["ClientId"]);

            DataTable dtUserSubmittedBy = compassBAL.GetUserBAL(clientid, branchId : 0);
            BindDropdown(ddlUserSubmittedBy, "UserName", "Id", dtUserSubmittedBy, "Select User");


            int UserTypeId = 0;
            if (Session["UserTypeId"] != null)
            {
                if (int.TryParse(Session["UserTypeId"].ToString(), out UserTypeId))
                {
                    if (UserTypeId == 2) // User if of Branch Type
                    {
                        ddlBranch.Enabled = false;
                        //ddlUserSubmittedBy.SelectedItem.Text =  Convert.ToString(Session["UserName"]);                    
                        //ddlUserSubmittedBy.Enabled = false;
                    }
                }
            }
        }

        #endregion

        #region Methods       
        public void BindMethods()
        {
            jobFiltersBE jobFilters = new jobFiltersBE();
            jobFilters.jobDetails = new JobDetailsBE();
            jobFilters.Id = Convert.ToInt32(Session["UserId"]);
            jobFilters.TeamId = ddlTeam.SelectedValue != null ? Convert.ToInt32(ddlTeam.SelectedValue) : 0;
            jobFilters.PriorityID = ddlPriority.SelectedValue != null ? Convert.ToInt32(ddlPriority.SelectedValue) : 0;
            jobFilters.FromDate = !string.IsNullOrEmpty(txtFromDate.Text) ? txtFromDate.Text : "01/01/1900";
            jobFilters.ToDate = !string.IsNullOrEmpty(txtToDate.Text) ? txtToDate.Text : "01/01/1900"; ;
            jobFilters.JobNumber = txtJobNo.Text;
            if (Convert.ToBoolean(Session["IsServiceCompanyUser"]))
                jobFilters.AllocatedToUser = ddlUser.SelectedValue != null ? Convert.ToInt32(ddlUser.SelectedValue) : 0;
            jobFilters.JobTypeId = ddlJobType.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;

            int UserTypeId = 0;
            if (int.TryParse(Session["UserTypeId"].ToString(), out UserTypeId))
            {
                if (UserTypeId == 2) // User if of Branch Type
                {
                    int branchId = 0;
                    if (int.TryParse(Session["BranchId"].ToString(), out branchId))
                    {
                        jobFilters.BranchId = branchId;
                    }
                }
                else
                {
                    jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;
                }
            }
            else
            {
                jobFilters.BranchId = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;
            }


            jobFilters.jobDetails.SubmitBy = ddlUserSubmittedBy.SelectedValue != null ? Convert.ToInt32(ddlUserSubmittedBy.SelectedValue) : 0;


            JobStatusColllection LstJobStatus = new JobStatusColllection();

            if (IsResetClicked == false)
            {
                foreach (ListItem item in lstStatus.Items)
                {
                    if (item.Selected)
                    {
                        JobStatusBE jobStatus = new JobStatusBE();
                        jobStatus.JobStatusId = item.Value != null ? Convert.ToInt32(item.Value) : 0;
                        LstJobStatus.Add(jobStatus);
                    }
                }               
            }
            else
            {
                foreach (ListItem item in lstStatus.Items)
                {                  
                        JobStatusBE jobStatus = new JobStatusBE();
                        jobStatus.JobStatusId = item.Value != null ? Convert.ToInt32(item.Value) : 0;
                        LstJobStatus.Add(jobStatus);
                }               
            }

            jobFilters.JobStatus = LstJobStatus;


            DataTable dtJobList = compassBAL.GetJobListByFilterBAL(jobFilters);
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
            BindMethods();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            BindMethods();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtJobNo.Text = "";
            ddlTeam.SelectedValue = "0";
            ddlPriority.SelectedValue = "0";
            ddlUser.SelectedValue = "0";
            ddlJobType.SelectedValue = "0";
            ddlBranch.SelectedValue = "0";
            IsResetClicked = true;
           // BindDropdowns();
            BindMethods();

            int branchId = 0;
            if (Session["BranchId"] != null)
            {
                if (int.TryParse(Session["BranchId"].ToString(), out branchId))
                {
                    if (ddlBranch.Items.FindByValue(branchId.ToString()) != null)
                    {
                        ddlBranch.SelectedValue = branchId.ToString();
                    }
                }
            }

            int UserTypeId = 0;
            if (Session["UserTypeId"] != null)
            {
                if (int.TryParse(Session["UserTypeId"].ToString(), out UserTypeId))
                {
                    if (UserTypeId == 2) // User if of Branch Type
                    {
                        ddlBranch.Enabled = false;
                        //ddlUserSubmittedBy.SelectedItem.Text = Convert.ToString(Session["UserName"]);
                        //ddlUserSubmittedBy.Enabled = false;
                    }
                }
            }

        }

        protected void ddlTeam_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["IsServiceCompanyUser"]))
            {
                DataTable dtUsers = compassBAL.GetUserForServiceCompanyBAL(Convert.ToInt32(ddlTeam.SelectedValue));
                if (dtUsers.Rows.Count > 0)
                {
                    BindDropdown(ddlUser, "UserName", "Id", dtUsers, "All User");
                    ddlUser.Enabled = true;
                }
                else
                {
                    ddlUser.Enabled = false;
                    ddlUser.Items.Clear();
                    ddlUser.Enabled = false;

                    ddlUser.Items.Insert(0, new ListItem("All Users", "0"));
                }
            }
            else
            {
                ddlUser.Enabled = false;
                ddlUser.Items.Clear();
                ddlUser.Enabled = false;
                ddlUser.Items.Insert(0, new ListItem("All Users", "0"));
            }
            ddlUser.CssClass = "aspNetDisabled form - control";
        }
    }
}