CREATE TABLE [dbo].[JobStatusChangedHistory] (
    [ID]         BIGINT   IDENTITY (1, 1) NOT NULL,
    [JobId]      BIGINT   CONSTRAINT [DF_JobStatusChangedHistory_JobId] DEFAULT ((0)) NOT NULL,
    [PrevStatus] INT      CONSTRAINT [DF_JobStatusChangedHistory_PrevStatus] DEFAULT ((0)) NOT NULL,
    [NewStatus]  INT      CONSTRAINT [DF_JobStatusChangedHistory_NewStatus] DEFAULT ((0)) NOT NULL,
    [ChangedBy]  INT      CONSTRAINT [DF_JobStatusChangedHistory_ChangedBy] DEFAULT ((0)) NOT NULL,
    [ChangedOn]  DATETIME CONSTRAINT [DF_JobStatusChangedHistory_ChangedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_JobStatusChangedHistory] PRIMARY KEY CLUSTERED ([ID] ASC)
);

