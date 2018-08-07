using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Compass.BAL;
using CompassBE;
using Utility.Enums;
using System.IO;

namespace Compass.ModuleUI
{
    public partial class Compass : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindDropdowns();
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
            BindDropdown(ddlUsers, "UserName", "Id", dtUsers, "Select User");
        }

        #endregion

        #region Events        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            JobDetailsBE jobDetails = new JobDetailsBE();

            jobDetails.ClientId = Convert.ToInt32(Session["ClientId"]);

            jobDetails.PriorityID = ddlPriority.SelectedValue != null ? Convert.ToInt32(ddlPriority.SelectedValue) : 0;

            jobDetails.LastUpdatedDate = DateTime.Now;
            jobDetails.LastCommentedDate = DateTime.Now;
            jobDetails.QAUserId = null;
            jobDetails.AllocationDate = DateTime.Now;
            jobDetails.AllocatedToUser = null;

            jobDetails.AllocatedToTeam = null;//?

            jobDetails.JobTypeId = ddlJobType.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
            jobDetails.CreatedBy = Convert.ToInt32(Session["UserId"]);


            jobDetails.CreatedDate = DateTime.Now;
            jobDetails.SubmittedByBranch = ddlBranch.SelectedValue != null ? Convert.ToInt32(ddlBranch.SelectedValue) : 0;

            jobDetails.SubmitBy = ddlUsers.SelectedValue != null ? Convert.ToInt32(ddlUsers.SelectedValue) : 0;
            jobDetails.SubmitDate = DateTime.Now;

            Random random = new Random();
            int rnt = random.Next(1000, 10000000);
            jobDetails.JobNumber = "JBN" + rnt.ToString();

            jobDetails.IsSystemDefined = false;
            jobDetails.CommentDescription = txtComment.Text;


            AttachmentsColllection lstAttachments = new AttachmentsColllection();
            if (fileJobAttachment.HasFiles)
            {
                foreach (HttpPostedFile uploadedFile in fileJobAttachment.PostedFiles)
                {
                    AttachmentsBE attachments = new AttachmentsBE();
                    Guid random1 = Guid.NewGuid();                    
                    fileJobAttachment.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Attachment/"), random1.ToString() + Path.GetExtension(uploadedFile.FileName)));
                    attachments.Name = uploadedFile.FileName;
                    attachments.Path = "/Attachment/" + random1.ToString() + Path.GetExtension(uploadedFile.FileName);
                    attachments.CommentId = null;
                    attachments.CreatedBy = Convert.ToInt32(Session["UserId"]);
                    lstAttachments.Add(attachments);
                }
            }

            jobDetails.Attachments = lstAttachments;

            string result = compassBAL.InsertIntoJobDetailsBAL(jobDetails);

            if (result == "1")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Submitted Succesfully');</script>", false);
            }
        }

        #endregion
    }
}