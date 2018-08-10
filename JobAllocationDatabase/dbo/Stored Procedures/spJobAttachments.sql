-- =============================================
-- Author:		<Amulya>
-- Create date: <08-07-2018>
-- Description:	<Getting Attachments related to Job>
-- =============================================
CREATE PROCEDURE [dbo].[spJobAttachments]
	@Action NVARCHAR(100) = NULL,
	@JobId int = NULL
	
AS
BEGIN
	
    IF(@Action = 'GetJobAttachmentsByJobId')
    BEGIN
    SELECT Id, Name AS AttachmentName , JobId, Path FROM JobAttachments WHERE JobId = @JobId and (CommentId IS NULL or CommentId=0)
    END
	
	IF(@Action = 'GetJobCommentsWithAttachmentsByJobId')
    BEGIN		
		select Distinct Cmnts.Id as CommentId, Cmnts.JobId,Cmnts.ClientId,
		Cmnts.Description CommentDescription,Cmnts.CreatedOn,U.UserName,JA.Id JobAttachmentId, JA.Name AS AttachmentName , JA.Path 
		from Comments Cmnts
		left join Users U on Cmnts.CreatedBy=U.Id
		left join JobDetails JD on Cmnts.JobId = JD.Id
		left join JobAttachments JA on JD.Id = JA.JobId AND Cmnts.Id = JA.CommentId
		where JD.Id=@JobId order by Cmnts.CreatedOn desc
    END
	
END