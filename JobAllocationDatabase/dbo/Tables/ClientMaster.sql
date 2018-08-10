CREATE TABLE [dbo].[ClientMaster] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50)  NULL,
    [Logo]             NVARCHAR (100) NULL,
    [IsServiceCompany] BIT            CONSTRAINT [DF_ClientMaster_IsServiceCompany] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ClientMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);

