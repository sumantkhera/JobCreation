
CREATE  PROCEDURE [dbo].[spGetUserDetailsByClientId]
	@ClientId int,
	@BranchId INT = 0
AS
BEGIN
	SELECT
		Id
	   ,ClientId
	   ,UserEmailId
	   ,UserName
	   ,IsServiceCompanyUser
	   ,BranchId
	   ,UserTypeID
	   ,ServiceCompanyId
	   ,IsActive
	   ,IsBranch
	FROM Users
	WHERE Users.IsActive = 1 AND Users.ClientId=@ClientId 
	AND (Users.BranchId = @BranchId OR @BranchId = 0)
END