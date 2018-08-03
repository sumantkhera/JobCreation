using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Compass.DAL;
using CompassBE;

namespace Compass.BAL
{
    public class CompassBAL
    {
        CompassDAL compassDAL;
        public CompassBAL()
        {
            compassDAL = new CompassDAL();
        }

        public DataTable GetJobTypeBAL()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetJobTypeDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetPriorityBAL()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetPriorityDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetBranchBAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                dt = compassDAL.GetBranchDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetUserBAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                dt = compassDAL.GetUserDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        
        public string InsertIntoJobDetailsBAL(JobDetailsBE obj)
        {
            string squery = string.Empty;
            try
            {
                squery = compassDAL.InsertIntoJobDetailsDAL(obj);
            }
            catch (Exception ex)
            {
            }
            return squery;
        }

        public List<JobDetailsBE> GetJobDetailsBAL(JobDetailsBE objJobDetailsBE)
        {
            List<JobDetailsBE> JobDetailsBEList = new List<JobDetailsBE>();

            try
            {
                CompassDAL objCompassDAL = new CompassDAL();

                JobDetailsBEList = objCompassDAL.GetJobDetailsDAL(objJobDetailsBE);

                objCompassDAL = null;
            }
            catch (Exception ex)
            {

            }
            finally { }
            return JobDetailsBEList;
        }
    }
}
