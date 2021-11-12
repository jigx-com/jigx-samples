DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users](
	[email] NVARCHAR (100) UNIQUE NOT NULL,
	[department] NVARCHAR (100) NOT NULL,
	[office] NVARCHAR (100) NULL,
	[currency] NVARCHAR(100) NOT NULL  
)

INSERT INTO [dbo].[users] ([email],[department],[office],[currency]) VALUES ('renier@jigx.com','Development','USA','USD')

SELECT [email],[department],[office],[currency] FROM [dbo].[users]