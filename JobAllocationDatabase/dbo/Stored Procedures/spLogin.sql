-- =============================================
-- Author:		Sumant Khera
-- Create date: 08/03/2018
-- Description:	User login
-- EXEC [dbo].[spLogin] @username = 'headoffice@compass.com', @password = ''
-- =============================================
CREATE PROCEDURE [dbo].[spLogin]
	@username nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT u.Id UserId, u.ClientId, UserEmailId, UserName, IsServiceCompanyUser, BranchId, UserTypeID, ServiceCompanyId, IsActive, IsBranch, bm.BranchName
	, c.Name ClientName, c.Logo ClientLogo, tm.UserType UserTypeName, tm.Code UserTypeCode, u.Salt, u.Hash
	FROM Users u
	LEFT JOIN BranchMaster bm on bm.Id = u.BranchId
	LEFT JOIN ClientMaster c on c.Id = u.ClientId
	LEFT JOIN UserTypeMaster tm on tm.Id = u.UserTypeID
	WHERE IsActive = 1 AND UserEmailId = @username  
END