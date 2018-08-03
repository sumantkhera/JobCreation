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
