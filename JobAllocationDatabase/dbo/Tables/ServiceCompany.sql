CREATE TABLE [dbo].[ServiceCompany] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NULL,
    CONSTRAINT [PK_ServiceCompany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

