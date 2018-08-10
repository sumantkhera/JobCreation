/****** Script for SelectTopNRows command from SSMS  ******/

CREATE proc spPriorityType
as
begin
SELECT Id, PriorityType
  FROM JobAllocation.[dbo].PriorityType
  end