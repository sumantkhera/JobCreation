using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompassBE.ViewModel;

namespace CompassBE
{
    public class CommentsBE
    {
        public string Action { get; set; }
        public int CommentId{ get; set; }
        public int ClientId { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int CreatedBy{ get; set; }
        public bool  IsInternalUse{ get; set; }
        public UserLogin usr { get; set; }
        public JobDetailsBE JobDetails { get; set; }
        public AttachmentsBE Attachment { get; set; }
    }
}
