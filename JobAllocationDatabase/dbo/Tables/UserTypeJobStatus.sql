CREATE TABLE [dbo].[UserTypeJobStatus] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [UserTypeId]  INT NOT NULL,
    [JobStatusId] INT NOT NULL,
    CONSTRAINT [PK_UserJobStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

