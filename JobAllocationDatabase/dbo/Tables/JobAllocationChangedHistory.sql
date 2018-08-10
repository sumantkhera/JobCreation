CREATE TABLE [dbo].[JobAllocationChangedHistory] (
    [Id]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [JobId]     INT          CONSTRAINT [DF_JobAllocationChangedHistory_JobId] DEFAULT ((0)) NOT NULL,
    [PrevUser]  INT          CONSTRAINT [DF_JobAllocationChangedHistory_PrevUser] DEFAULT ((0)) NOT NULL,
    [NewUser]   NCHAR (10)   CONSTRAINT [DF_JobAllocationChangedHistory_NewUser] DEFAULT ((0)) NOT NULL,
    [UserType]  VARCHAR (50) CONSTRAINT [DF_JobAllocationChangedHistory_UserType] DEFAULT ('') NOT NULL,
    [ChangedBy] INT          CONSTRAINT [DF_JobAllocationChangedHistory_ChangedBy] DEFAULT ((0)) NOT NULL,
    [ChangedOn] DATETIME     CONSTRAINT [DF_JobAllocationChangedHistory_ChangedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_JobAllocationChangedHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
);

