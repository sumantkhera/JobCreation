using System;
using System.Web.UI;

namespace Compass
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = 0;

            if (Session["UserId"] == null || !int.TryParse(Session["UserId"].ToString(), out userId))
            {
                Session.Abandon();
                Response.Redirect("/ModuleUI/login.aspx");
            }

            spName.InnerText = Session["UserName"].ToString();
            
            if (Session["IsServiceCompanyUser"].ToString() == "1" || Session["IsServiceCompanyUser"].ToString() == "true" || Session["IsServiceCompanyUser"].ToString() == "True")
            {
                //Service Company
                spBranch.InnerText = Session["ClientName"].ToString();                
            }
            else
            {
                //Client check
                spBranch.InnerText = Session["BranchName"].ToString();
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/login.aspx");
        }
    }
}