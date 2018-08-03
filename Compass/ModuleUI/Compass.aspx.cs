using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Compass.BAL;
using CompassBE;

namespace Compass.ModuleUI
{
    public partial class Compass : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDropdowns();
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
            BindDropdown(ddlBranch, "BranchName", "Id", dtBranch, "Select Priority");

            DataTable dtUsers = compassBAL.GetUserBAL();
            BindDropdown(ddlUsers, "BranchName", "Id", dtUsers, "Select Priority");
        }

        #endregion

        #region Events        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            JobDetailsBE jobDetails = new JobDetailsBE();
            jobDetails.ClientId = 0;
            jobDetails.PriorityID = 0;
            jobDetails.LastUpdatedDate = DateTime.Now;
            jobDetails.LastCommentedDate = DateTime.Now;
            jobDetails.QAUserId = 1;
            jobDetails.AllocationDate = DateTime.Now;
            jobDetails.AllocatedToUser = 1;
            jobDetails.AllocatedToTeam = 1;
            jobDetails.JobStatusId = 1;
            jobDetails.JobTypeId = ddlJobType.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
            jobDetails.CreatedBy = 1;
            jobDetails.CretaedDate = DateTime.Now;
            jobDetails.SubmittedByBranch = 1;
            jobDetails.SubmitBy = 1;
            jobDetails.SubmitDate = DateTime.Now;
            Random random = new Random();
            int rnt = random.Next(1000, 10000000);
            jobDetails.JobNumber = "JBN" + rnt.ToString();
            jobDetails.IsSystemDefined = false;
            jobDetails.CommentDescription = txtComment.Text;

            if (fileJobAttachment.HasFile)
            {
                fileJobAttachment.SaveAs(Server.MapPath("~/Attachment/") + fileJobAttachment.FileName + rnt.ToString());
                jobDetails.AttachmentName = fileJobAttachment.FileName;
                jobDetails.AttachmentPath = fileJobAttachment.FileName + rnt.ToString();
            }

            string result= compassBAL.InsertIntoJobDetailsBAL(jobDetails);

            if (result == "1")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Submitted Succesfully');</script>", false);
            }
        }

        #endregion
    }
}