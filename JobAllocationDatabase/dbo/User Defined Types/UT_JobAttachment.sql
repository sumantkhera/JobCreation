CREATE TYPE [dbo].[UT_JobAttachment] AS TABLE (
    [Name]      NVARCHAR (500)  NULL,
    [Path]      NVARCHAR (1000) NULL,
    [CreatedBy] INT             NULL,
    [CommentId] INT             NULL);

