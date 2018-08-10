CREATE TABLE [dbo].[PriorityType] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [PriorityType] NVARCHAR (50) NULL,
    CONSTRAINT [PK_PriorityType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

