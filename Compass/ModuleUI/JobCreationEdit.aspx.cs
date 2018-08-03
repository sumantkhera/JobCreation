using Compass.BAL;
using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compass.ModuleUI
{
    public partial class JobCreationEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["JobId"] != null)
                {
                    GetJobDetails();
                }
            }
        }

        public void GetJobDetails()
        {
            JobDetailsBE obJobDetailsBE = new JobDetailsBE();
            CompassBAL objCompassBAL = new CompassBAL();

            if (Request.QueryString["JobId"] != null)
            {
                obJobDetailsBE.Id = Convert.ToInt32(Request.QueryString["JobId"]);
            }

                List<JobDetailsBE> lstDetails = objCompassBAL.GetJobDetailsBAL(obJobDetailsBE); 

           
        }
    }
}