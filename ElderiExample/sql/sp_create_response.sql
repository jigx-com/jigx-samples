SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE [dbo].[sp_create_response]
GO
CREATE PROCEDURE [dbo].[sp_create_response]
(
      @id UNIQUEIDENTIFIER,
	  @playerID nvarchar(100),
	  @matchID nvarchar(100),
	  @response nvarchar(50),
	  @comment nvarchar(200),
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- -- Create the order header
	-- DECLARE @orderid uniqueidentifier
	-- DECLARE @customerid UNIQUEIDENTIFIER
	-- DECLARE @ordertotal money
	-- DECLARE @lineitemtotal money
	-- DECLARE @discountvalue money
	-- DECLARE @ordercreated int

	-- execute sp_get_customer_from_auth 'dennis@dvta.uk' , @customerid OUTPUT
	-- IF (@promotionid is NULL or @customerid is NULL)
	-- BEGIN
	--   insert into debug VALUES(@promotionid , @customerid , convert(varchar, GETDATE()))
	--   select id = '85009a9d-3e43-48da-8819-3d489ad27fbc'
	--   RETURN
	-- END


	--IF NOT EXISTS ( SELECT 1 FROM CustomerOrder WHERE promotion_id = @promotionid AND customer_id = @customerid )
	BEGIN
    	select @id = NEWID()
		insert into availability (id, playerID, matchID, response, comment) values (@id , @playerID, @matchID, @response, @comment)
	--	insert into OrderDetail (order_id , product_id ,quantity,  price , discount , line_item_total) SELECT @orderid , product_id , 1, product_price  , promotion_discount , ((1 * product_price) - (promotion_discount * (1 * product_price))) from PromotionItem , Product where PromotionItem.product_id = Product.id and PromotionItem.promotion_id = @promotionid
	
		-- -- Calculate the various totals and update the CustomerOrder table
		-- select @ordertotal = sum(quantity * price) from Product , OrderDetail where OrderDetail.product_id = Product.id and order_id = @orderid
		-- select @lineitemtotal = sum(line_item_total) from OrderDetail where order_id = @orderid
		-- select @discountvalue = @ordertotal - @lineitemtotal
		-- update CustomerOrder  set order_subtotal=@ordertotal , order_discount_value=@discountvalue , order_total=@lineitemtotal where id = @orderid
	END
-- select id from availability where promotion_id = @promotionid AND customer_id = @customerid
END

GO
