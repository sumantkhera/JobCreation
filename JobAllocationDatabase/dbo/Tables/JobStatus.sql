CREATE TABLE [dbo].[JobStatus] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [Status] NVARCHAR (50) NULL,
    [Code]   NVARCHAR (10) NULL,
    [Level]  INT           NULL,
    CONSTRAINT [PK_MAS_JobStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

