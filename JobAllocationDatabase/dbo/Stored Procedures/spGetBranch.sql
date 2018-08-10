

CREATE proc spGetBranch
as
begin

select Id, BranchName, IsHeadOffice, ParentId FROM 
[dbo].[BranchMaster]

end