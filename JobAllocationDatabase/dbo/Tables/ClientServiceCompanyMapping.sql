CREATE TABLE [dbo].[ClientServiceCompanyMapping] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [ClientId]        INT NULL,
    [ServiceClientId] INT NULL,
    CONSTRAINT [PK_ClientServiceCompany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

