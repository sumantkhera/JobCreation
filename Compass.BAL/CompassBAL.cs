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

        public DataTable GetJobListBAL(int id)
        {
            DataTable ds = new DataTable();
            try
            {
                ds = compassDAL.GetJobListDAL(id);
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return ds;
        }

        public DataTable GetStatusBAL()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetStatusDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable GetTeamBAL()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetTeamDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetJobListByFilterBAL(jobFiltersBE jobFilters)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetJobListByFilterDAL(jobFilters);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetUserBAL(int clientid, int branchId = 0)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetUserDAL(clientid, branchId);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetUserForServiceCompanyBAL(int teamid)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetUserForServiceCompanyDAL(teamid);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public DataTable GetBranchWiseJobStatusReportBAL(jobFiltersBE jobFilters)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetBranchWiseJobStatusReportDAL(jobFilters);
            }
            catch (Exception ex)
            {

            }
            return dt;
        }
    }
}
