
CREATE PROCEDURE [dbo].[spGetUserDetails]
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
WHERE Users.IsActive = 1
END