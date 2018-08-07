using Compass.BAL;
using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.Enums;

namespace Compass.ModuleUI
{
    public partial class JobCreationEdit : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();
        JobDetailsBAL jobetailsBAL = new JobDetailsBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.QueryString["JobId"] != null)
                //{
                
                

                BindDropdowns();
                GetJobAttachments();

                if (Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.PM))
                {
                    GetJobDetailsForPMUserType();
                }

                if(Session["IsServiceCompanyUser"] != null)
                {
                    divInternalUse.Visible = true;
                }
                else
                {
                    divInternalUse.Visible = false;
                }

               
                //GetJobDetails();
                    
                //}
                //else
                //{
                //    GetJobDetails
                //}
            }
        }

        #region Methods   


        public void BindDropdowns()
        {           

            if (Session["IsServiceCompanyUser"] != null)
            {
                DataTable dtUsers = jobetailsBAL.GetUserForServiceCompanyBAL("GetUserForServiceCompany", Convert.ToInt32(Session["ServiceCompanyId"]));
                BindDropdown(ddlUser, "UserName", "Id", dtUsers, "Select User");

                DataTable dtQAUsers = jobetailsBAL.GetQAUserForServiceCompanyBAL("GetQAUserForServiceCompany", Convert.ToInt32(Session["ServiceCompanyId"]));
                BindDropdown(ddlUser, "UserName", "Id", dtUsers, "Select User");
            }
            else
            {
                DataTable dtUsers = compassBAL.GetUserBAL();
                BindDropdown(ddlUser, "UserName", "Id", dtUsers, "Select User");

                DataTable dtQAUsers = jobetailsBAL.GetQAUserBAL("GetQAUser");
                BindDropdown(ddlQAUser, "UserName", "Id", dtQAUsers, "Select QA User");
            }
            DataTable dtJobType = compassBAL.GetJobTypeBAL();
            BindDropdown(ddlJobType, "jobName", "Id", dtJobType, "Select JobType");

            DataTable dtJobStatusType = jobetailsBAL.GetJobStatusBAL("GetJobStatus");
            BindDropdown(ddlJobStatus, "Status", "Id", dtJobStatusType, "Select Status");           


            //DataTable dtUsers = jobetailsBAL.GetUserForServiceCompanyBAL("GetUserForServiceCompany", ServiceComapnyID);
            //BindDropdown(ddlUser, "UserName", "Id", dtUsers, "Select User");

           
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

        private void GetJobDetailsForPMUserType()
        {
            JobDetailsBE obJobDetailsBE = new JobDetailsBE();

            obJobDetailsBE.Action = "GetJobDetailsById";

            if (Request.QueryString["JobId"] != null)
            {
                obJobDetailsBE.Id = Convert.ToInt32(Request.QueryString["JobId"]);
            }
            else
            {
                obJobDetailsBE.Id = 1;
            }

                List<JobDetailsBE> lstDetails = jobetailsBAL.GetJobDetailsBAL(obJobDetailsBE);

            if(lstDetails !=null && lstDetails.Count > 0)
            {
                txtJobNumber.Text = lstDetails[0].JobNumber;
                txtSubmitDate.Text = lstDetails[0].SubmitDate.ToString().Remove(11); // to display only date part
                txtSubmitBy.Text = lstDetails[0].SubmittedByName;
                txtBranch.Text = lstDetails[0].BranchName;
                txtDescription.Text = lstDetails[0].Description;
                ddlJobStatus.Items.FindByValue (lstDetails[0].JobStatusId.ToString()).Selected = true;
                ddlJobType.Items.FindByValue(lstDetails[0].JobTypeId.ToString()).Selected = true;
            }
            
                     
        }

        private void GetJobAttachments()
        {
            AttachmentsBE attachmentsBE = new AttachmentsBE();
            AttachmentsBAL attachmentBAL = new AttachmentsBAL();

            attachmentsBE.JobDetails = new JobDetailsBE();

            attachmentsBE.Action = "GetJobAttachmentsByJobId";

            if (Request.QueryString["JobId"] != null)
            {
                attachmentsBE.JobDetails.Id =  Convert.ToInt32(Request.QueryString["JobId"]);
            }
            else
            {
                attachmentsBE.JobDetails.Id = 8;
            }

            List<AttachmentsBE> lstAttachments = attachmentBAL.GetJobAttachmentsBAL(attachmentsBE);

            if(lstAttachments.Count > 0)
            {
                hdnAttachementCount.Value = Convert.ToString(lstAttachments.Count());
                //attachment.InnerHtml = "Attachment " + lstAttachments.Count().ToString();

                foreach (var item in lstAttachments)
                {
                    HyperLink hplnk = new HyperLink();
                    hplnk.Text = item.Name;
                    hplnk.ID= Convert.ToString(item.JobAttachmentId);
                    hplnk.CssClass = "btn btn-link";
                    hplnk.NavigateUrl = "~/ModuleUI/DownloadAttachment.aspx?FilePath=" + item.Path + "&FileName=" + item.Name;
                    pnlAttachment.Controls.Add(hplnk); 
                }               
            }          
        }

        #endregion

        #region Events   

        protected void btnSubmit_Click(object sender, EventArgs e)
        {           
            JobDetailsBE jobDetails = new JobDetailsBE();
            jobDetails.Comments = new CommentsBE();
            jobDetails.ClientId = Convert.ToInt32(Session["ClientId"]);           
            
            
            jobDetails.IsSystemDefined = false;

            jobDetails.Id = Convert.ToInt32(Request.QueryString["JobId"]);
            jobDetails.Comments.CreatedBy = Convert.ToInt32(Session["UserId"]);

            if (Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.PM) || Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.DM))
            {
                jobDetails.Comments.Description = txtComments.Text;
                jobDetails.JobStatusId = ddlJobStatus.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
                jobDetails.QAUserId = ddlQAUser.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
                jobDetails.AllocatedToTeam = ddlTeam.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
                jobDetails.AllocationDate = DateTime.Now;

                AttachmentsColllection lstAttachments = new AttachmentsColllection();
                if (FileUploadAttachments.HasFiles)
                {
                    foreach (HttpPostedFile uploadedFile in FileUploadAttachments.PostedFiles)
                    {
                        AttachmentsBE attachments = new AttachmentsBE();
                        Guid random1 = Guid.NewGuid();
                        FileUploadAttachments.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Attachment/"), random1.ToString() + Path.GetExtension(uploadedFile.FileName)));
                        attachments.Name = uploadedFile.FileName;
                        attachments.Path = "/Attachment/" + random1.ToString() + Path.GetExtension(uploadedFile.FileName);
                        attachments.CommentId = null;
                        attachments.CreatedBy = Convert.ToInt32(Session["UserId"]);
                        lstAttachments.Add(attachments);
                    }
                }

                jobDetails.Attachments = lstAttachments;
            }

            if (Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.QA) || Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.MEMBER)
                || Convert.ToString(Session["UserTypeCode"]).Equals(UserType.Enum.QAHEAD))
            {
                jobDetails.Comments.Description = txtComments.Text;
                jobDetails.JobStatusId = ddlJobStatus.SelectedValue != null ? Convert.ToInt32(ddlJobType.SelectedValue) : 0;
                
                AttachmentsColllection lstAttachments = new AttachmentsColllection();
                if (FileUploadAttachments.HasFiles)
                {
                    foreach (HttpPostedFile uploadedFile in FileUploadAttachments.PostedFiles)
                    {
                        AttachmentsBE attachments = new AttachmentsBE();
                        Guid random1 = Guid.NewGuid();
                        FileUploadAttachments.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Attachment/"), random1.ToString() + Path.GetExtension(uploadedFile.FileName)));
                        attachments.Name = uploadedFile.FileName;
                        attachments.Path = "/Attachment/" + random1.ToString() + Path.GetExtension(uploadedFile.FileName);
                        attachments.CommentId = null;
                        attachments.CreatedBy = Convert.ToInt32(Session["UserId"]);
                        lstAttachments.Add(attachments);
                    }
                }

                jobDetails.Attachments = lstAttachments;
            }
            if (Session["ClientId"] != null)
            {

            }

            string result = compassBAL.InsertIntoJobDetailsBAL(jobDetails);

            if (result == "1")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Editted Succesfully');</script>", false);
            }
        }
        #endregion
    }
}