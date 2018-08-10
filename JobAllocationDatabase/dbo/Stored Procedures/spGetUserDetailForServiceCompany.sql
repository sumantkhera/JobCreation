/****** Object:  StoredProcedure [dbo].[spGetUserDetails]    Script Date: 8/9/2018 3:59:10 PM ******/
CREATE  PROCEDURE [dbo].[spGetUserDetailForServiceCompany]  
@Teamid int=0
AS
BEGIN

if exists (select * FROM ClientMaster where ClientMaster.Id=@Teamid AND ClientMaster.IsServiceCompany =1) OR (@Teamid=0)
BEGIN

SET @Teamid=2

SELECT
	u.Id
   ,u.ClientId
   ,u.UserEmailId
   ,u.UserName
   ,u.IsServiceCompanyUser
   ,u.BranchId
   ,u.UserTypeID
   ,u.ServiceCompanyId
   ,u.IsActive
   ,u.IsBranch
FROM Users u INNER JOIN UserTypeMaster utm ON u.UserTypeID=utm.Id
WHERE u.IsActive = 1 AND u.ClientId=@Teamid 
AND utm.Code NOT IN ('QA','QAHEAD')
END
ELSE
RETURN
END