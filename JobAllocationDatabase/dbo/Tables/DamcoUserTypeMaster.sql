CREATE TABLE [dbo].[DamcoUserTypeMaster] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [UserType] NVARCHAR (100) NULL,
    CONSTRAINT [PK_DamcoUserTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);

