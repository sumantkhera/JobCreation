CREATE TABLE [dbo].[UserTypeMaster] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [UserType] NVARCHAR (100) NULL,
    [Code]     NVARCHAR (10)  NULL,
    CONSTRAINT [PK_UserTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);

