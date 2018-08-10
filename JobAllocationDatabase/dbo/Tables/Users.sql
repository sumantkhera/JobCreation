CREATE TABLE [dbo].[Users] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [ParentId]             INT            CONSTRAINT [DF_Users_ParentId] DEFAULT ((0)) NOT NULL,
    [ClientId]             INT            NULL,
    [UserEmailId]          NVARCHAR (100) NOT NULL,
    [Hash]                 NVARCHAR (MAX) NULL,
    [Salt]                 NVARCHAR (MAX) NULL,
    [UserName]             NVARCHAR (100) NOT NULL,
    [IsServiceCompanyUser] BIT            CONSTRAINT [DF_User_IsDamcoUser] DEFAULT ((0)) NOT NULL,
    [BranchId]             INT            NULL,
    [UserTypeID]           INT            NULL,
    [ServiceCompanyId]     INT            NULL,
    [IsActive]             BIT            NULL,
    [IsBranch]             BIT            CONSTRAINT [DF_User_IsBranch] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);

