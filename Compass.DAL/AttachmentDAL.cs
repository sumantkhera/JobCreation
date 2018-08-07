using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CompassBE;

namespace Compass.DAL
{
    public class AttachmentDAL
    {
        public List<AttachmentsBE> GetJobAttachmentsDAL(AttachmentsBE attachmentBE)
        {
            List<AttachmentsBE> AttachmentsBEList = new List<AttachmentsBE>();
            try
            {
                DataTable dt = new DataTable();
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", attachmentBE.Action);
                param[index++] = new SqlParameter("@JobId", attachmentBE.JobDetails.Id);

                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobAttachments", param);

                dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    AttachmentsBE oNewAttachmentsBE = new AttachmentsBE();
                    oNewAttachmentsBE.JobDetails = new JobDetailsBE();
                   
                    oNewAttachmentsBE.JobAttachmentId = Convert.ToInt32(dr["Id"].ToString());
                    oNewAttachmentsBE.JobDetails.Id = dr["JobId"] != DBNull.Value ? Convert.ToInt32(dr["JobId"]) : 0;
                    oNewAttachmentsBE.Name = Convert.ToString(dr["AttachmentName"]);
                    oNewAttachmentsBE.Path = Convert.ToString(dr["Path"]);


                    AttachmentsBEList.Add(oNewAttachmentsBE);
                }
            }
            catch (Exception ex)
            {

            }
            return AttachmentsBEList;
        }
    }
}
