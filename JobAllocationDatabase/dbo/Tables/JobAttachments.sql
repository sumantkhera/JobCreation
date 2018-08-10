CREATE TABLE [dbo].[JobAttachments] (
    [Id]        INT             IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (500)  NULL,
    [Path]      NVARCHAR (1000) NULL,
    [CreatedOn] DATETIME        CONSTRAINT [DF_JobAttachments_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [CreatedBy] INT             NOT NULL,
    [JobId]     INT             NOT NULL,
    [CommentId] INT             NULL,
    CONSTRAINT [PK_JobAttachments] PRIMARY KEY CLUSTERED ([Id] ASC)
);

