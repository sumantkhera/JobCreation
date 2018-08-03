using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class JobTypeBE
    {
        public int Id { get; set; }
        public string jobName { get; set; }
        public int ClientId { get; set; }

        public string JobNumber{ get; set; }

        public DateTime SubmitDate { get; set; }
        public int SubmitBy{ get; set; }

        public int SubmitByBranch { get; set; }
        public DateTime CreatedDate{ get; set; }
        public int CreatedBy { get; set; }

        public int JobTypeID{ get; set; }
        public int JobStatusID { get; set; }

        public int AllocatedToTeam{ get; set; }
        public int AllocatedToUser { get; set; }

        public DateTime AllocationDate{ get; set; }

        public int QAUserId{ get; set; }

        public DateTime LastCommentedDate{ get; set; }

        public DateTime LastUpdatedDate { get; set; }

        public int PriorityID{ get; set; }

        public bool IsSystemDefined{ get; set; }

        public bool IsInternalUse{ get; set; }

    }
}
