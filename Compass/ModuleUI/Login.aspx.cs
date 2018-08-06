using Compass.BAL;
using CompassBE.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                Response.Redirect("~/ModuleUI/Compass.aspx");
            }
        }
    }
}