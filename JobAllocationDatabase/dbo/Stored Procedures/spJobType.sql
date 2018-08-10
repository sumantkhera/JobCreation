/****** Script for SelectTopNRows command from SSMS  ******/

CREATE proc spJobType
as
begin
SELECT id,jobName
  FROM JobAllocation.[dbo].JobType
  end