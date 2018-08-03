using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class Attachments
    {      
        public string Name { get; set; }
        public string Path { get; set; }      
        public int? CreatedBy { get; set; }      
        public int? CommentId { get; set; }    
    }


    public class AttachmentsColllection : List<Attachments>, IEnumerable<SqlDataRecord>
    {
        IEnumerator<SqlDataRecord> IEnumerable<SqlDataRecord>.GetEnumerator()
        {
            var sqlRow = new SqlDataRecord(
                  new SqlMetaData("Name", SqlDbType.VarChar, 50),
                  new SqlMetaData("Path", SqlDbType.VarChar, 50),
                  new SqlMetaData("CreatedBy", SqlDbType.Int),
                  new SqlMetaData("CommentId", SqlDbType.Int));

            foreach (Attachments cust in this)
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
