using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    [Serializable]
    public class AttachmentsBE
    {
        public string Action { get; set; }
        public int JobAttachmentId { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }      
        public int? CreatedBy { get; set; }      
        public int? CommentId { get; set; }

        public JobDetailsBE JobDetails { get; set; } 
    }


    public class AttachmentsColllection : List<AttachmentsBE>, IEnumerable<SqlDataRecord>
    {
        IEnumerator<SqlDataRecord> IEnumerable<SqlDataRecord>.GetEnumerator()
        {
            var sqlRow = new SqlDataRecord(
                  new SqlMetaData("Name", SqlDbType.NVarChar, 500),
                  new SqlMetaData("Path", SqlDbType.NVarChar, 1000),
                  new SqlMetaData("CreatedBy", SqlDbType.VarChar, 50),
                  new SqlMetaData("CommentId", SqlDbType.VarChar, 50));

            foreach (AttachmentsBE cust in this)
            {
                sqlRow.SetString(0, cust.Name);
                sqlRow.SetString(1, cust.Path);
                sqlRow.SetString(2, cust.CreatedBy.ToString());
                sqlRow.SetString(3, cust.CommentId.ToString());
                yield return sqlRow;
            }
        }
    }
}
