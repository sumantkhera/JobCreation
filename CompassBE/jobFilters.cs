using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class jobFilters
    {
        public int? Id { get; set; }
        public int? ClientId { get; set; }
        public int PriorityID { get; set; }      
        public int? AllocatedToUser { get; set; }
        public int JobStatusId { get; set; }
        public int JobTypeId { get; set; }
        public int? BranchId { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string JobNumber { get; set; }      
    }
}
