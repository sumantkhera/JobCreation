
CREATE proc spJobStatus
as
begin
select Id, [Status], Code, [Level] from  JobStatus
end