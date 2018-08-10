

-- =============================================
-- Author:		Sumant Khera
-- Create date: 08/07/2018
-- Description:	List jobs based upon user
-- exec spListJobs @UserId = 1
-- =============================================
CREATE PROCEDURE [dbo].[spListJobs]
	@UserId INT
	,@BranchId int =0
	,@StartDate date ='01/01/1900'
	,@EndDate date = '01/01/1900'
	,@JobNumber nvarchar(50)=null
	,@JobTypeId int=0	
	,@AllocatedToUser int =0
	,@PriorityID int =0
	,@TeamId int =0	
	,@JobStatus [UT_JobStatus] readonly 
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@UserType nvarchar(10) = '',
	@IsServiceCompany BIT = 0,
	@ClientId INT = 0

	if @EndDate= '01/01/1900'
		set @EndDate =dateadd(d,2,getdate())

	--Get User Type
	SELECT @UserType = t.Code, @IsServiceCompany = u.IsServiceCompanyUser, @ClientId = u.ClientId
	FROM Users u 
	INNER JOIN UserTypeMaster t on u.UserTypeID = t.Id
	WHERE u.Id = @UserId
	;


	--Get User Hierarcy
	WITH tblChild AS
	(
		SELECT * FROM Users WHERE Id = @UserId
		UNION ALL
		SELECT Users.* FROM Users  JOIN tblChild  ON Users.ParentId = tblChild.Id
	)
	SELECT Id UserId INTO #TempUsers FROM tblChild
	--OPTION(MAXRECURSION 32767)
	;

	------Is Service Company STARTS-----
	IF @IsServiceCompany = 1
	BEGIN
    
		IF @UserType = 'MEMBER'
			BEGIN
				SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				FROM JobDetails jd 
				LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				LEFT JOIN JobType t on t.Id = jd.JobTypeId
				LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser				
				WHERE jd.AllocatedToUser = @UserId
				AND jd.JobNumber Like '%' + ISNULL(@JobNumber, jd.JobNumber) + '%'
				AND (jd.SubmittedByBranch=@BranchId OR @BranchId=0)
				and (jd.SubmitDate >=@StartDate)
				and (jd.SubmitDate <= @EndDate)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId=0)
				AND (jd.AllocatedToTeam = @TeamId OR @TeamId = 0)
				AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0)
				AND (jd.PriorityID = @PriorityID OR @PriorityID = 0)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId = 0)
				--AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0 OR jd.QAUserId = @AllocatedToUser)	
				AND (
						jd.JobStatusId in (	SELECT JobStatusId xx from @JobStatus 	) OR (select COUNT(*) FROM @JobStatus)=0
				)
				ORDER BY jd.LastUpdatedDate desc

		
			END

		IF @UserType = 'QA' OR @UserType = 'QAHEAD'
			BEGIN
				SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				FROM JobDetails jd 
				INNER JOIN #TempUsers tu on tu.UserId = jd.QAUserId
				LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				LEFT JOIN JobType t on t.Id = jd.JobTypeId
				LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser
				WHERE 
				jd.JobNumber Like '%' + ISNULL(@JobNumber, jd.JobNumber) + '%'
				AND (jd.SubmittedByBranch=@BranchId OR @BranchId=0)
				and (jd.SubmitDate >=@StartDate)
				and (jd.SubmitDate <= @EndDate)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId=0)
				AND (jd.AllocatedToTeam = @TeamId OR @TeamId = 0)
				AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0)
				AND (jd.PriorityID = @PriorityID OR @PriorityID = 0)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId = 0)
				--AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0 OR jd.QAUserId = @AllocatedToUser)			
				AND (
					jd.JobStatusId in (	SELECT JobStatusId xx from @JobStatus 	) OR (select COUNT(*) FROM @JobStatus)=0
				)		
				ORDER BY jd.LastUpdatedDate desc

			END

		IF @UserType = 'PM' OR @UserType = 'DM'
			BEGIN
				SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				FROM JobDetails jd 
				INNER JOIN ClientServiceCompanyMapping map on map.ClientId = jd.ClientId
				LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				LEFT JOIN JobType t on t.Id = jd.JobTypeId
				LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser
				WHERE map.ServiceClientId = @ClientId 
				AND jd.JobNumber Like '%' + ISNULL(@JobNumber, jd.JobNumber) + '%'
				AND (jd.SubmittedByBranch=@BranchId OR @BranchId=0)
				and (jd.SubmitDate >=@StartDate)
				and (jd.SubmitDate <= @EndDate)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId=0)
				AND (jd.AllocatedToTeam = @TeamId OR @TeamId = 0)
				AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0)
				AND (jd.PriorityID = @PriorityID OR @PriorityID = 0)
				AND (jd.JobTypeId = @JobTypeId OR @JobTypeId = 0)
				--AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0 OR jd.QAUserId = @AllocatedToUser)	
				AND (
					jd.JobStatusId in (	SELECT JobStatusId xx from @JobStatus 	) OR (select COUNT(*) FROM @JobStatus)=0
				)
				ORDER BY jd.LastUpdatedDate desc

				----Allocated Users
				--SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				--, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				--, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				--FROM JobDetails jd 
				--LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				--LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				--LEFT JOIN JobType t on t.Id = jd.JobTypeId
				--LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				--LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				--LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				--LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser
				--WHERE jd.AllocatedToUser = @UserId

				--UNION
		
				----QA allocated users
				--SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				--, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				--, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				--FROM JobDetails jd 
				--INNER JOIN #TempUsers tu on tu.UserId = jd.QAUserId
				--LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				--LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				--LEFT JOIN JobType t on t.Id = jd.JobTypeId
				--LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				--LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				--LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				--LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser
		
				--UNION

				----Non allocated Jobs
				--SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
				--, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
				--, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
				--FROM JobDetails jd 
				--LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
				--LEFT JOIN Users sub on sub.Id = jd.SubmitBy
				--LEFT JOIN JobType t on t.Id = jd.JobTypeId
				--LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
				--LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
				--LEFT JOIN PriorityType p on p.Id = jd.PriorityID
				--LEFT JOIN Users aloc on aloc.Id = jd.AllocatedToUser
				--WHERE jd.AllocatedToUser IS NULL AND jd.AllocatedToTeam IS NULL
				--ORDER BY jd.LastUpdatedDate desc
			END
	
	END
	------Is Service Company ENDS-----

	------Is CLIENT STARTS-----
	IF @IsServiceCompany = 0
		BEGIN
			SELECT jd.Id, jd.JobNumber, jd.SubmittedByBranch, b.BranchName, t.JobName JobType, s.Status JobStatus		
			, p.PriorityType, jd.SubmitDate, jd.SubmitBy, sub.UserName SubmitByName, jd.LastUpdatedDate
			--, CASE WHEN te.IsServiceCompany = 1 THEN te.Name + '/' + aloc.UserName ELSE te.Name END AllocatedTo
			,'' AllocatedTo
			FROM JobDetails jd 
			INNER JOIN #TempUsers tu on tu.UserId = jd.SubmitBy
			LEFT JOIN BranchMaster b on b.Id = jd.SubmittedByBranch
			LEFT JOIN Users sub on sub.Id = jd.SubmitBy
			LEFT JOIN JobType t on t.Id = jd.JobTypeId
			LEFT JOIN JobStatus s on s.Id = jd.JobStatusId
			LEFT JOIN ClientMaster te on te.Id = jd.AllocatedToTeam
			LEFT JOIN PriorityType p on p.Id = jd.PriorityID
			WHERE jd.ClientId = @ClientId 
			AND jd.JobNumber Like '%' + ISNULL(@JobNumber, jd.JobNumber) + '%'
			AND (jd.SubmittedByBranch=@BranchId OR @BranchId=0)
			and (jd.SubmitDate >=@StartDate)
			and (jd.SubmitDate <= @EndDate)
			AND (jd.JobTypeId = @JobTypeId OR @JobTypeId=0)
			AND (jd.AllocatedToTeam = @TeamId OR @TeamId = 0)
			--AND (jd.AllocatedToUser = @AllocatedToUser OR @AllocatedToUser = 0 OR jd.QAUserId = @AllocatedToUser)
			AND (jd.PriorityID = @PriorityID OR @PriorityID = 0)
			AND (jd.JobTypeId = @JobTypeId OR @JobTypeId = 0)	
			AND (
				jd.JobStatusId in (	SELECT JobStatusId xx from @JobStatus 	) OR (select COUNT(*) FROM @JobStatus)=0
			)
			ORDER BY jd.LastUpdatedDate desc
		END
	------Is CLIENT ENDS-----
END