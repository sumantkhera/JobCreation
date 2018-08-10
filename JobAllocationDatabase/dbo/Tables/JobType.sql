CREATE TABLE [dbo].[JobType] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [JobName] NVARCHAR (100) NULL,
    CONSTRAINT [PK_Mas_JobType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

