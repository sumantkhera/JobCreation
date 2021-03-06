﻿using CompassBE;
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
        public DataTable GetUserDAL( )
        {
            DataTable dt = new DataTable();
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
                SqlParameter tvpParam = new SqlParameter("@Attachments", obj.Attachments);
                tvpParam.SqlDbType = SqlDbType.Structured;
                tvpParam.Direction = ParameterDirection.Input;
                tvpParam.TypeName = "dbo.UT_JobAttachment";

                SqlParameter[] param =
                             {     new SqlParameter("@ClientId",obj.ClientId),
                                   new SqlParameter("@JobNumber",obj.JobNumber),
                                   new SqlParameter("@SubmitDate",obj.SubmitDate),
                                   new SqlParameter("@SubmitBy",obj.SubmitBy),
                                   new SqlParameter("@SubmittedByBranch",obj.SubmittedByBranch),
                                   new SqlParameter("@CretaedDate",obj.CreatedDate),
                                   new SqlParameter("@CreatedBy",obj.CreatedBy),
                                   new SqlParameter("@JobTypeId",obj.JobTypeId),
                                   //new SqlParameter("@JobStatusId",obj.JobStatusId),
                                   new SqlParameter("@AllocatedToTeam",obj.AllocatedToTeam),
                                   new SqlParameter("@AllocatedToUser",obj.AllocatedToUser),
                                   new SqlParameter("@AllocationDate",obj.AllocationDate),
                                   new SqlParameter("@QAUserId",obj.QAUserId),
                                   new SqlParameter("@LastCommentedDate",obj.LastCommentedDate),
                                   new SqlParameter("@LastUpdatedDate",obj.LastUpdatedDate),
                                   new SqlParameter("@PriorityID",obj.PriorityID),
                                   new SqlParameter("@IsSystemDefined",obj.IsSystemDefined),
                                   new SqlParameter("@CommentDescription",obj.CommentDescription),
                                   tvpParam
                               };


                if (obj.Attachments.Count == 0)
                {
                    param = param.RemoveFromArray(tvpParam);
                }

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

        public List<JobDetailsBE> GetJobDetailsDAL(JobDetailsBE objJobDetailsBE)
        {
            List<JobDetailsBE> JobDetailsBEList = new List<JobDetailsBE>();
            try
            {
                DataTable dt = new DataTable();
                int index = 0;
                SqlParameter[] param = new SqlParameter[1];
                param[index++] = new SqlParameter("@Id", objJobDetailsBE.Id);

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
                    oNewJobDetailsBE.SubmitBy = Convert.ToInt32(dr["SubmitBy"].ToString());
                    oNewJobDetailsBE.SubmittedByBranch = Convert.ToInt32(dr["SubmitByBranch"].ToString());
                    oNewJobDetailsBE.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);
                    oNewJobDetailsBE.CreatedBy = Convert.ToInt32(dr["CreatedBy"].ToString());
                    oNewJobDetailsBE.JobTypeId = Convert.ToInt32(dr["JobTypeId"].ToString());
                    oNewJobDetailsBE.JobStatusId = Convert.ToInt32(dr["JobStatusId"].ToString());

                    oNewJobDetailsBE.AllocatedToTeam = Convert.ToInt32(dr["AllocatedToTeam"].ToString());
                    oNewJobDetailsBE.AllocatedToUser = Convert.ToInt32(dr["AllocatedToUser"].ToString());
                    oNewJobDetailsBE.AllocationDate = Convert.ToDateTime(dr["AllocationDate"]);
                    oNewJobDetailsBE.QAUserId = Convert.ToInt32(dr["AllocatedToUser"].ToString());
                    oNewJobDetailsBE.LastCommentedDate = Convert.ToDateTime(dr["LastCommentedDate"]);
                    oNewJobDetailsBE.LastUpdatedDate = Convert.ToDateTime(dr["LastUpdatedDate"]);
                    oNewJobDetailsBE.PriorityID = Convert.ToInt32(dr["PriorityID"].ToString());
                    oNewJobDetailsBE.IsSystemDefined = Convert.ToBoolean(dr["IsSystemDefined"].ToString());
                    JobDetailsBEList.Add(oNewJobDetailsBE);
                }
            }
            catch (Exception ex)
            {

            }
            return JobDetailsBEList;
        }

        public DataTable GetJobListDAL(int id)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] param =
                               {     new SqlParameter("@UserId",id ) };
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spListJobs", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetStatusDAL()
        {
            DataTable dt = new DataTable();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobStatus");
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public DataTable GetTeamDAL()
        {
            DataTable dt = new DataTable();
            try
            {
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spTeam");
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetJobListByFilterDAL(jobFiltersBE jobFilters)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter tvpParam = new SqlParameter("@JobStatus", jobFilters.JobStatus);
                tvpParam.SqlDbType = SqlDbType.Structured;
                tvpParam.Direction = ParameterDirection.Input;
                tvpParam.TypeName = "[dbo].[UT_JobStatus]";

                SqlParameter[] param =
                {
                                        new SqlParameter("@UserId",jobFilters.Id ) ,
                                        new SqlParameter("@TeamId",jobFilters.TeamId ) ,
                                        new SqlParameter("@PriorityID",jobFilters.PriorityID ) ,
                                        new SqlParameter("@AllocatedToUser",jobFilters.AllocatedToUser ),
                                        new SqlParameter("@JobTypeId",jobFilters.JobTypeId ) ,
                                        new SqlParameter("@BranchId",jobFilters.BranchId ) ,
                                        new SqlParameter("@StartDate",jobFilters.FromDate ) ,
                                        new SqlParameter("@EndDate",jobFilters.ToDate ) ,
                                        new SqlParameter("@JobNumber",jobFilters.JobNumber ),
                                        new SqlParameter("@SubmitBy",jobFilters.jobDetails.SubmitBy ),
                                        tvpParam
                 };

                if (jobFilters.JobStatus.Count == 0)
                {
                    param = param.RemoveFromArray(tvpParam);
                }
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spListJobs", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }
        public DataTable GetUserDAL(int clientid, int branchId = 0, bool isbranch = true)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@ClientId",clientid),
                    new SqlParameter("@BranchId",branchId),
                    new SqlParameter("@IsBranch",isbranch),
                };
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spGetUserDetailsByClientId", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetUserForServiceCompanyDAL(int teamid)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] param =
                 {
                    new SqlParameter("@Teamid",teamid)
                };
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spGetUserDetailForServiceCompany", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        }

        public DataTable GetBranchWiseJobStatusReportDAL(DashboardBE dashboardBE)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] param =
                {
                                        new SqlParameter("@UserId",dashboardBE.jobFilters.Id ) ,                                       
                                        new SqlParameter("@BranchId",dashboardBE.jobFilters.BranchId ) ,
                                        new SqlParameter("@StartDate",dashboardBE.jobFilters.FromDate ) ,
                                        new SqlParameter("@EndDate",dashboardBE.jobFilters.ToDate ) ,
                                        
                 };
               
                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spListJobs", param);
                dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                //  LogUtility.SaveErrorLogEntry(ex);
            }
            return dt;
        } 
    }


    public static class Extensions
    {
        //=========================================================================
        // Removes all instances of [itemToRemove] from array [original]
        // Returns the new array, without modifying [original] directly
        // .Net2.0-compatible
        public static T[] RemoveFromArray<T>(this T[] original, T itemToRemove)
        {
            int numIdx = System.Array.IndexOf(original, itemToRemove);
            if (numIdx == -1) return original;
            List<T> tmp = new List<T>(original);
            tmp.RemoveAt(numIdx);
            return tmp.ToArray();
        }
    }
}
