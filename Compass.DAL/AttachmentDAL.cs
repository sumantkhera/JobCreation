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

        public List<CommentsBE> GetJobCommentsWithAttachmentsDAL(CommentsBE commentBE)
        {
            List<CommentsBE> CommentBEList = new List<CommentsBE>();
            try
            {
                DataTable dt = new DataTable();
                int index = 0;
                SqlParameter[] param = new SqlParameter[2];
                param[index++] = new SqlParameter("@Action", commentBE.Action);
                param[index++] = new SqlParameter("@JobId", commentBE.JobDetails.Id);

                DataSet ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spJobAttachments", param);

                dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                { 
                    CommentsBE oNewCommentBE = new CommentsBE();
                    commentBE.Attachment = new AttachmentsBE();
                    commentBE.JobDetails = new JobDetailsBE();
                    oNewCommentBE.CommentId = Convert.ToInt32(dr["CommentId"].ToString());
                    oNewCommentBE.Attachment.JobAttachmentId = Convert.ToInt32(dr["JobAttachmentId"].ToString());
                    oNewCommentBE.ClientId = Convert.ToInt32(dr["ClientId"].ToString());
                    oNewCommentBE.Description = Convert.ToString(dr["CommentDescription"]); 
                    oNewCommentBE.CreatedOn = Convert.ToDateTime(dr["CreatedOn"]);
                    oNewCommentBE.JobDetails.Id = dr["JobId"] != DBNull.Value ? Convert.ToInt32(dr["JobId"]) : 0;
                    oNewCommentBE.Attachment.Name = Convert.ToString(dr["AttachmentName"]);
                    oNewCommentBE.Attachment.Path = Convert.ToString(dr["Path"]);

                    CommentBEList.Add(oNewCommentBE);
                }
            }
            catch (Exception ex)
            {

            }
            return CommentBEList;
        }
    }
}
