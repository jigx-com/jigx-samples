DROP TABLE [dbo].[expense-types]
GO

CREATE TABLE [dbo].[expense-types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](200) NULL,
	[icon] [nvarchar](100) NOT NULL
) 

INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Entertainment','This type is perfect for any cost associated with customer of prospect entertainment ','champagne-cheers')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Meals','Use this type when you and peers have working related lunches','table-restaurant')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Lodging','Did you book accommodation while traveling for business, this is the best category to select','hotel-bedroom-1')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Home Internet','This category can be used if you a home internet allowance','House-signal')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Travel','This can include Flights, Uber, Lift, cab, bus and any other types of transport','Plane')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Hardware','Any hardware related purchases','chip')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Software','Any software related purchases','database')
INSERT INTO [dbo].[expense-types] ([name],[description],[icon]) VALUES ('Training','Any work related training courses','pencil-write')

SELECT * FROM[dbo].[expense-types]