using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Compass.BAL;

namespace Compass.ModuleUI
{
    public partial class Compass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CompassBAL compassBAL = new CompassBAL();

            DataTable dtJobType = compassBAL.GetJobTypeBAL();
            BindDropdown(ddlJobType, "jobName", "Id", dtJobType, "Select JobType");

            DataTable dtPriorityType = compassBAL.GetPriorityBAL();
            BindDropdown(ddlPriority, "PriorityType", "Id", dtPriorityType, "Select Priority");
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

        #endregion
    }
}