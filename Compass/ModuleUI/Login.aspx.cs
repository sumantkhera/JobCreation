using Compass.BAL;
using CompassBE.ViewModel;
using System;
using System.Data;

namespace Compass.ModuleUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserLogin usr = new UserLogin();
            usr.Username = txtUserId.Text;
            usr.Password = txtPassword.Text;
            UsersBAL usersBAL = new UsersBAL();
            DataSet ds = usersBAL.UserLogins(usr);

            if(ds !=null && ds.Tables.Count>0)
            {
                //Add to session
                Session["ClientId"] = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ClientId"].ToString()) ? 0 : ds.Tables[0].Rows[0]["ClientId"];
                Session["UserEmailId"] = ds.Tables[0].Rows[0]["UserEmailId"];
                Session["UserName"] = ds.Tables[0].Rows[0]["UserName"];
                Session["BranchId"] = ds.Tables[0].Rows[0]["BranchId"];
                Session["BranchName"] = ds.Tables[0].Rows[0]["BranchName"];
                Session["UserTypeId"] = ds.Tables[0].Rows[0]["UserTypeId"];
                //Session["ServiceCompanyId"] = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ServiceCompanyId"].ToString()) ? 0 : ds.Tables[0].Rows[0]["ServiceCompanyId"];
                Session["BranchName"] = ds.Tables[0].Rows[0]["BranchName"];
                Session["ClientName"] = ds.Tables[0].Rows[0]["ClientName"];
                Session["ClientLogo"] = ds.Tables[0].Rows[0]["ClientLogo"];
                //Session["ServiceCompany"] = ds.Tables[0].Rows[0]["ServiceCompany"];
                Session["UserId"] = ds.Tables[0].Rows[0]["UserId"];
                Session["IsServiceCompanyUser"] = ds.Tables[0].Rows[0]["IsServiceCompanyUser"];
                Session["UserTypeName"] = ds.Tables[0].Rows[0]["UserTypeName"];
                Session["UserTypeCode"] = ds.Tables[0].Rows[0]["UserTypeCode"];

                Response.Redirect("/ModuleUI/CreateJob.aspx");
            }
        }
    }
}