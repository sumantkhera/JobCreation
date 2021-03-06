﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Compass.DAL;
using CompassBE;
using System.Data;

namespace Compass.BAL
{
    public class AttachmentsBAL
    {
        public List<AttachmentsBE> GetJobAttachmentsBAL(AttachmentsBE attachmentBE)
        {
            List<AttachmentsBE> AttachmentBEList = new List<AttachmentsBE>();

            try
            {
                AttachmentDAL attachmentDAL = new AttachmentDAL();

                AttachmentBEList = attachmentDAL.GetJobAttachmentsDAL(attachmentBE);
                attachmentDAL = null;
            }
            catch (Exception ex)
            {               
            }
            finally { }
            return AttachmentBEList;
        }

        public List<CommentsBE> GetJobCommentsWithAttachmentsBAL(CommentsBE commentBE)
        {
            List<CommentsBE> CommentBEList = new List<CommentsBE>();

            try
            {
                AttachmentDAL attachmentDAL = new AttachmentDAL();

                CommentBEList = attachmentDAL.GetJobCommentsWithAttachmentsDAL(commentBE);
                attachmentDAL = null;
            }
            catch (Exception ex)
            {
            }
            finally { }
            return CommentBEList;
        }
    }
}
