

CREATE PROC  [dbo].[spCreateJob]
	@ClientId int= null,
	@JobNumber nvarchar(50)= null,
	@SubmitDate datetime =null,
	@SubmitBy int =null,
	@SubmittedByBranch int= null,
	@CretaedDate datetime =null,
	@CreatedBy  int= null,
	@JobTypeId int =null,
	--@JobStatusId int= null,
	@AllocatedToTeam int =null,
	@AllocatedToUser int =null,
	@AllocationDate datetime =null,
	@QAUserId int= null,
	@LastCommentedDate datetime= null,
	@LastUpdatedDate datetime =null,
	@PriorityID int= null,
	@IsSystemDefined bit=null,
	@CommentDescription nvarchar(max)=null ,
	@Attachments [UT_JobAttachment] readonly
AS 
BEGIN
	DECLARE @JobStatusId INT = 0

	--Job Status
	SELECT @JobStatusId = Id FROM JobStatus WHERE Code = 'REVD'

	--Allocated to
	SELECT @AllocatedToTeam = ServiceClientId FROM ClientServiceCompanyMapping where ClientId = @ClientId

	INSERT INTO JobDetails (ClientId, JobNumber,
	SubmitDate, SubmitBy, SubmittedByBranch, CretaedDate, CreatedBy, JobTypeId, JobStatusId, AllocatedToTeam, AllocatedToUser, AllocationDate, QAUserId, LastCommentedDate, LastUpdatedDate, PriorityID, IsSystemDefined, Description)
	VALUES (@ClientId, @JobNumber, @SubmitDate, @SubmitBy, @SubmittedByBranch, @CretaedDate, @CreatedBy, @JobTypeId, @JobStatusId, @AllocatedToTeam, @AllocatedToUser, @AllocationDate, @QAUserId, @LastCommentedDate, @LastUpdatedDate, @PriorityID, @IsSystemDefined, @CommentDescription)

	DECLARE @JobId INT
	SET @JobId = @@identity

	--INSERT INTO Comments (JobId, ClientId, Description, CreatedOn, CreatedBy)
	--	VALUES (@JobId, @ClientId, @CommentDescription, @CretaedDate, @CreatedBy)

	--DECLARE @CommentId INT
	--SET @CommentId = @@identity

	INSERT INTO JobAttachments (Name, Path, CreatedOn, CreatedBy, JobId, CommentId)
	SELECT  attachment.Name ,  attachment.Path , getdate(), attachment.CreatedBy ,  @JobId ,  attachment.CommentId  from @Attachments attachment

	SELECT
		1 AS MSG
END