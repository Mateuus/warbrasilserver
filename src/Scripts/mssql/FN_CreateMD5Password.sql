USE [gameid_v1]
GO
/****** Object:  StoredProcedure [dbo].[FN_CreateMD5Password]    Script Date: 05/05/2011 23:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FN_CreateMD5Password]
	@in_Password varchar(100),
	@out_MD5 varchar(32) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	declare @PASSWORD_SALT varchar(100) = 'F45sdfv5s'
	set @out_MD5 = SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5', @PASSWORD_SALT + @in_Password)), 3, 999)
END
