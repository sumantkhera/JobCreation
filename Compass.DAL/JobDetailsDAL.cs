using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compass.DAL
{
    public class JobDetailsDAL
    {
        public List<JobDetailsBE> GetJobDetailsDAL(JobDetailsBE objJobDetailsBE)
        {
            List<JobDetailsBE> JobDetailsBEList = new List<JobDetailsBE>();
            try
            {
                DataTable dt = new DataTable();
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", objJobDetailsBE.Action);
                param[index++] = new SqlParameter("@JobId", objJobDetailsBE.Id);

                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);

                dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    JobDetailsBE oNewJobDetailsBE = new JobDetailsBE();

                    oNewJobDetailsBE.Id = Convert.ToInt32(dr["Id"].ToString());
                    if (dr.Table.Columns.Contains("ClientId"))
                        oNewJobDetailsBE.ClientId = Convert.ToInt32(dr["ClientId"].ToString());
                    oNewJobDetailsBE.JobNumber = Convert.ToString(dr["JobNumber"]);
                    oNewJobDetailsBE.SubmitDate = Convert.ToDateTime(dr["SubmitDate"]);
                    oNewJobDetailsBE.SubmittedByName = dr["SubmittedByName"].ToString() != null ? dr["SubmittedByName"].ToString() : null;
                    oNewJobDetailsBE.BranchName = dr["BranchName"].ToString() != null ? dr["BranchName"].ToString() : null;
                    oNewJobDetailsBE.JobTypeId = Convert.ToInt32(dr["JobTypeId"].ToString());
                    oNewJobDetailsBE.JobStatusId = Convert.ToInt32(dr["JobStatusId"].ToString());
                    oNewJobDetailsBE.AllocatedToTeam = Convert.ToInt32(dr["AllocatedToTeam"].ToString());
                    oNewJobDetailsBE.AllocatedToUser = Convert.ToInt32(dr["AllocatedToUser"].ToString());
                    oNewJobDetailsBE.AllocationDate = Convert.ToDateTime(dr["AllocationDate"]);
                    oNewJobDetailsBE.QAUserId = Convert.ToInt32(dr["QAUserId"].ToString());
                    oNewJobDetailsBE.LastCommentedDate = Convert.ToDateTime(dr["LastCommentedDate"]);
                    oNewJobDetailsBE.LastUpdatedDate = Convert.ToDateTime(dr["LastUpdatedDate"]);
                    oNewJobDetailsBE.PriorityID = Convert.ToInt32(dr["PriorityID"].ToString());
                    oNewJobDetailsBE.IsSystemDefined = Convert.ToBoolean(dr["IsSystemDefined"].ToString());
                    oNewJobDetailsBE.Description = dr["Description"].ToString() != null ? dr["Description"].ToString() : null;


                    JobDetailsBEList.Add(oNewJobDetailsBE);
                }
            }
            catch (Exception ex)
            {

            }
            return JobDetailsBEList;
        }

        public DataTable GetJobStatusDAL(string Action)
        {
            DataTable dt = new DataTable();

            try
            {
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", Action);
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetQAUserDAL(string Action)
        {
            DataTable dt = new DataTable();

            try
            {
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", Action);
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);                
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
    }
}
