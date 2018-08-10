using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Compass.DAL;
using CompassBE;
using System.Data;

namespace Compass.BAL
{
    public class JobDetailsBAL
    {

        public List<JobDetailsBE> GetJobDetailsBAL(JobDetailsBE objJobDetailsBE)
        {
            List<JobDetailsBE> JobDetailsBEList = new List<JobDetailsBE>();

            try
            {
                JobDetailsDAL objJobDetailsDAL = new JobDetailsDAL();

                JobDetailsBEList = objJobDetailsDAL.GetJobDetailsDAL(objJobDetailsBE);

                objJobDetailsDAL = null;
            }
            catch (Exception ex)
            {

            }
            finally { }
            return JobDetailsBEList;
        }

        public DataTable GetJobStatusBAL(string Action)
        {
            JobDetailsDAL objJobDetailsDAL = new JobDetailsDAL();
            DataTable dt = new DataTable();
            try
            {
                dt = objJobDetailsDAL.GetJobStatusDAL(Action);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetQAUserBAL(string Action)
        {
            JobDetailsDAL objJobDetailsDAL = new JobDetailsDAL();
            DataTable dt = new DataTable();
            try
            {
                dt = objJobDetailsDAL.GetQAUserDAL(Action);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable GetUserForServiceCompanyBAL(string Action, int ServiceCompanyId)
        {
            JobDetailsDAL objJobDetailsDAL = new JobDetailsDAL();
            DataTable dt = new DataTable();
            try
            {
                dt = objJobDetailsDAL.GetUserForServiceCompanyDAL(Action, ServiceCompanyId);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetQAUserForServiceCompanyBAL(string Action, int ServiceCompanyId)
        {
            JobDetailsDAL objJobDetailsDAL = new JobDetailsDAL();
            DataTable dt = new DataTable();
            try
            {
                dt = objJobDetailsDAL.GetQAUserForServiceCompanyDAL(Action, ServiceCompanyId);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public string EditJobDetailsBAL(JobDetailsBE objJobDetailsDAL)
        {
            JobDetailsDAL jobDetailsDAL = new JobDetailsDAL();
            string squery = string.Empty;
            try
            {
                squery = jobDetailsDAL.EditJobDetailsDAL(objJobDetailsDAL);
            }
            catch (Exception ex)
            {

            }
            return squery;
        }

        public DataTable GetJobHistoryDAL(int JobId)
        {
            JobDetailsDAL jobDetailsDAL = new JobDetailsDAL();
            DataTable dt = new DataTable();
            try
            {
                dt = jobDetailsDAL.GetJobHistoryDAL(JobId);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

    }
}