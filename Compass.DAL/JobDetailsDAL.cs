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
                    oNewJobDetailsBE.ClientId = dr["ClientId"] != DBNull.Value ? Convert.ToInt32(dr["ClientId"]) : 0; 
                    oNewJobDetailsBE.JobNumber = Convert.ToString(dr["JobNumber"]);
                    oNewJobDetailsBE.SubmitDate = Convert.ToDateTime(dr["SubmitDate"]);
                    oNewJobDetailsBE.SubmittedByName = dr["SubmittedByName"] != DBNull.Value ? dr["SubmittedByName"].ToString() : null;
                    oNewJobDetailsBE.BranchName = dr["BranchName"] != DBNull.Value ? dr["BranchName"].ToString() : null;
                    oNewJobDetailsBE.JobTypeId = Convert.ToInt32(dr["JobTypeId"].ToString());
                    oNewJobDetailsBE.JobStatusId = Convert.ToInt32(dr["JobStatusId"].ToString());
                    oNewJobDetailsBE.AllocatedToTeam = dr["AllocatedToTeam"] != DBNull.Value ? Convert.ToInt32(dr["AllocatedToTeam"].ToString()) : 0;
                    oNewJobDetailsBE.AllocatedToUser = dr["AllocatedToUser"] != DBNull.Value ? Convert.ToInt32(dr["AllocatedToUser"].ToString()) : 0; 
                    oNewJobDetailsBE.AllocationDate = dr["AllocationDate"] != DBNull.Value ? Convert.ToDateTime(dr["AllocationDate"].ToString()) : (DateTime?)null; 
                    oNewJobDetailsBE.QAUserId = dr["QAUserId"] != DBNull.Value ? Convert.ToInt32(dr["QAUserId"].ToString()) : 0;
                    oNewJobDetailsBE.LastCommentedDate = dr["LastCommentedDate"] != DBNull.Value ? Convert.ToDateTime(dr["LastCommentedDate"].ToString()) : (DateTime?)null; 
                    oNewJobDetailsBE.LastUpdatedDate = dr["LastUpdatedDate"] != DBNull.Value ? Convert.ToDateTime(dr["LastUpdatedDate"].ToString()) : (DateTime?)null; 
                    oNewJobDetailsBE.PriorityID = dr["PriorityID"] != DBNull.Value ? Convert.ToInt32(dr["PriorityID"].ToString()) : 0;
                    oNewJobDetailsBE.IsSystemDefined = dr["IsSystemDefined"] != DBNull.Value ? Convert.ToBoolean(dr["IsSystemDefined"].ToString()) : false;
                    oNewJobDetailsBE.Description = dr["Description"] != DBNull.Value ? dr["Description"].ToString() : null;


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

        public DataTable GetUserForServiceCompanyDAL(string Action, int ServiceCompanyId)
        {
            DataTable dt = new DataTable();

            try
            {
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", Action);
                param[index++] = new SqlParameter("@ServiceCompanyId", ServiceCompanyId);
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetQAUserForServiceCompanyDAL(string Action, int ServiceCompanyId)
        {
            DataTable dt = new DataTable();

            try
            {
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", Action);
                param[index++] = new SqlParameter("@ServiceCompanyId", ServiceCompanyId);
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public string EditJobDetailsDAL(JobDetailsBE jobDetailsBE)
        {
            string squery = string.Empty;
            try
            {              

                SqlParameter[] param =
                             {     new SqlParameter("@ClientId",jobDetailsBE.ClientId),
                                   new SqlParameter("@JobNumber",jobDetailsBE.JobNumber),
                                   new SqlParameter("@SubmitDate",jobDetailsBE.SubmitDate),
                                   new SqlParameter("@SubmitBy",jobDetailsBE.SubmitBy),
                                   new SqlParameter("@SubmittedByBranch",jobDetailsBE.SubmittedByBranch),
                                   new SqlParameter("@CretaedDate",jobDetailsBE.CreatedDate),
                                   new SqlParameter("@CreatedBy",jobDetailsBE.CreatedBy),
                                   new SqlParameter("@JobTypeId",jobDetailsBE.JobTypeId),
                                   //new SqlParameter("@JobStatusId",obj.JobStatusId),
                                   new SqlParameter("@AllocatedToTeam",jobDetailsBE.AllocatedToTeam),
                                   new SqlParameter("@AllocatedToUser",jobDetailsBE.AllocatedToUser),
                                   new SqlParameter("@AllocationDate",jobDetailsBE.AllocationDate),
                                   new SqlParameter("@QAUserId",jobDetailsBE.QAUserId),
                                   new SqlParameter("@LastCommentedDate",jobDetailsBE.LastCommentedDate),
                                   new SqlParameter("@LastUpdatedDate",jobDetailsBE.LastUpdatedDate),
                                   new SqlParameter("@PriorityID",jobDetailsBE.PriorityID),
                                   new SqlParameter("@IsSystemDefined",jobDetailsBE.IsSystemDefined),
                                   new SqlParameter("@CommentDescription",jobDetailsBE.CommentDescription)                                   
                               };

                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spCreateJob", param);
                squery = ds.Tables[0].Rows[0][0].ToString();
                return squery;
            }
            catch (Exception ex)
            {
                //   GeneralFuntions.WriteErrorToLog("Handler_SR_Presales", "InsertIntoSysRequests", DateTime.Now, 5, squery, ex.Message + "\n-------\n" + ex.StackTrace);
                return "0";
            }
        }

    }
}
