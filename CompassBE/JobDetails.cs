using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class JobDetails
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public int PriorityID { get; set; }
        public DateTime LastUpdatedDate { get; set; }
        public DateTime LastCommentedDate { get; set; }
        public int QAUserId { get; set; }
        public DateTime AllocationDate { get; set; }
        public int AllocatedToUser { get; set; }
        public int AllocatedToTeam { get; set; }
        public int JobStatusId { get; set; }
        public int JobTypeId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CretaedDate { get; set; }
        public int SubmittedByBranch { get; set; }
        public int SubmitBy { get; set; }
        public DateTime? SubmitDate { get; set; }
        public string JobNumber { get; set; }
        public bool IsSystemDefined { get; set; }
        public string CommentDescription { get; set; }
        public string AttachmentName { get; set; }
        public string AttachmentPath { get; set; }
    }
}
