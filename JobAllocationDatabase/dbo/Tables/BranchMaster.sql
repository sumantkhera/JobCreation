CREATE TABLE [dbo].[BranchMaster] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [BranchName]   NVARCHAR (100) NULL,
    [ClientId]     INT            NOT NULL,
    [IsHeadOffice] BIT            CONSTRAINT [DF_BranchMaster_IsHeadOffice] DEFAULT ((0)) NOT NULL,
    [ParentId]     INT            CONSTRAINT [DF_BranchMaster_ParentId] DEFAULT ((0)) NOT NULL,
    [CeratedOn]    DATETIME       CONSTRAINT [DF_BranchMaster_CeratedOn] DEFAULT (getdate()) NOT NULL,
    [ModifiedOn]   DATETIME       CONSTRAINT [DF_BranchMaster_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BranchMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);

