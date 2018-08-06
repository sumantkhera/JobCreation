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
            spName.InnerText = Session["UserName"].ToString();
            spBranch.InnerText = Session["BranchName"].ToString();
        }
    }
}