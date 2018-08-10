CREATE TABLE [dbo].[Sys_Users_PreSales] (
    [usr_id]          INT           IDENTITY (1, 1) NOT NULL,
    [usr_loginid]     VARCHAR (10)  NOT NULL,
    [usr_password]    VARCHAR (10)  NOT NULL,
    [usr_username]    VARCHAR (50)  CONSTRAINT [DF_sys_users_usr_username] DEFAULT ('') NOT NULL,
    [usr_email]       VARCHAR (100) CONSTRAINT [DF_sys_users_usr_email] DEFAULT ('') NOT NULL,
    [usr_usertype]    VARCHAR (20)  CONSTRAINT [DF_sys_users_usr_department] DEFAULT ('') NOT NULL,
    [usr_datecreated] DATETIME      CONSTRAINT [DF_Sys_Users_PreSales_usr_datecreated] DEFAULT (getdate()) NULL,
    [usr_status]      VARCHAR (10)  CONSTRAINT [DF_sys_users_usr_status] DEFAULT ('Active') NOT NULL,
    [usr_managerId]   VARCHAR (50)  DEFAULT ('') NOT NULL,
    [Usr_RoleId]      INT           DEFAULT ((0)) NOT NULL,
    [usr_SalesHeadID] INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sys_Users_PreSales] PRIMARY KEY CLUSTERED ([usr_id] ASC) WITH (FILLFACTOR = 90)
);

