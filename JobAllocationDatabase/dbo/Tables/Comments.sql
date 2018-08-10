CREATE TABLE [dbo].[Comments] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [JobId]       INT            NOT NULL,
    [ClientId]    INT            NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [IsInternal]  BIT            CONSTRAINT [DF_Comments_IsInternal] DEFAULT ((0)) NOT NULL,
    [CreatedOn]   DATETIME       CONSTRAINT [DF_Comments_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]   INT            NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([Id] ASC)
);

