using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            //Client check
            if (Session["ClientId"].ToString() != "0")
            {                
                spBranch.InnerText = Session["BranchName"].ToString();
            }
            else
            {
                //Service Company
                spBranch.InnerText = Session["ServiceCompany"].ToString();
            }
        }
    }
}