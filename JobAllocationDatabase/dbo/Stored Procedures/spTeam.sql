CREATE proc spTeam
as
begin
SELECT Id, Name, Logo, IsServiceCompany FROM ClientMaster
end