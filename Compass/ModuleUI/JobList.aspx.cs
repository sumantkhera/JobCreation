using Compass.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class JobList : System.Web.UI.Page
    {
        CompassBAL compassBAL = new CompassBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindMethods();
            }
        }

        #region Methods       
        public void BindMethods()
        {
            int id = Convert.ToInt32(Session["UserId"]);
            DataTable dtJobList = compassBAL.GetJobListBAL(id);
            grdViewJobList.DataSource = dtJobList;
            grdViewJobList.DataBind();
        }
        #endregion

        protected void grdViewJobList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = grdViewJobList.SelectedRow;
            Label lblID = (Label)row.FindControl("lblID");
            Response.Redirect("~/ModuleUI/JobCreationEdit.aspx/" + lblID.Text);
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
                e.Row.Attributes["onclick"] =
                  ClientScript.GetPostBackClientHyperlink(this.grdViewJobList, "Select$" + e.Row.RowIndex);
            }
        }


    }
}