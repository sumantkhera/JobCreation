CREATE TABLE [dbo].[JobDetails] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [ClientId]          INT             NULL,
    [JobNumber]         NVARCHAR (50)   NULL,
    [SubmitDate]        DATETIME        CONSTRAINT [DF_JobDetails_SubmitDate] DEFAULT (getdate()) NOT NULL,
    [SubmitBy]          INT             NULL,
    [SubmittedByBranch] INT             NULL,
    [CretaedDate]       DATETIME        CONSTRAINT [DF_JobDetails_CretaedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]         INT             NULL,
    [JobTypeId]         INT             NULL,
    [JobStatusId]       INT             NULL,
    [AllocatedToTeam]   INT             NULL,
    [AllocatedToUser]   INT             NULL,
    [AllocationDate]    DATETIME        CONSTRAINT [DF_JobDetails_AllocationDate] DEFAULT (getdate()) NOT NULL,
    [QAUserId]          INT             NULL,
    [LastCommentedDate] DATETIME        NULL,
    [LastUpdatedDate]   DATETIME        NULL,
    [PriorityID]        INT             NULL,
    [IsSystemDefined]   BIT             CONSTRAINT [DF_JobDetails_IsSystemDefined] DEFAULT ((0)) NOT NULL,
    [Description]       NVARCHAR (2000) NULL,
    CONSTRAINT [PK_JobDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
);

