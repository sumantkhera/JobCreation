using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class jobFiltersBE
    {
        public jobFiltersBE()
        {
            JobStatus = new JobStatusColllection();
        }
        public int? Id { get; set; }
        public int? TeamId { get; set; }
        public int PriorityID { get; set; }
        public int? AllocatedToUser { get; set; }
        public int JobTypeId { get; set; }
        public int? BranchId { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string JobNumber { get; set; }

        public JobStatusColllection JobStatus { get; set; }

        public JobDetailsBE jobDetails;
    }

    public class JobStatusColllection : List<JobStatusBE>, IEnumerable<SqlDataRecord>
    {
        IEnumerator<SqlDataRecord> IEnumerable<SqlDataRecord>.GetEnumerator()
        {
            var sqlRow = new SqlDataRecord(new SqlMetaData("JobStatusId", SqlDbType.NVarChar, 500));
            foreach (JobStatusBE cust in this)
            {
                sqlRow.SetString(0, cust.JobStatusId.ToString());
                yield return sqlRow;
            }
        }
    }

    public class JobStatusBE
    {
        public int? JobStatusId { get; set; }
        public jobFiltersBE jobFilters { get; set; }
    }
}
