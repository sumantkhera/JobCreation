
CREATE PROCEDURE [dbo].[spJobDetails]
	@Action nvarchar(50) = NULL,
	@JobId int = null,
	@JobStatusId int = NULL,
	@ServiceCompanyId int = NULL,
	@ClientId int = NULL,
	@Description nvarchar(max) = NULL,
	@CreatedOn DATETIME = NULL,
	@CreatedBy int = NULL,
	@IsInternalUse bit = NULL,
	@QAUserId int = NULL,
	@AllocatedToTeam int = NULL,
	@AllocatedToUser int = NULL,
	@AllocationDate DATETIME = NULL,
	@UserId INT = 0,
	@Attachments [UT_JobAttachment] readonly
AS
BEGIN
	--Variables
	DECLARE 
	@OldStatus			INT = 0,
	@OldAllocatedTeam	INT = 0,
	@OldAllocatedUser	INT = 0,
	@OldQaUser			INT = 0


	IF(@Action = 'GetJobDetailsById')
	BEGIN		
		SELECT JD.Id, JD.JobNumber,JD.ClientId, JD.SubmitDate,U.UserName SubmittedByName,BM.BranchName,JS.Id JobStatusId,JT.Id JobTypeId,
		JD.AllocatedToTeam,JD.AllocatedToUser,JD.QAUserId,JD.AllocationDate, JD.Description
		,JD.LastCommentedDate,JD.LastUpdatedDate,JD.PriorityID,JD.IsSystemDefined, Cmnts.IsInternal from JobDetails JD
		LEFT JOIN Users U on JD.SubmitBy=U.Id
		LEFT JOIN BranchMaster BM on JD.SubmittedByBranch = BM.Id
		LEFT JOIN JobStatus JS on JD.JobStatusId = JS.Id
		LEFT JOIN JobType JT on JD.JobTypeId = JT.Id
		LEFT JOIN Comments Cmnts on JD.Id = Cmnts.JobId
		where JD.Id=@JobId
	END
	
	IF(@Action = 'GetJobStatus')
	BEGIN
		Select Id,Status from JobStatus
	END
	
	
	IF(@Action = 'GetQAUser')
	BEGIN
		Select Id,UserName from Users where UserTypeID=5 and IsActive=1   -- QA user type id = 5
	END
	
	IF(@Action = 'GetUserForServiceCompany')
	BEGIN
		Select Id,UserName from Users where IsServiceCompanyUser =1 and ClientId=@ServiceCompanyId and UserTypeID != 5
		and IsActive=1 
	END
	
	IF(@Action = 'GetQAUserForServiceCompany')
	BEGIN
		Select Id,UserName from Users where IsServiceCompanyUser =1 and ClientId=@ServiceCompanyId  AND UserTypeID=5 
		and IsActive=1 
	END
	
	
	IF(@Action = 'AddJobComments')
		BEGIN
			DECLARE @CommentID int = null
		
			INSERT INTO Comments (JobId, ClientId, Description,IsInternal, CreatedOn, CreatedBy)
			VALUES (@JobId,@ClientId,@Description,@IsInternalUse,GETDATE(),@CreatedBy)	
		
			SET @CommentID = @@identity
		
			INSERT INTO JobAttachments (Name, Path, CreatedOn, CreatedBy, JobId, CommentId)
			SELECT  attachment.Name ,  attachment.Path , getdate(), attachment.CreatedBy ,  @JobId ,  @CommentID from @Attachments attachment
		
			SELECT 1 AS MSG
		END
	
	IF(@Action='EditJobStatusAndAllocationDetails')
		BEGIN
			-----Add record for History STARTS----
			SELECT 
				@OldStatus			= a.JobStatusId,
				@OldAllocatedTeam	= a.AllocatedToTeam,
				@OldAllocatedUser	= a.AllocatedToUser,
				@OldQaUser			= a.QAUserId
			FROM JobDetails a 
			WHERE a.Id = @JobId
			--Status change
			IF(@OldStatus <> @JobStatusId)
				BEGIN
					INSERT INTO JobStatusChangedHistory (JobId, PrevStatus, NewStatus, ChangedBy, ChangedOn) VALUES
					(@JobId, @OldStatus, @JobStatusId, @UserId, GETDATE())
				END

			--Team changes
			IF(@OldAllocatedTeam <> @AllocatedToTeam)
				BEGIN
					INSERT INTO JobAllocationChangedHistory (JobId, PrevTeam, NewTeam, ChangedBy, ChangedOn) VALUES
					(@JobId, @OldAllocatedTeam, @AllocatedToTeam, @UserId, GETDATE())
				END
			--Allocated User changes
			IF(@OldAllocatedUser <> @AllocatedToUser)
				BEGIN
					INSERT INTO JobAllocationChangedHistory (JobId, PrevUser, NewUser, ChangedBy, ChangedOn, UserType) VALUES
					(@JobId, @OldAllocatedUser, @AllocatedToUser, @UserId, GETDATE(), 'MEMBER')
				END
			--QA User changes
			IF(@OldQaUser <> @QAUserId)
				BEGIN
					INSERT INTO JobAllocationChangedHistory (JobId, PrevUser, NewUser, ChangedBy, ChangedOn, UserType) VALUES
					(@JobId, @OldQaUser, @QAUserId, @UserId, GETDATE(), 'QA')
				END
			-----Add record for History ENDS----

			UPDATE JobDetails set JobStatusId=@JobStatusId,QAUserId=@QAUserId,
			AllocatedToTeam=@AllocatedToTeam,AllocatedToUser=@AllocatedToUser,AllocationDate=@AllocationDate, LastUpdatedDate=GETDATE() 
			where Id=@JobId

			SELECT 1 MSG
		END

	IF(@Action='GetTeam')
		BEGIN
			SELECT Id, Name from ClientMaster
		END
	
END