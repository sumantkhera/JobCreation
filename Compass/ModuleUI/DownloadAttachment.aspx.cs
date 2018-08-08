using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class DownloadAttachment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["FilePath"] != null && Request.QueryString["FileName"] != null)

                {
                    DownloadFile(Request.QueryString["FilePath"], Request.QueryString["FileName"]);
                }
            }
        }


        private void DownloadFile(string filePath, string fileName)
        {
            try
            {
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Response.TransmitFile(string.Format("{0}{1}", Server.MapPath(Request.ApplicationPath), filePath));
                Response.End();
            }
            catch(Exception ex)
            {


            }
       }
    }
}