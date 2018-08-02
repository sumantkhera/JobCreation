using CompassBE;
using System;
using System.Collections.Generic;
using System.Data;
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

    }
}
