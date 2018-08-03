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
    public class CompassDAL
    {
        public DataTable GetJobTypeDAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobType");

                dt = ds.Tables[0];

                //foreach (DataRow dr in dt.Rows)
                //{
                //    JobTypeBE jobTypeBE = new JobTypeBE();
                //    jobTypeBE.Id = dr["Id"] != DBNull.Value ? Convert.ToInt32(dr["Id"].ToString()) : 0;
                //    jobTypeBE.jobName = dr["jobName"].ToString();
                //    lstJobTypeBE.Add(jobTypeBE);
                //}
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public DataTable GetPriorityDAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spPriorityType");
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public DataTable GetBranchDAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spGetBranch");
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public DataTable GetUserDAL()
        {
            DataTable dt = new DataTable();
            List<JobTypeBE> lstJobTypeBE = new List<JobTypeBE>();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spGetUserDetails");
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public string InsertIntoJobDetailsDAL(JobDetailsBE obj)
        {
            string squery = string.Empty;
            try
            {
                SqlParameter[] param =
                             {     new SqlParameter("@ClientId",obj.ClientId),
                                   new SqlParameter("@JobNumber",obj.JobNumber),
                                   new SqlParameter("@SubmitDate",obj.SubmitDate),
                                   new SqlParameter("@SubmitBy",obj.SubmitBy),
                                   new SqlParameter("@SubmittedByBranch",obj.SubmittedByBranch),
                                   new SqlParameter("@CretaedDate",obj.CretaedDate),
                                   new SqlParameter("@CreatedBy",obj.CreatedBy),
                                   new SqlParameter("@JobTypeId",obj.JobTypeId),
                                   new SqlParameter("@JobStatusId",obj.JobStatusId),
                                   new SqlParameter("@AllocatedToTeam",obj.AllocatedToTeam),
                                   new SqlParameter("@AllocatedToUser",obj.AllocatedToUser),
                                   new SqlParameter("@AllocationDate",obj.AllocationDate),
                                   new SqlParameter("@QAUserId",obj.QAUserId),
                                   new SqlParameter("@LastCommentedDate",obj.LastCommentedDate),
                                   new SqlParameter("@LastUpdatedDate",obj.LastUpdatedDate),
                                   new SqlParameter("@PriorityID",obj.PriorityID),
                                   new SqlParameter("@IsSystemDefined",obj.IsSystemDefined),
                                   new SqlParameter("@CommentDescription",obj.CommentDescription),
                                   new SqlParameter("@AttachmentName",obj.AttachmentName),
                                   new SqlParameter("@AttachmentPath",obj.AttachmentPath)
                               };

                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "INSERTJOBDETAILS", param);

                squery = ds.Tables[0].Rows[0][0].ToString();

                return squery;
            }
            catch (Exception ex)
            {
                //   GeneralFuntions.WriteErrorToLog("Handler_SR_Presales", "InsertIntoSysRequests", DateTime.Now, 5, squery, ex.Message + "\n-------\n" + ex.StackTrace);
                return "0";
            }
        }

        public List<JobTypeBE> GetJobDetailsDAL(JobTypeBE objJobTypeBE)
        {
            List<JobTypeBE> JobTypeBEList = new List<JobTypeBE>();
            try
            {
                DataTable dt = new DataTable();
                int index = 0;
                SqlParameter[] param = new SqlParameter[1];
                param[index++] = new SqlParameter("@Action", objJobTypeBE.Id);
                
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobDetails", param);

                dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    JobTypeBE oNewJobTypeBE = new JobTypeBE();

                    oNewJobTypeBE.Id = Convert.ToInt32(dr["Id"].ToString());
                    if (dr.Table.Columns.Contains("ClientId"))
                        oNewJobTypeBE.ClientId = Convert.ToInt32(dr["ClientId"].ToString());
                    oNewJobTypeBE.JobNumber = Convert.ToString(dr["JobNumber"]);
                    oNewJobTypeBE.SubmitDate = Convert.ToDateTime(dr["SubmitDate"]);
                    oNewJobTypeBE.SubmitBy = Convert.ToInt32(dr["SubmitBy"].ToString());
                    oNewJobTypeBE.SubmitByBranch = Convert.ToInt32(dr["SubmitByBranch"].ToString());
                    oNewJobTypeBE.CreatedDate= Convert.ToDateTime(dr["CreatedDate"]);
                    oNewJobTypeBE.CreatedBy = Convert.ToInt32(dr["CreatedBy"].ToString());
                    oNewJobTypeBE.JobTypeID = Convert.ToInt32(dr["JobTypeID"].ToString());
                    oNewJobTypeBE.JobStatusID = Convert.ToInt32(dr["JobStatusID"].ToString());

                    oNewJobTypeBE.AllocatedToTeam = Convert.ToInt32(dr["AllocatedToTeam"].ToString());
                    oNewJobTypeBE.AllocatedToUser = Convert.ToInt32(dr["AllocatedToUser"].ToString());
                    oNewJobTypeBE.AllocationDate = Convert.ToDateTime(dr["AllocationDate"]); 
                    oNewJobTypeBE.QAUserId = Convert.ToInt32(dr["AllocatedToUser"].ToString());
                    oNewJobTypeBE.LastCommentedDate = Convert.ToDateTime(dr["LastCommentedDate"]);
                    oNewJobTypeBE.LastUpdatedDate = Convert.ToDateTime(dr["LastUpdatedDate"]);
                    oNewJobTypeBE.PriorityID = Convert.ToInt32(dr["PriorityID"].ToString());
                    oNewJobTypeBE.IsSystemDefined = Convert.ToBoolean(dr["IsSystemDefined"].ToString());
                    JobTypeBEList.Add(oNewJobTypeBE);
                }
            }
            catch (Exception ex)
            {
                
            }
            return JobTypeBEList;
        }

    }
}
