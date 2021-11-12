CREATE OR ALTER PROCEDURE [dbo].[sp_updateuser]
    @email NVARCHAR (100),
    @department NVARCHAR (100),
    @office NVARCHAR (100),
    @currency NVARCHAR(100)
AS
SET NOCOUNT ON;

    IF EXISTS
        (SELECT * FROM [dbo].[users] WHERE [email] = @email)
    BEGIN
        UPDATE [dbo].[users] SET [department] = @department, [office] = @office, [currency] = @currency WHERE [email] = @email
    END
ELSE
    BEGIN
        INSERT INTO [dbo].[users] ([email],[department],[office],[currency]) VALUES (@email, @department, @office, @currency)
    END

GO

EXEC sp_updateuser 'renier@jigx.com', 'Development','USA','USD'

SELECT * FROM [dbo].[users]
