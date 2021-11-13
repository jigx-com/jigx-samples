CREATE OR ALTER PROCEDURE [dbo].[sp_updateuser]
    @id INT,
    @email NVARCHAR (100),
    @department NVARCHAR (100),
    @office NVARCHAR (100),
    @currency NVARCHAR(100)
AS
SET NOCOUNT ON;

IF EXISTS
        (SELECT * FROM [dbo].[users] WHERE [id] = @id)
    BEGIN
        UPDATE [dbo].[users] SET [department] = @department, [office] = @office, [currency] = @currency WHERE [id] = @id
    END
ELSE
    BEGIN
        INSERT INTO [dbo].[users] ([email],[department],[office],[currency]) VALUES (@email, @department, @office, @currency)
    END

GO

EXEC sp_updateuser '1', 'renier@jigx.com', 'Development','USA','USD'

SELECT * FROM [dbo].[users]
