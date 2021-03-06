
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WO_RetBonusGiveBonus]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- detect retention days
	declare @out_RetDays int
	exec WO_RetBonusFN_CheckDays @in_CustomerID, @out_RetDays out
	if(@out_RetDays = 0) begin
		select 6 as ResultCode, '0 retention days' as ResultMsg
		return
	end

	-- get bonus 	
	declare @Bonus int = 0
	select @Bonus=Bonus from DataRetentionBonuses where [Day]=@out_RetDays
	if(@@ROWCOUNT = 0) begin
		-- we're in end of retention list
		select top(1) @Bonus=Bonus from DataRetentionBonuses order by [Day] desc
	end

	-- give it and remember last given time	
	exec FN_AlterUserGP @in_CustomerID, @Bonus, 'RetBonus'
	update LoginID set lastRetBonusDate=GETDATE() where CustomerID=@in_CustomerID

	-- and record that
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'RetBonus', 2004, GETDATE(), 
				@Bonus, '1', 'APPROVED', @out_RetDays)

	select 0 as ResultCode

	select GamePoints as 'Balance' from LoginID where CustomerID=@in_CustomerID
	return
END
GO
