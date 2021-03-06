USE [WarInc]
GO
/****** Object:  StoredProcedure [dbo].[DB_BackupDatabase]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DB_BackupDatabase]   
AS  
BEGIN  
	SET NOCOUNT ON;  

	declare @databaseName sysname = 'gameid_v1'
	declare @sqlCommand NVARCHAR(1000)
	declare @dateTime NVARCHAR(20)

	SELECT @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') +
	REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')

	SET @sqlCommand = 'BACKUP DATABASE ' + @databaseName +
		' TO DISK = ''C:\SQL_Backup\' + @databaseName + '_Full_' + @dateTime + '.BAK'''
         
	select @sqlCommand
	EXECUTE sp_executesql @sqlCommand
END
GO
/****** Object:  Table [dbo].[DataSkillPrice]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSkillPrice](
	[Lv1] [int] NOT NULL,
	[Lv2] [int] NOT NULL,
	[Lv3] [int] NOT NULL,
	[Lv4] [int] NOT NULL,
	[Lv5] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSkill2Price]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSkill2Price](
	[SkillID] [int] NOT NULL,
	[SkillName] [varchar](64) NULL,
	[Lv1] [int] NULL,
	[Lv2] [int] NULL,
	[Lv3] [int] NULL,
	[Lv4] [int] NULL,
	[Lv5] [int] NULL,
 CONSTRAINT [PK_DataSkill2Price] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataRetentionBonuses]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataRetentionBonuses](
	[Day] [int] NOT NULL,
	[Bonus] [int] NOT NULL,
 CONSTRAINT [PK_DataRetentionBonuses] PRIMARY KEY CLUSTERED 
(
	[Day] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataRankPoints]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataRankPoints](
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataGameRewards]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataGameRewards](
	[RewardID] [int] NOT NULL,
	[RewardName] [nvarchar](128) NOT NULL,
	[GD_CQ] [int] NOT NULL,
	[HP_CQ] [int] NOT NULL,
	[GD_DM] [int] NOT NULL,
	[HP_DM] [int] NOT NULL,
	[GD_SB] [int] NOT NULL,
	[HP_SB] [int] NOT NULL,
 CONSTRAINT [PK_DataGameRewards] PRIMARY KEY CLUSTERED 
(
	[RewardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataCountryCodes]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataCountryCodes](
	[CountryCode] [char](2) NOT NULL,
	[CountryName] [nchar](256) NULL,
 CONSTRAINT [PK_DataCountryCodes] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataClanXP]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataClanXP](
	[ClanLevel] [int] NOT NULL,
	[ClanXP] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataAbilityPrice]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataAbilityPrice](
	[Lv1] [int] NOT NULL,
	[Lv2] [int] NOT NULL,
	[Lv3] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons2CustomerMap]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons2CustomerMap](
	[CouponID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[UseTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons2]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons2](
	[CouponCode] [varchar](32) NOT NULL,
	[IsUsed] [int] NULL,
	[CustomerID] [int] NULL,
	[Team] [int] NULL,
	[MultiUse] [int] NULL,
 CONSTRAINT [PK_CouponsPAX2011] PRIMARY KEY CLUSTERED 
(
	[CouponCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClanInvites]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanInvites](
	[ClanInviteID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[InviterID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ClanInvites] PRIMARY KEY CLUSTERED 
(
	[ClanInviteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanEvents]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanEvents](
	[ClanEventID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[EventType] [int] NOT NULL,
	[EventRank] [int] NOT NULL,
	[Var1] [int] NOT NULL,
	[Var2] [int] NOT NULL,
	[Var3] [int] NOT NULL,
	[Var4] [int] NOT NULL,
	[Text1] [nvarchar](64) NULL,
	[Text2] [nvarchar](64) NULL,
	[Text3] [nvarchar](256) NULL,
 CONSTRAINT [PK_ClanEvents] PRIMARY KEY CLUSTERED 
(
	[ClanEventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanData]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanData](
	[ClanID] [int] IDENTITY(1472,1) NOT NULL,
	[ClanName] [nvarchar](64) NOT NULL,
	[ClanNameColor] [int] NOT NULL,
	[ClanTag] [nvarchar](4) NOT NULL,
	[ClanTagColor] [int] NOT NULL,
	[ClanEmblemID] [int] NOT NULL,
	[ClanEmblemColor] [int] NOT NULL,
	[ClanXP] [int] NOT NULL,
	[ClanLevel] [int] NOT NULL,
	[ClanGP] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[MaxClanMembers] [int] NOT NULL,
	[NumClanMembers] [int] NOT NULL,
	[ClanLore] [nvarchar](512) NULL,
	[Announcement] [nvarchar](512) NULL,
	[ClanCreateDate] [datetime] NULL,
 CONSTRAINT [PK_ClanData] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanApplications]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanApplications](
	[ClanApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
	[ApplicationText] [nvarchar](500) NOT NULL,
	[IsProcessed] [int] NOT NULL,
 CONSTRAINT [PK_ClanApplications] PRIMARY KEY CLUSTERED 
(
	[ClanApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheatLog]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheatLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [bigint] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CheatID] [int] NOT NULL,
	[ReportTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CheatLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmazonShop]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmazonShop](
	[SKU] [varchar](256) NOT NULL,
	[IsEnabled] [int] NOT NULL,
	[PriceUSD_For_Log] [float] NOT NULL,
	[ItemNote] [varchar](256) NULL,
 CONSTRAINT [PK_AmazonShop] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmazonPurchases]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmazonPurchases](
	[PurchaseIdentity] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [varchar](128) NOT NULL,
	[CustomerID] [int] NULL,
	[PurchaseTime] [datetime] NULL,
	[SKU] [varchar](32) NULL,
	[IsRevoked] [int] NULL,
 CONSTRAINT [PK_AmazonPurchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseIdentity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmazonMessages]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmazonMessages](
	[MessageIdentity] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [varchar](128) NOT NULL,
	[MessageBody] [varchar](256) NULL,
	[MessageTime] [datetime] NULL,
 CONSTRAINT [PK_AmazonMessages] PRIMARY KEY CLUSTERED 
(
	[MessageIdentity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[CustomerID] [int] NOT NULL,
	[AchID] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[Unlocked] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountPwdReset]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountPwdReset](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[IP] [varchar](64) NOT NULL,
	[token] [varchar](32) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[email] [varchar](128) NOT NULL,
 CONSTRAINT [PK_AccountPasswordReset] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[CustomerID] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[firstname] [varchar](16) NOT NULL,
	[lastname] [varchar](16) NOT NULL,
	[sex] [int] NOT NULL,
	[dob] [datetime] NOT NULL,
	[street] [char](32) NOT NULL,
	[city] [char](16) NOT NULL,
	[state] [char](2) NOT NULL,
	[postalcode] [varchar](16) NULL,
	[Country] [char](2) NOT NULL,
	[phone] [char](14) NOT NULL,
	[OptOut1] [int] NOT NULL,
	[admin_note] [varchar](255) NULL,
	[NumReferrals] [int] NULL,
	[GeoCode] [char](2) NULL,
 CONSTRAINT [PK_AccountInfo] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinancialTransactions]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinancialTransactions](
	[CustomerID] [int] NOT NULL,
	[TransactionID] [varchar](64) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[ResponseCode] [varchar](64) NOT NULL,
	[AprovalCode] [varchar](16) NOT NULL,
	[ItemID] [varchar](32) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinancialBlocks]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialBlocks](
	[CustomerID] [int] NOT NULL,
	[LastBlockedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_FinancialBlocks] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_WOAdminChanges]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_WOAdminChanges](
	[ChangeID] [int] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime] NULL,
	[UserName] [nvarchar](64) NULL,
	[Action] [int] NULL,
	[Field] [varchar](512) NULL,
	[RecordID] [int] NULL,
	[OldValue] [varchar](2048) NULL,
	[NewValue] [varchar](2048) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_UserRoundResults]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_UserRoundResults](
	[IP] [varchar](32) NOT NULL,
	[GameSessionID] [bigint] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[GamePoints] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[SkillPoints] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHits] [int] NOT NULL,
	[Headshots] [int] NOT NULL,
	[AssistKills] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[CaptureNeutralPoints] [int] NOT NULL,
	[CaptureEnemyPoints] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[GameReportTime] [datetime] NOT NULL,
	[GameDollars] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[MapID] [int] NOT NULL,
	[MapType] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_SrvLogInfo]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_SrvLogInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReportTime] [datetime] NULL,
	[IsProcessed] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerIP] [varchar](64) NULL,
	[GameSessionID] [bigint] NULL,
	[CheatID] [int] NULL,
	[RepeatCount] [int] NULL,
	[Msg] [varchar](512) NULL,
	[Data] [varchar](4096) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_SQLHacks]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_SQLHacks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[IP] [varchar](32) NOT NULL,
	[Query] [varchar](1024) NOT NULL,
	[StoredProc] [varchar](32) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_SMSCallbacks]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_SMSCallbacks](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[data] [varchar](4096) NOT NULL,
 CONSTRAINT [PK_DBG_SMSCallbacks] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_RefPixelLog]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_RefPixelLog](
	[CustomerID] [int] NOT NULL,
	[ReferralID] [int] NOT NULL,
	[PixelUrl] [varchar](128) NOT NULL,
	[PixelCallTime] [datetime] NOT NULL,
	[ErrorMsg] [varchar](128) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_ReferredEvents]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_ReferredEvents](
	[CustomerID] [int] NOT NULL,
	[InvitedID] [int] NOT NULL,
	[LevelUpTime] [datetime] NOT NULL,
	[NumReferrers] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_LootRewards]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_LootRewards](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReportTime] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Roll] [float] NOT NULL,
	[LootID] [float] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ExpDays] [int] NOT NULL,
	[GD] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_LevelUpEvents]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_LevelUpEvents](
	[CustomerID] [int] NULL,
	[LevelGained] [int] NULL,
	[ReportTime] [datetime] NULL,
	[SessionID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_HWInfo]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_HWInfo](
	[ComputerID] [bigint] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ReportDate] [datetime] NOT NULL,
	[CPUName] [varchar](32) NOT NULL,
	[CPUBrand] [varchar](64) NOT NULL,
	[CPUFreq] [int] NOT NULL,
	[TotalMemory] [int] NOT NULL,
	[DisplayW] [int] NOT NULL,
	[DisplayH] [int] NOT NULL,
	[gfxErrors] [int] NOT NULL,
	[gfxVendorId] [int] NOT NULL,
	[gfxDeviceId] [int] NOT NULL,
	[gfxDescription] [varchar](128) NOT NULL,
	[OSVersion] [varchar](32) NOT NULL,
 CONSTRAINT [PK_DBG_HWInfo_1] PRIMARY KEY CLUSTERED 
(
	[ComputerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_GPTransactions]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_GPTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[TransactionTime] [datetime] NULL,
	[Amount] [int] NULL,
	[Reason] [varchar](64) NULL,
	[Previous] [int] NULL,
 CONSTRAINT [PK_DBG_GPTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfileData]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfileData](
	[CustomerID] [int] NOT NULL,
	[Skills] [char](10) NOT NULL,
	[Achievements] [char](256) NOT NULL,
	[Abilities] [char](256) NOT NULL,
 CONSTRAINT [PK_ProfileData] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profile_Chars]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profile_Chars](
	[LoadoutID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Class] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[Loadout] [varchar](256) NOT NULL,
	[Skills] [char](31) NOT NULL,
	[SpendSP1] [int] NOT NULL,
	[SpendSP2] [int] NOT NULL,
	[SpendSP3] [int] NOT NULL,
 CONSTRAINT [PK_Profile_Loadouts2] PRIMARY KEY CLUSTERED 
(
	[LoadoutID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MatomyUserMap]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MatomyUserMap](
	[CustomerID] [int] NOT NULL,
	[ce_pub] [varchar](32) NULL,
	[ce_cid] [varchar](64) NULL,
	[DateRegistered] [datetime] NULL,
	[IsConverted] [int] NULL,
	[DateConverted] [datetime] NULL,
 CONSTRAINT [PK_MatomyUserMap] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterServerInfo]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterServerInfo](
	[ServerID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[CreateGameKey] [int] NOT NULL,
	[IP] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MasterServerInfo] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginSessions]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginSessions](
	[CustomerID] [int] NOT NULL,
	[SessionKey] [varchar](50) NOT NULL,
	[SessionID] [int] NOT NULL,
	[LoginIP] [varchar](16) NOT NULL,
	[TimeLogged] [datetime] NOT NULL,
	[TimeUpdated] [datetime] NOT NULL,
	[GameSessionID] [bigint] NOT NULL,
 CONSTRAINT [PK_LoginSessions] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logins](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[IP] [varchar](16) NOT NULL,
	[LoginSource] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginID]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginID](
	[CustomerID] [int] IDENTITY(1288037000,1) NOT NULL,
	[AccountName] [varchar](32) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[AccountStatus] [int] NOT NULL,
	[GamePoints] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[SkillPoints] [int] NOT NULL,
	[Gamertag] [nvarchar](32) NOT NULL,
	[dateregistered] [datetime] NOT NULL,
	[lastlogindate] [datetime] NOT NULL,
	[lastloginIP] [varchar](16) NOT NULL,
	[lastgamedate] [datetime] NOT NULL,
	[ReferralID] [int] NOT NULL,
	[lastjoineddate] [datetime] NOT NULL,
	[MD5Password] [varchar](32) NOT NULL,
	[ClanID] [int] NOT NULL,
	[GameDollars] [int] NOT NULL,
	[Faction1Score] [int] NOT NULL,
	[Faction2Score] [int] NOT NULL,
	[Faction3Score] [int] NOT NULL,
	[Faction4Score] [int] NOT NULL,
	[Faction5Score] [int] NOT NULL,
	[ClanRank] [int] NOT NULL,
	[lastRetBonusDate] [datetime] NULL,
	[IsFPSEnabled] [int] NOT NULL,
	[reg_sid] [varchar](128) NULL,
	[ClanContributedXP] [int] NOT NULL,
	[ClanContributedGP] [int] NOT NULL,
	[IsDeveloper] [int] NOT NULL,
 CONSTRAINT [PK_LoginID_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Leaderboard7]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard7](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard7] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard30]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard30](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard30] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard1]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard1](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard1] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items_Weapons]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Weapons](
	[ItemID] [int] IDENTITY(101001,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Category] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[MuzzleOffset] [varchar](32) NOT NULL,
	[MuzzleParticle] [varchar](32) NOT NULL,
	[Animation] [varchar](32) NOT NULL,
	[BulletID] [varchar](32) NOT NULL,
	[Sound_Shot] [varchar](255) NOT NULL,
	[Sound_Reload] [varchar](255) NOT NULL,
	[Damage] [float] NOT NULL,
	[isImmediate] [int] NOT NULL,
	[Mass] [float] NOT NULL,
	[Speed] [float] NOT NULL,
	[DamageDecay] [float] NOT NULL,
	[Area] [float] NOT NULL,
	[Delay] [float] NOT NULL,
	[Timeout] [float] NOT NULL,
	[NumClips] [int] NOT NULL,
	[Clipsize] [int] NOT NULL,
	[ReloadTime] [float] NOT NULL,
	[ActiveReloadTick] [float] NOT NULL,
	[RateOfFire] [int] NOT NULL,
	[Spread] [float] NOT NULL,
	[Recoil] [float] NOT NULL,
	[NumGrenades] [int] NOT NULL,
	[GrenadeName] [varchar](32) NOT NULL,
	[Firemode] [varchar](3) NOT NULL,
	[DetectionRadius] [int] NOT NULL,
	[ScopeType] [varchar](32) NOT NULL,
	[ScopeZoom] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[ShotsFired] [bigint] NOT NULL,
	[ShotsHits] [bigint] NOT NULL,
	[KillsCQ] [int] NOT NULL,
	[KillsDM] [int] NOT NULL,
	[KillsSB] [int] NOT NULL,
	[IsUpgradeable] [int] NOT NULL,
	[IsFPS] [int] NOT NULL,
	[FPSSpec0] [int] NOT NULL,
	[FPSSpec1] [int] NOT NULL,
	[FPSSpec2] [int] NOT NULL,
	[FPSSpec3] [int] NOT NULL,
	[FPSSpec4] [int] NOT NULL,
	[FPSSpec5] [int] NOT NULL,
	[FPSSpec6] [int] NOT NULL,
	[FPSSpec7] [int] NOT NULL,
	[FPSSpec8] [int] NOT NULL,
	[FPSAttach0] [int] NOT NULL,
	[FPSAttach1] [int] NOT NULL,
	[FPSAttach2] [int] NOT NULL,
	[FPSAttach3] [int] NOT NULL,
	[FPSAttach4] [int] NOT NULL,
	[FPSAttach5] [int] NOT NULL,
	[FPSAttach6] [int] NOT NULL,
	[FPSAttach7] [int] NOT NULL,
	[FPSAttach8] [int] NOT NULL,
	[AnimPrefix] [varchar](32) NOT NULL,
 CONSTRAINT [PK_Items_Weapons] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_UpgradeData]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_UpgradeData](
	[ItemID] [int] NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Category] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[GPChance] [float] NOT NULL,
	[GDChance] [float] NOT NULL,
	[UpgradeID] [int] NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_Items_UpgradeData] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Items_Up__727E83EA6CE315C2] UNIQUE NONCLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Packages]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Packages](
	[ItemID] [int] IDENTITY(500000,1) NOT NULL,
	[FNAME] [varchar](64) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Category] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[IsEnabled] [int] NOT NULL,
	[AddGP] [int] NOT NULL,
	[AddSP] [int] NOT NULL,
	[Item1_ID] [int] NOT NULL,
	[Item1_Exp] [int] NOT NULL,
	[Item2_ID] [int] NOT NULL,
	[Item2_Exp] [int] NOT NULL,
	[Item3_ID] [int] NOT NULL,
	[Item3_Exp] [int] NOT NULL,
	[Item4_ID] [int] NOT NULL,
	[Item4_Exp] [int] NOT NULL,
	[Item5_ID] [int] NOT NULL,
	[Item5_Exp] [int] NOT NULL,
	[Item6_ID] [int] NOT NULL,
	[Item6_Exp] [int] NOT NULL,
 CONSTRAINT [PK_Items_Package] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_LootData]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_LootData](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[LootID] [int] NOT NULL,
	[Chance] [float] NULL,
	[ItemID] [int] NULL,
	[ExpDaysMin] [int] NULL,
	[ExpDaysMax] [int] NULL,
	[GDMin] [int] NULL,
	[GDMax] [int] NULL,
	[GDIfHave] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items_Generic]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Generic](
	[ItemID] [int] IDENTITY(301000,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Category] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[IsStackable] [int] NOT NULL,
 CONSTRAINT [PK_Items_Generic] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Gear]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Gear](
	[ItemID] [int] IDENTITY(20000,1) NOT NULL,
	[FNAME] [varchar](64) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[Category] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[DamagePerc] [int] NOT NULL,
	[DamageMax] [int] NOT NULL,
	[Bulkiness] [int] NOT NULL,
	[Inaccuracy] [int] NOT NULL,
	[Stealth] [int] NOT NULL,
	[CustomFunction] [int] NOT NULL,
	[Protection] [char](5) NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[ProtectionLevel] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
 CONSTRAINT [PK_Items_Gear] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Attachments]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Attachments](
	[ItemID] [int] IDENTITY(400000,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[MuzzleParticle] [varchar](64) NOT NULL,
	[FireSound] [varchar](256) NOT NULL,
	[Damage] [float] NOT NULL,
	[Range] [float] NOT NULL,
	[Firerate] [float] NOT NULL,
	[Recoil] [float] NOT NULL,
	[Spread] [float] NOT NULL,
	[Clipsize] [int] NOT NULL,
	[ScopeMag] [float] NOT NULL,
	[ScopeType] [varchar](32) NOT NULL,
	[AnimPrefix] [varchar](32) NOT NULL,
	[SpecID] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
 CONSTRAINT [PK_Items_Attachments] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory_FPS]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_FPS](
	[CustomerID] [int] NOT NULL,
	[WeaponID] [int] NOT NULL,
	[AttachmentID] [int] NOT NULL,
	[LeasedUntil] [datetime] NOT NULL,
	[Slot] [int] NOT NULL,
	[IsEquipped] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[CustomerID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[LeasedUntil] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UpSlot1] [int] NOT NULL,
	[UpSlot2] [int] NOT NULL,
	[UpSlot3] [int] NOT NULL,
	[UpSlot4] [int] NOT NULL,
	[UpSlot5] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GamersfirstUserIDMap]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamersfirstUserIDMap](
	[CustomerID] [int] NOT NULL,
	[GamersfirstID] [int] NOT NULL,
 CONSTRAINT [PK_GamersfirstUserIDMap] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendsMap]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendsMap](
	[CustomerID] [int] NULL,
	[FriendID] [int] NULL,
	[FriendStatus] [int] NULL,
	[DateAdded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[WO_FactionAddReward]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FactionAddReward] 
	@in_CustomerID int,
	@in_FactionID int,
	@in_PrevScore int,
	@in_NewScore int
AS
BEGIN
	SET NOCOUNT ON;

	--
	--
	-- this internal function used for adding items based on faction ID and faction score
	--
	--
	
	--SAMPLE:
	--if(@in_FactionID = 1 and @in_PrevScore < 100 and @in_NewScore >= 100) begin
	--	exec FN_AddItemToUser @in_CustomerID, 301001, 7
	--	return
	--end
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ChallengeGetStatus]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ChallengeGetStatus]
AS
BEGIN
	SET NOCOUNT ON;

	declare @StartDate date = '2012-03-16'					-- challenge start
	declare @EndDate   date = dateadd(day, 7, @StartDate)	-- 3 days challenge
	declare @EndPerc   int  = 95							-- target ending percentage of challenge

	declare @IsActive  int  = 1
	if(GETDATE() < @StartDate or GETDATE() > @EndDate)
		set @IsActive = 0

	-- fake linear challenge progression
	declare @Target int = 100
	declare @Current int = DATEDIFF(minute, @StartDate, GETDATE()) * @EndPerc / DATEDIFF(minute, @StartDate, @EndDate)
	
	select
		@IsActive as 'IsActive',
		@StartDate as 'StartDate', 
		@EndDate as 'EndDate', 
		@Target as 'Target', 
		@Current as 'Current'
	
END
GO
/****** Object:  StoredProcedure [dbo].[FN_CreateMD5Password]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_CreateMD5Password]
	@in_Password varchar(100),
	@out_MD5 varchar(32) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	declare @PASSWORD_SALT varchar(100) = 'F45sdfv5s'
	set @out_MD5 = SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5', @PASSWORD_SALT + @in_Password)), 3, 999)
END
GO
/****** Object:  Table [dbo].[VitalStatsV3]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitalStatsV3](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[TotalVisitors] [int] NULL,
	[TotalUsersLogin] [int] NULL,
	[TotalUsersActivated] [int] NULL,
	[TotalUsersJoined] [int] NULL,
	[TotalUsersPlayed] [int] NULL,
	[NewRegistered] [int] NULL,
	[NewActivated] [int] NULL,
	[MAU_Login] [int] NULL,
	[MAU_Joined] [int] NULL,
	[MAU_Played] [int] NULL,
	[DAU_Login] [int] NULL,
	[DAU_Joined] [int] NULL,
	[DAU_Played] [int] NULL,
	[Cash24Num] [int] NULL,
	[Cash24Total] [float] NULL,
	[Cash24Paying] [int] NULL,
	[CashTotal] [float] NULL,
	[CashPaying] [int] NULL,
	[ARPU] [float] NULL,
	[ARPPU] [float] NULL,
	[PlayedToday] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VitalStatsV2]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitalStatsV2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[TotalUsers] [int] NULL,
	[NewUsers] [int] NULL,
	[LoggedIn] [int] NULL,
	[NonActive] [int] NULL,
	[PlayedGame] [int] NULL,
	[CCU] [int] NOT NULL,
	[DAU] [int] NULL,
	[MAU] [int] NULL,
	[ActiveSessions] [int] NULL,
	[CashNum] [int] NULL,
	[CashTotal] [float] NULL,
	[GPNum] [int] NULL,
	[GPTotal] [int] NULL,
	[DAU1] [int] NULL,
	[MAU1] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VitalStats_CCU]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitalStats_CCU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[CCU] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SteamUserIDMap]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SteamUserIDMap](
	[CustomerID] [int] NULL,
	[SteamID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SteamGPShop]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SteamGPShop](
	[SteamGPItemId] [int] IDENTITY(1,1) NOT NULL,
	[IsEnabled] [int] NULL,
	[GP] [int] NULL,
	[BonusGP] [int] NULL,
	[PriceCentsUSD] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SteamGPOrders]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SteamGPOrders](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[SteamID] [bigint] NULL,
	[InitTxnTime] [datetime] NULL,
	[Price] [int] NULL,
	[GP] [int] NULL,
	[ItemCode] [varchar](32) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[CustomerID] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHits] [int] NOT NULL,
	[Headshots] [int] NOT NULL,
	[AssistKills] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[CaptureNeutralPoints] [int] NOT NULL,
	[CaptureEnemyPoints] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[CheatAttempts] [int] NOT NULL,
 CONSTRAINT [PK_Stats] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityLog]    Script Date: 09/05/2014 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecurityLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IP] [varchar](64) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EventData] [varchar](256) NOT NULL,
 CONSTRAINT [PK_SecurityLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[RPT_PayingPerCountry]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RPT_PayingPerCountry]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @StartTime datetime = '4-1-2012'
	declare @EndTime   datetime = '5-12-4000'

	select
		ai.GeoCode,
		COUNT(l.CustomerID) as 'Registered',
		COUNT(distinct(f.CustomerID)) as 'Paying', 
		SUM(f.amount) as 'Profit',
		SUM(f.amount) / COUNT(l.CustomerID) as 'ProfitPerUser',
		COUNT(distinct(f.CustomerID)) * 100.0 / COUNT(l.CustomerID) as 'Registered/Paying %',
		(select CountryName from DataCountryCodes where CountryCode=ai.GeoCode)
	from LoginID l
		join AccountInfo ai on ai.CustomerID=l.CustomerID
		left join FinancialTransactions f on (f.CustomerID=l.CustomerID and TransactionType=1000)
	where dateregistered>=@StartTime and dateregistered<=@EndTime
	group by ai.GeoCode
	order by SUM(f.amount) desc
	
END
GO
/****** Object:  StoredProcedure [dbo].[FN_AlterUserGP]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AlterUserGP]
	@in_CustomerID int,
	@in_GP int,
	@in_Reason varchar(64)
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_GP = 0)
		return
		
	declare @GamePoints int = 0
	select @GamePoints=GamePoints from LoginID where CustomerID=@in_CustomerID

	insert into DBG_GPTransactions (
		CustomerID,
		TransactionTime,
		Amount,
		Reason,
		Previous
	) values (
		@in_CustomerID,
		GETDATE(),
		@in_GP,
		@in_Reason,
		@GamePoints
	)
	
	update LoginID set GamePoints=(GamePoints + @in_GP) where CustomerID=@in_CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddItemToUserInMin]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddItemToUserInMin]
	@in_CustomerID int,
	@in_ItemId int,
	@in_ExpMin int
AS
BEGIN
	SET NOCOUNT ON;

	declare @LeasedUntil datetime
	declare @CurDate datetime = GETDATE()
       
	select @LeasedUntil=LeasedUntil from Inventory where (ItemID=@in_ItemId and CustomerID=@in_CustomerID)
	if(@@ROWCOUNT = 0) 
	begin
		INSERT INTO Inventory (
			CustomerID, 
			ItemID, 
			LeasedUntil, 
			Quantity
		)
		VALUES (
			@in_CustomerID,
			@in_ItemId,
			DATEADD(minute, @in_ExpMin, @CurDate),
			1
		)
		return
	end
       
	if(@LeasedUntil < @CurDate)
		set @LeasedUntil = DATEADD(minute, @in_ExpMin, @CurDate)
	else
		set @LeasedUntil = DATEADD(minute, @in_ExpMin, @LeasedUntil)
		
	if(@LeasedUntil > '2020-1-1')
		set @LeasedUntil = '2020-1-1'

	UPDATE Inventory SET 
		LeasedUntil=@LeasedUntil
	WHERE ItemID=@in_ItemId and CustomerID=@in_CustomerID
       
	-- set if we need to increase item quantity
	declare @IsStackable int = 0
	select @IsStackable=IsStackable from Items_Generic where ItemID=@in_ItemId
	if(@@ROWCOUNT > 0 and @IsStackable > 0) 
	begin
		update Inventory set Quantity=Quantity+1 
			where ItemID=@in_ItemId and CustomerID=@in_CustomerID
	end
END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_AddClanMembers]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_AddClanMembers]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_ItemID int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- function must be called from WO_BuyItemFN_Exec
	--
	--

	-- add members value is in 1day GP price
	declare @Price1 int = 0
	select @Price1=Price1 from Items_Generic where ItemID=@in_ItemID
	if(@Price1 = 0) begin
		set @out_FNResult = 1
		return
	end
	
	-- check if user have clan
	declare @ClanID int = 0
	declare @Gamertag nvarchar(32)
	select @ClanID=ClanID, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		set @out_FNResult = 2
		return
	end
	
	-- update clan
	update ClanData set MaxClanMembers=(MaxClanMembers+@Price1) where ClanID=@ClanID
	
	-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		13, -- ClanEvent_AddMaxMembers
		99, -- Visible to all
		@in_CustomerID,
		@Price1,
		@Gamertag
	)
	
	-- success
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[WO_AMAZON_RevokePurchase]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_AMAZON_RevokePurchase]
	@in_PurchaseId varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode
	
	-- search for transaction
	declare @CustomerID int = 0
	declare @IsRevoked int = 0
	select @CustomerID=CustomerID, @IsRevoked=IsRevoked from AmazonPurchases where PurchaseId=@in_PurchaseId
	if(@@ROWCOUNT = 0) begin
		select 'FAILURE_PURCHASE_INVALID' as 'Status';
		return
	end
	if(@IsRevoked > 0) begin
		select 'FAILURE_ALREADY_REVOKED' as 'Status';
		return
	end

	update AmazonPurchases set IsRevoked=1 where PurchaseId=@in_PurchaseId
	
	-- and ban that sucker
	update LoginID set AccountStatus=200 where CustomerID=@CustomerID
	update AccountInfo set admin_note=admin_note+' AmazonRevoke' where CustomerID=@CustomerID

	select 'SUCCESS' as 'Status';
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_AMAZON_LogMessage]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_AMAZON_LogMessage]
	@in_MessageId varchar(128),
	@in_MessageBody varchar(512)
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode
	
	if(exists(select * from AmazonMessages where MessageId=@in_MessageId)) begin
		select 'FAILURE_UNKNOWN' as 'Status'
		return
	end
	
	insert into AmazonMessages 	(
		MessageId,
		MessageBody,
		MessageTime
		) values (
		@in_MessageId, 
		@in_MessageBody,
		GETDATE()
		)

	select 'SUCCESS' as 'Status';
	return;
END
GO
/****** Object:  StoredProcedure [dbo].[WO_AMAZON_GetAddresses]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_AMAZON_GetAddresses]
	@in_AccountToken varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	declare @CustomerID int = 0
	declare @AccountStatus int = 0
	declare @AccountName varchar(128) = ''

	-- this call is always valid
	select 0 as ResultCode
	
	if(ISNUMERIC(@in_AccountToken) = 1)
	begin
		select 
			@CustomerID=CustomerID, 
			@AccountStatus=@AccountStatus,
			@AccountName=AccountName
			from LoginID where CustomerID=@in_AccountToken
	end
	
	select @CustomerID as 'CustomerID', @AccountStatus as 'AccountStatus', @AccountName as 'AccountName'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_AMAZON_CheckSKU]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_AMAZON_CheckSKU]
	@in_Address varchar(128),
	@in_SKU varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode
	
	-- need for amazon sandbox test
	if(@in_Address <> 'AMZNTESTVALIDADDRESS') 
	begin
		-- check if address is valid
		if(ISNUMERIC(@in_Address) <> 1) begin
			select 'FAILURE_ADDRESS_INVALID' as 'Status';
			return
		end
		if(not exists(select CustomerID from LoginID where CustomerID=@in_Address)) begin
			select 'FAILURE_ADDRESS_INVALID' as 'Status';
			return
		end
	end
	
	-- need for amazon sandbox test
	if(@in_SKU = 'AMZNTESTINELIGIBLESKU') begin
		select 'FAILURE_ADDRESS_NOT_ELIGIBLE' as 'Status';
		return
	end

	-- check for actual SKU
	declare @IsEnabled int = 0
	select @IsEnabled=IsEnabled from AmazonShop where SKU=@in_SKU
	if(@@ROWCOUNT = 0) begin
		select 'FAILURE_SKU_INVALID' as 'Status';
		return
	end

	if(@IsEnabled = 0) begin
		select 'FAILURE_SKU_DISABLED' as 'Status';
		return
	end
	
	select 'SUCCESS' as 'Status';
END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_UnlearnSkills]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_UnlearnSkills]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_ExecRefund int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- get SkillPoints for that customer
	declare @SkillPoints int
	SELECT @SkillPoints=SkillPoints FROM LoginID WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		set @out_FNResult = 6
		return
	end
	
	-- get player skills as string
	declare @DataString char(256)
	SELECT @DataString=Skills from ProfileData where CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		set @out_FNResult = 6
		return
	end

--
-- push invididual skill values to temporary table
--
	declare @t_skills table (
		sv varchar(1)
	) 
	
	declare @MAX_SKILL_ID int = 10
	declare @SkillId int = 1
	while(@SkillId <= @MAX_SKILL_ID) 
	begin
		declare @sv char(1) = SUBSTRING(@DataString, @SkillId, 1)
		-- fix bad skill value
		if(@sv < '0' or @sv > '5') set @sv = '0';

		insert into @t_skills values(@sv)
		set @SkillId = @SkillId + 1
	end
	
--
-- grab skill cost
--
	declare @COST_LV1 int
	declare @COST_LV2 int
	declare @COST_LV3 int
	declare @COST_LV4 int
	declare @COST_LV5 int
	select
		@COST_LV1=Lv1,
		@COST_LV2=Lv2,
		@COST_LV3=Lv3,
		@COST_LV4=Lv4,
		@COST_LV5=Lv5
	from DataSkillPrice

	--some debug crap
	--select * from DataSkillPrice
	--select @DataString
	--select * from @t_skills

--
-- iterate for each skill value and refund SP
--	
	declare @TotalSP int = 0

	DECLARE t_skills_Cursor CURSOR FOR SELECT * from @t_skills
	OPEN t_skills_Cursor
	FETCH NEXT FROM t_skills_Cursor into @sv
	while @@FETCH_STATUS = 0 
	begin
		if(@sv = '1')      set @TotalSP = @TotalSP + @COST_LV1
		else if(@sv = '2') set @TotalSP = @TotalSP + @COST_LV1 + @COST_LV2
		else if(@sv = '3') set @TotalSP = @TotalSP + @COST_LV1 + @COST_LV2 + @COST_LV3
		else if(@sv = '4') set @TotalSP = @TotalSP + @COST_LV1 + @COST_LV2 + @COST_LV3 + @COST_LV4
		else if(@sv = '5') set @TotalSP = @TotalSP + @COST_LV1 + @COST_LV2 + @COST_LV3 + @COST_LV4 + @COST_LV5

		FETCH NEXT FROM t_skills_Cursor into @sv
	end
	CLOSE t_skills_Cursor
	DEALLOCATE t_skills_Cursor

	-- actually execute refund
	if(@in_ExecRefund > 0) begin
		update LoginID set SkillPoints=(SkillPoints+@TotalSP) where CustomerID=@in_CustomerID
		update ProfileData set Skills='0000000000' where CustomerID=@in_CustomerID
	end
	
	set @out_FNResult = 0
END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_GetPrice]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_GetPrice]
    @out_FNResult int out,
	@in_ItemId int,
	@in_BuyDays int,
	@in_Currency varchar(32),
	@o_FinalPrice int out
AS
BEGIN
	SET NOCOUNT ON;
	
--
-- get prices from table based on itemID
--
	declare @Price1 int = 0
	declare @Price7 int = 0
	declare @Price30 int = 0
	declare @PriceP int = 0
	declare @GPrice1 int = 0
	declare @GPrice7 int = 0
	declare @GPrice30 int = 0
	declare @GPriceP int = 0
	declare @IsEnabled int = 1

	if(@in_ItemId >= 20000 and @in_ItemId < 99999)
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Gear where ItemID=@in_ItemID
	else
	if(@in_ItemId >= 100000 and @in_ItemId < 190000)
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Weapons where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 300000 and @in_ItemId < 390000) 
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Generic where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 400000 and @in_ItemId < 490000) 
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Attachments where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 500000 and @in_ItemId < 590000) 
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP,
		   @IsEnabled=IsEnabled
		FROM Items_Packages where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 600000 and @in_ItemId < 699999) 
		SELECT
		   @PriceP=PriceP, 
		   @GPriceP=GPriceP
		FROM Items_UpgradeData where ItemID=@in_ItemID
	else 
	begin
		set @out_FNResult = 1
		return
	end
	if (@@RowCount = 0) begin
		set @out_FNResult = 2
		return
	end
	
	     if(@in_Currency = 'GP' and @in_BuyDays = 1)    set @o_FinalPrice = @Price1
	else if(@in_Currency = 'GP' and @in_BuyDays = 7)    set @o_FinalPrice = @Price7
	else if(@in_Currency = 'GP' and @in_BuyDays = 30)   set @o_FinalPrice = @Price30
	else if(@in_Currency = 'GP' and @in_BuyDays = 2000) set @o_FinalPrice = @PriceP
	else if(@in_Currency = 'GD' and @in_BuyDays = 1)    set @o_FinalPrice = @GPrice1
	else if(@in_Currency = 'GD' and @in_BuyDays = 7)    set @o_FinalPrice = @GPrice7
	else if(@in_Currency = 'GD' and @in_BuyDays = 30)   set @o_FinalPrice = @GPrice30
	else if(@in_Currency = 'GD' and @in_BuyDays = 2000) set @o_FinalPrice = @GPriceP
	else begin
		set @out_FNResult = 3
		return
	end

	-- check if listed
	if(@o_FinalPrice <= 0 or @IsEnabled = 0) begin
		set @out_FNResult = 4
		return
	end
	
	set @out_FNResult = 0
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanKickMember]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanKickMember]
	@in_CustomerID int,
	@in_MemberID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	if(@in_CustomerID = @in_MemberID) begin
		select 6 as 'ResultCode', 'cant kick himselft' as 'ResultMsg'
		return
	end

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	declare @MemberClanRank int
	select @MemberClanID=ClanID, @MemberClanRank=ClanRank, @MemberGamerTag=GamerTag from LoginID where CustomerID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- validate that we can kick

	-- only leader and officers can kick
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- cant kick higher rank
	if(@ClanRank > 0 and @ClanRank >= @MemberClanRank) begin
		select 6 as ResultCode, 'cant kick highter rank' as ResultMsg
		return
	end
	
-- update clan info and kick player
	update ClanData set NumClanMembers=(NumClanMembers-1) where ClanID=@ClanID
	update LoginID set ClanID=0, ClanContributedGP=0, ClanContributedXP=0 where CustomerID=@in_MemberID
	
-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		6, -- CLANEvent_Kick
		99, -- Visible to all
		@in_CustomerID,
		@in_MemberID,
		@Gamertag,
		@MemberGamertag
	)
	
	-- TODO: send message to player about kick
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanInviteSendToPlayer]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanInviteSendToPlayer]
	@in_CustomerID int,
	@in_InvGamertag nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	declare @INVITE_EXPIRE_TIME_HOURS int = 80
	
-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end
	
-- validate that we can invite

	-- only leader and officers can invite
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	
	declare @PendingInvites int = 0
	--DISABLED FOR NOW: select @PendingInvites=COUNT(*) from ClanInvites where ClanID=@ClanID and GETDATE()<ExpireTime
	if((@NumClanMembers + @PendingInvites) >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end

	-- check if user exists	
	declare @InvCustomerID int
	declare @InvClanID int
	select @InvCustomerID=CustomerID, @InvClanID=ClanID from LoginID where Gamertag=@in_InvGamertag
	if(@@ROWCOUNT = 0) begin
		select 22 as ResultCode, 'no such gamertag' as ResultMsg
		return
	end
	-- and have no clan
	if(@InvClanID <> 0) begin
		select 21 as ResultCode, 'already in clan' as ResultMsg
		return
	end
	
	-- check if we have pending invite
	if(exists(select * from ClanInvites where ClanID=@ClanID and CustomerID=@InvCustomerID and GETDATE()<ExpireTime)) begin
		select 24 as ResultCode, 'already invited' as ResultMsg
		return
	end
	
-- invite
	insert into ClanInvites (
		ClanID,
		InviterID,
		CustomerID,
		ExpireTime
	) values (
		@ClanID,
		@in_CustomerID,
		@InvCustomerID,
		DATEADD(hour, @INVITE_EXPIRE_TIME_HOURS, GETDATE())
	)

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanInviteReportAll]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanInviteReportAll]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- validate that we can invite

	-- only leader and officers can invite
	if(@ClanRank > 1) begin
		select 6 as ResultCode, 'no permission' as ResultMsg
		return
	end

-- report all pending invites

	-- success
	select 0 as ResultCode
	
	select 
		i.ClanInviteID, 
		l.Gamertag, 
		DATEDIFF(mi, GETDATE(), i.ExpireTime) as MinutesLeft
	from ClanInvites i
	join LoginID l on (l.CustomerID=i.CustomerID)
	where i.ClanID=@ClanID and GETDATE()<ExpireTime
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanInviteGetInvitesForPlayer]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanInviteGetInvitesForPlayer]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

-- report all pending invites

	select 0 as ResultCode
	
	select 
		i.ClanInviteID,
		l.Gamertag, 
		c.*
	from ClanInvites i
	join LoginID l on (l.CustomerID=i.InviterID)
	join ClanData c on (c.ClanID=i.ClanID)
	where i.CustomerID=@in_CustomerID and GETDATE()<ExpireTime
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanInviteAnswer]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanInviteAnswer]
	@in_CustomerID int,
	@in_ClanInviteID int,
	@in_Answer int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- must be free to join clan
	declare @ClanID int = 0
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID <> 0) begin
		select 6 as ResultCode, 'already in clan' as ResultMsg
		return
	end
	
	-- have valid invitation id (get actual ClanID here)
	declare @InvCustomerID int
	select @ClanID=ClanID, @InvCustomerID=CustomerID from ClanInvites where ClanInviteID=@in_ClanInviteID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'bad inviteid #1' as ResultMsg
		return
	end
	if(@InvCustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad inviteid #2' as ResultMsg
		return
	end

-- invite

	-- delete invite anyway
	delete from ClanInvites where ClanInviteID=@in_ClanInviteID
	
	-- check if invite is denied
	if(@in_Answer = 0) begin
		select 0 as ResultCode
		select @ClanID as ClanID
		return
	end

	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	if(@NumClanMembers >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end
	
	-- join the clan!
	update ClanData set NumClanMembers=(NumClanMembers + 1) where ClanID=@ClanID
	update LoginID set ClanID=@ClanID, ClanRank=99 where CustomerID=@in_CustomerID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		4, -- CLANEvent_Join
		99, -- Visible to officers
		@in_CustomerID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
	select @ClanID as ClanID
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanGetPlayerData]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanGetPlayerData]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- success
	select 0 as ResultCode
	
	-- report player clan id and current clan info
	select l.ClanID, ClanRank, cd.*
		from LoginID l
		left join ClanData cd on cd.ClanID=l.ClanID
		where CustomerID=@in_CustomerID

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanGetInfo]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanGetInfo]
	@in_ClanID int,
	@in_GetMembers int
AS
BEGIN
	SET NOCOUNT ON;

	-- success
	select 0 as ResultCode
	
	-- and report clan data
	if(@in_ClanID > 0)
		select *, LoginID.gamertag from ClanData 
			left join LoginID on loginid.customerid=ClanData.OwnerID
			where ClanData.ClanID=@in_ClanID
	else
		select *, LoginID.gamertag from ClanData
			left join LoginID on loginid.customerid=ClanData.OwnerID
		
	-- if need to report members
	if(@in_ClanID > 0 and @in_GetMembers > 0) begin
		select LoginID.*, Stats.* 
			from LoginID
			join Stats on Stats.CustomerID=LoginID.CustomerID
			where ClanID=@in_ClanID
	end

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanGetEvents]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanGetEvents]
	@in_CustomerID int,
	@in_Days int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- report clan log
	select 0 as ResultCode
	
	declare @MinDate datetime = DATEADD(day, -@in_Days, GETDATE())
	select * from ClanEvents where ClanID=@ClanID and EventDate>=@MinDate and @ClanRank <= EventRank order by EventDate asc
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanFN_DeleteClan]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanFN_DeleteClan]
	@in_ClanID int
AS
BEGIN
	SET NOCOUNT ON;
	
	delete from ClanData where ClanID=@in_ClanID
	delete from ClanApplications where ClanID=@in_ClanID
	delete from ClanInvites where ClanID=@in_ClanID

	update LoginID set ClanID=0 where ClanID=@in_ClanID
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanFN_AddXP]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanFN_AddXP]
	@in_ClanID int,
	@in_AddXP int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- update clan xp
	update ClanData set ClanXP=(ClanXP+@in_AddXP) where ClanID=@in_ClanID

	-- get old level and current xp
	declare @OldClanLevel int
	declare @ClanXP int
	select @OldClanLevel=ClanLevel, @ClanXP=ClanXP from ClanData where ClanID=@in_ClanID

	-- calc new level
	declare @NewClanLevel int
	select top(1) @NewClanLevel=ClanLevel from DataClanXP where @ClanXP<ClanXP order by ClanXP asc
	
	if(@NewClanLevel = @OldClanLevel)
		return
		
--	
-- WOW, we're leveled up!
--
	update ClanData set ClanLevel=@NewClanLevel where ClanID=@in_ClanID

	-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1
	) values (
		@in_ClanID,
		GETDATE(),
		12, -- CLANEvent_LevelUp
		99, -- Visible to all
		@NewClanLevel
	)

	-- TODO: give some bonuses
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_RewardWeeklyPlayers]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_RewardWeeklyPlayers]
AS  
BEGIN  
	SET NOCOUNT ON;  

	--
	-- disabled per Sergey request
	--
	return

	-- make week range (>=dt1 && <dt2)
	declare @dt1 date = DATEADD(d, -6, GETDATE())
	declare @dt2 date = DATEADD(d, 1, GETDATE())

	-- Kill 200 Enemies	5000
	update LoginID set GameDollars=GameDollars+5000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		group by CustomerID
		having SUM(Kills)>=200
		)

	-- 100 Headshots	2500
	update LoginID set GameDollars=GameDollars+2500
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		group by CustomerID
		having SUM(Headshots)>=100
		)
	
	-- Play 50 Matches	5000
	update LoginID set GameDollars=GameDollars+5000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		group by CustomerID
		having count(*)>=50
		)
    
	-- Play 25 Conquest Matches	5000
	update LoginID set GameDollars=GameDollars+5000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=0)
		group by CustomerID
		having count(*)>=25
		)
    
	-- Play 25 Deathmatch Matches	5000
	update LoginID set GameDollars=GameDollars+5000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=1)
		group by CustomerID
		having count(*)>=25
		)
    
	-- Play 25 Sabotage Matches	5000	
	update LoginID set GameDollars=GameDollars+5000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=3)
		group by CustomerID
		having count(*)>=25
		)

END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_RewardDailyPlayers]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_RewardDailyPlayers]
AS  
BEGIN  
	SET NOCOUNT ON;  
	
	
	--
	-- disabled per Sergey request
	--
	return
	
	-- get current day and make 1 day range
	declare @dt1 date = GETDATE()
	declare @dt2 date = DATEADD(d, 1, GETDATE())

	-- Kill 10 Enemies - 250WP
	update LoginID set GameDollars=GameDollars+250
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		group by CustomerID
		having SUM(Kills)>=10
		)
	
	-- Play 5 Matches	500
	update LoginID set GameDollars=GameDollars+500
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		group by CustomerID
		having count(*)>=5
		)
    
	-- Play 2 Conquest Matches	1000
	update LoginID set GameDollars=GameDollars+1000
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=0)
		group by CustomerID
		having count(*)>=2
		)
    
	-- Play 2 Deathmatch Matches	1200
	update LoginID set GameDollars=GameDollars+1200
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=1)
		group by CustomerID
		having count(*)>=2
		)
    
	-- Play 2 Sabotage Matches	1200	
	update LoginID set GameDollars=GameDollars+1200
	where CustomerID in (select d.CustomerID from DBG_UserRoundResults d
		where (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=3)
		group by CustomerID
		having count(*)>=2
		)

END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_GenerateLeaderboard7]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_GenerateLeaderboard7]
AS  
BEGIN  
	SET NOCOUNT ON;  

	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/
	
	-- assemble start date of this week
	declare @StartDay date = GETDATE()
	set @StartDay = DATEADD(day, -(DATEPART(weekday, @StartDay) - 1), @StartDay)

	-- reset table with zero seed
	delete from Leaderboard7
	DBCC CHECKIDENT (Leaderboard7, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard7 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID, 
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@StartDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_GenerateLeaderboard30]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_GenerateLeaderboard30]
AS  
BEGIN  
	SET NOCOUNT ON;  

	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/
	
	-- assemble start date of this month
	declare @StartDay date = '2000-01-01'
	set @StartDay = DATEADD(year, YEAR(GETDATE()) - 2000, @StartDay)
	set @StartDay = DATEADD(month, MONTH(GETDATE()) - 1, @StartDay)

	-- reset table with zero seed
	delete from Leaderboard30
	DBCC CHECKIDENT (Leaderboard30, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard30 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID,
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@StartDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_GenerateLeaderboard]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_GenerateLeaderboard]
AS  
BEGIN  
	SET NOCOUNT ON;  
	
	-- reset table with zero seed
	delete from Leaderboard
	DBCC CHECKIDENT (Leaderboard, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses ,ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			LoginID.CustomerID, gamertag, HonorPoints,
			Stats.Kills, Stats.Deaths, Stats.Wins, Stats.Losses, Stats.ShotsFired, Stats.ShotsHits, 
			Stats.TimePlayed,
			-- get rank from table
			(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=LoginID.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from LoginID
		join Stats on Stats.CustomerID=LoginID.CustomerID
		where AccountStatus=101
		order by LoginID.HonorPoints desc

END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_GenerateDailyLeaderboard]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_GenerateDailyLeaderboard]
AS  
BEGIN  
	SET NOCOUNT ON;  
	
	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/

	declare @CurDay date = GETDATE() -- date is truncated to day only, no time

	-- reset table with zero seed
	delete from Leaderboard1
	DBCC CHECKIDENT (Leaderboard1, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard1 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID,
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@CurDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_CleanInventory]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_CleanInventory] 
AS
BEGIN
	SET NOCOUNT ON;

	declare @EraseDate datetime = DATEADD(day, -7, GETDATE())
	
	delete from Inventory where LeasedUntil<@EraseDate
	delete from Inventory_FPS where LeasedUntil<@EraseDate

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_DB_BanWeaponHackers]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_DB_BanWeaponHackers]
AS  
BEGIN  
	SET NOCOUNT ON;  
	declare @hacks TABLE 
	(
		CustomerID int,
		data varchar(512)
	)

	declare @dt1 date = DATEADD(day, -1, GETDATE())

	-- select all hack attempts to table
	insert into @hacks 
		select CustomerID, data from DBG_SrvLogInfo where 
			ReportTime >= @dt1 and IsProcessed=0 and CheatID=3

	-- clear them
	update DBG_SrvLogInfo set IsProcessed=1 where
		ReportTime >= @dt1 and IsProcessed=0 and CheatID=3

	--
	-- main ban loop
	--
	declare @CustomerID int
	declare @HackData varchar(512)
	
	DECLARE t_cursor CURSOR FOR 
		select customerid, data from @hacks 

	OPEN t_cursor
	FETCH NEXT FROM t_cursor into @CustomerID, @HackData
	while @@FETCH_STATUS = 0 
	begin
		declare @admin_note varchar(512)
		declare @AccountStatus int

		select @AccountStatus=AccountStatus from LoginID where CustomerID=@CustomerID
		if(@AccountStatus = 101) 
		begin
			-- start banning
			select @admin_note=admin_note from AccountInfo where CustomerID=@CustomerID
			set @admin_note = 'WH:' + 
				convert(varchar(128), MONTH(GETDATE())) + 
				'/' + 
				convert(varchar(128), DAY(GETDATE())) + 
				':' + @HackData + 
				', ' + @admin_note
				
			-- actual ban
			update AccountInfo set admin_note=@admin_note where CustomerID=@CustomerID
			update LoginID set AccountStatus=200 where CustomerID=@CustomerID

			print @CustomerID
			print @admin_note
		end
		
		FETCH NEXT FROM t_cursor into @CustomerID, @HackData
	end
	close t_cursor
	deallocate t_cursor

END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanSetMemberRank]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanSetMemberRank]
	@in_CustomerID int,
	@in_MemberID int,
	@in_Rank int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	if(@in_CustomerID = @in_MemberID) begin
		select 6 as 'ResultCode', 'can not set own rank' as 'ResultMsg'
		return
	end

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	declare @MemberClanRank int
	select @MemberClanID=ClanID, @MemberClanRank=ClanRank, @MemberGamerTag=GamerTag from LoginID where CustomerID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- validate that we can change rank

	-- only leader and officers can change ranks
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- cant change higher rank
	if(@ClanRank > 0 and @ClanRank >= @MemberClanRank) begin
		select 6 as ResultCode, 'cant change highter rank' as ResultMsg
		return
	end
	
	if(@ClanRank > 0 and @ClanRank >= @in_Rank) begin
		select 6 as ResultCode, 'cant set same rank' as ResultMsg
		return
	end
	
-- code for changing clan ownership, owner becomes officer
	if(@ClanRank = 0 and @in_Rank = 0) begin
		update LoginID set ClanRank=1 where CustomerID=@in_CustomerID
		update ClanData set OwnerID=@in_MemberID where ClanID=@ClanID
	end
	
-- update target member
	update LoginID set ClanRank=@in_Rank where CustomerID=@in_MemberID
	
-- generate clan set rank event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Var3,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		3, -- CLANEVENT_SetRank
		99, -- Visible to all
		@in_CustomerID,
		@in_MemberID,
		@in_Rank,
		@Gamertag,
		@MemberGamertag
	)
	
	-- TODO: send message to player about rank change
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanSetLore]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanSetLore]
	@in_CustomerID int,
	@in_Lore nvarchar(512)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int = 99
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- only leader and officers can change lore
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	update ClanData set ClanLore=@in_Lore where ClanID=@ClanID

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_FriendRemove]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FriendRemove]
	@in_CustomerID int,
	@in_FriendID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @FriendStatus int
	
	-- delete mutual friend map
	delete FriendsMap where CustomerID=@in_CustomerID and FriendID=@in_FriendID 
	delete FriendsMap where CustomerID=@in_FriendID   and FriendID=@in_CustomerID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_FriendGetStatus]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FriendGetStatus]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always success
	select 0 as ResultCode
	
	declare @OnlineTime datetime = DATEADD(minute, -2, GETDATE())

	-- your friends
	select 
		FriendID, 
		-- gamertag
		l.Gamertag,
		-- online status
		(case when exists 
			(select CustomerID from LoginSessions 
				where LoginSessions.CustomerID=f.FriendID
					and TimeUpdated > @OnlineTime)
		then 1
		else 0
		end)
		as 'Online',
		-- game id
		(select GameSessionID from LoginSessions 
				where LoginSessions.CustomerID=f.FriendID)
		as 'GameSessionID',
		c.*
	from FriendsMap f, LoginID l
	left join ClanData c on c.ClanID=l.ClanID
	where f.CustomerID=@in_CustomerID and f.FriendStatus=2
		and l.CustomerID=f.FriendID
		
	-- pending add requests
	select 
		f.CustomerID,
		l.Gamertag,
		l.HonorPoints,
		c.*
	from FriendsMap f, LoginID l
	left join ClanData c on c.ClanID=l.ClanID
	where f.FriendID=@in_CustomerID and FriendStatus=1
		and l.CustomerID=f.CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[WO_FriendGetStats]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FriendGetStats]
	@in_CustomerID int,
	@in_FriendID int
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always success
	select 0 as ResultCode
	
	if(@in_FriendID > 0) 
	begin
		-- specific friend statistics
		select FriendID, l.HonorPoints, s.*
			from FriendsMap f
			join Stats s on FriendID=s.CustomerID
			join LoginID l on FriendID=l.CustomerID
			where f.CustomerID=@in_CustomerID and FriendStatus=2
				and f.FriendID=@in_FriendID
	end
	else
	begin
		-- all your friend statistics
		select FriendID, l.HonorPoints, s.*
			from FriendsMap f
			join Stats s on FriendID=s.CustomerID
			join LoginID l on FriendID=l.CustomerID
			where f.CustomerID=@in_CustomerID and FriendStatus=2
	end
		
END
GO
/****** Object:  StoredProcedure [dbo].[WO_FriendAddReq]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FriendAddReq]
	@in_CustomerID int,
	@in_FriendGamerTag nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	-- get customerid
	declare @FriendID int
	select @FriendID=CustomerID from LoginID where Gamertag=@in_FriendGamerTag
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no such gamertag' as ResultMsg
		return
	end
	
	-- always success
	select 0 as ResultCode
	
	-- if we already have that friend
	declare @FriendStatus1 int = -1
	declare @FriendStatus2 int = -1
	
	select @FriendStatus1=FriendStatus from FriendsMap 
		where CustomerID=@in_CustomerID and FriendID=@FriendID
	select @FriendStatus2=FriendStatus from FriendsMap 
		where CustomerID=@FriendID and FriendID=@in_CustomerID
	if(@FriendStatus1 = 3 and @FriendStatus2 = 3) begin
		-- 2 way deny - permanent block
		select 4 as FriendStatus
		return
	end

	-- you already have that request
	if(@FriendStatus1 >= 0) begin
		select @FriendStatus1 as FriendStatus
		return
	end
	
	-- insert with status 1 (request sent)
	insert into FriendsMap values
		(@in_CustomerID, @FriendID, 1, GETDATE())
		
	select 0 as FriendStatus
END
GO
/****** Object:  StoredProcedure [dbo].[WO_FriendAddAns]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FriendAddAns]
	@in_CustomerID int,
	@in_FriendID int,
	@in_Allow int
AS
BEGIN
	SET NOCOUNT ON;

	declare @FriendStatus int
	
	-- check if we have that request
	select @FriendStatus=FriendStatus from FriendsMap 
		where CustomerID=@in_FriendID and FriendID=@in_CustomerID 
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode
		return
	end
	
	if(@in_Allow = 0) 
	begin
		-- declined
		update FriendsMap set FriendStatus=3
			where CustomerID=@in_FriendID and FriendID=@in_CustomerID
		
		select 0 as ResultCode
		return
	end
	
	-- delete friend pair
	delete FriendsMap where CustomerID=@in_CustomerID and FriendID=@in_FriendID 
	delete FriendsMap where CustomerID=@in_FriendID   and FriendID=@in_CustomerID
	
	-- insert friend pair
	insert into FriendsMap values
		(@in_CustomerID, @in_FriendID,   2, GETDATE())
		
	if(@in_FriendID != @in_CustomerID) begin
		insert into FriendsMap values
			(@in_FriendID,   @in_CustomerID, 2, GETDATE())
	end
	
	select 0 as ResultCode
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_FactionAddRoundResult]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_FactionAddRoundResult] 
	@in_CustomerID int,
	@in_MapID int,
	@in_TeamID int,
	@in_Wins int
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_Wins = 0)
		return

	-- detect faction id based on mapid
	-- FactionID is:
	--  1. Ironstone Security / Russians 
	--  2. Shadow Corp Unlimited - USA
	--  3. United Warriors - Africa
	--  4. Brotherhood - Middle East, North Africa
	--  5. Roaring Tigers - China
	
	declare @Fact1 int -- blue faction id
	declare @Fact2 int -- red faction id
	
	if(@in_MapID = 2) begin 
		-- Crossroads16
		set @Fact1  = 2;
		set @Fact2  = 4;
	end
	else if(@in_MapID = 3 or @in_MapID = 12) begin
		-- Grozny and Grozny_CQ
		set @Fact1  = 1;
		set @Fact2  = 4;
	end 
	else if(@in_MapID = 10) begin 
		-- Burning Sea
		set @Fact1  = 3;
		set @Fact2  = 5;
	end
	else if(@in_MapID = 4) begin 
		-- Torn CQ
		set @Fact1  = 2;
		set @Fact2  = 1;
	end
	else if(@in_MapID = 9) begin 
		-- Nightfall
		set @Fact1  = 5;
		set @Fact2  = 3;
	end
	else begin
		-- not faction ranked map
		return
	end
	
	-- faction based on your team
	declare @RwdFact int
	if(@in_TeamID = 0) set @RwdFact = @Fact1
	else if(@in_TeamID = 1) set @RwdFact = @Fact2
	else return
	
	-- get previous faction score
	declare @PrevScore int
	     if(@RwdFact = 1)	select @PrevScore=Faction1Score from LoginID where CustomerID=@in_CustomerID
	else if(@RwdFact = 2)	select @PrevScore=Faction2Score from LoginID where CustomerID=@in_CustomerID
	else if(@RwdFact = 3)	select @PrevScore=Faction3Score from LoginID where CustomerID=@in_CustomerID
	else if(@RwdFact = 4)	select @PrevScore=Faction4Score from LoginID where CustomerID=@in_CustomerID
	else if(@RwdFact = 5)	select @PrevScore=Faction5Score from LoginID where CustomerID=@in_CustomerID
	
	-- update new faction score
	declare @NewScore int = @PrevScore + 1
	     if(@RwdFact = 1)	update LoginID set Faction1Score=@NewScore where CustomerID=@in_CustomerID
	else if(@RwdFact = 2)	update LoginID set Faction2Score=@NewScore where CustomerID=@in_CustomerID
	else if(@RwdFact = 3)	update LoginID set Faction3Score=@NewScore where CustomerID=@in_CustomerID
	else if(@RwdFact = 4)	update LoginID set Faction4Score=@NewScore where CustomerID=@in_CustomerID
	else if(@RwdFact = 5)	update LoginID set Faction5Score=@NewScore where CustomerID=@in_CustomerID
	
	-- apply faction rewards
	exec WO_FactionAddReward @in_CustomerID, @RwdFact, @PrevScore, @NewScore
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanCreateCheckParams]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanCreateCheckParams]
	@in_CustomerID int,
	@in_ClanName nvarchar(64),
	@in_ClanTag nvarchar(4)
AS
BEGIN
	SET NOCOUNT ON;

	-- user can't create more that one clan
	declare @ClanID int = 0
	select @ClanID=ClanID from LoginID where CustomerID=@in_CustomerID
	if(@ClanID > 0) begin
		select 6 as ResultCode, 'already have clan' as ResultMsg
		return
	end
	
	-- check that name/tag is unique
	if(exists(select * from ClanData where ClanName=@in_ClanName)) begin
		select 27 as ResultCode, 'clan name' as ResultMsg
		return
	end
	if(exists(select * from ClanData where ClanTag=@in_ClanTag)) begin
		select 28 as ResultCode, 'clan tag' as ResultMsg
		return
	end

	select 0 as ResultCode
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanCreateCheckMoney]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanCreateCheckMoney]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- detect if user CAN create clan	
	declare @HonorPoints int = 0
	select @HonorPoints=HonorPoints from LoginID where CustomerID=@in_CustomerID
	
	declare @Rank int = 0
	select top(1) @Rank=rank from DataRankPoints where @HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc
	
	-- this call is always valid
	select 0 as ResultCode
	
	if(@Rank >= 45)
		select 0 as NeedMoney
	else
		select 1 as NeedMoney

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanCreate]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanCreate]
	@in_CustomerID int,
	@in_ClanName nvarchar(64),
	@in_ClanNameColor int,
	@in_ClanTag nvarchar(4),
	@in_ClanTagColor int,
	@in_ClanEmblemID int,
	@in_ClanEmblemColor int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @DEFAULT_CLAN_SIZE int = 15

	-- sanity check
	declare @ClanID int = 0
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID > 0) begin
		select 6 as 'ResultCode', 'already have clan' as 'ResultMsg'
		return
	end
	
	-- create clan!
	insert into ClanData (
		ClanName, ClanNameColor, 
		ClanTag, ClanTagColor,
		ClanEmblemID, ClanEmblemColor,
		ClanXP,	ClanLevel, ClanGP,
		OwnerID, MaxClanMembers, NumClanMembers,
		ClanCreateDate
	) values (
		@in_ClanName, @in_ClanNameColor,
		@in_ClanTag, @in_ClanTagColor,
		@in_ClanEmblemID, @in_ClanEmblemColor,
		0,	0,	0,
		@in_CustomerID,	@DEFAULT_CLAN_SIZE,	1,
		GETDATE()
	)
	
	-- get new clanID
	select @ClanID=ClanID from ClanData where OwnerID=@in_CustomerID
	if(@@ROWCOUNT = 0) begin
		select 6 as 'ResultCode', 'clan creation failed!' as 'ResultMsg'
		return
	end
	
	-- update owner clan data
	update LoginID set ClanID=@ClanID, ClanRank=0 where CustomerID=@in_CustomerID
	
	-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		1, -- CLANEVENT_Created
		99, -- Visible to all
		@in_CustomerID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
	
	select @ClanID as 'ClanID'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanApplyToJoin]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanApplyToJoin]
	@in_CustomerID int,
	@in_ClanID int,
	@in_ApplicationText nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON;

	declare @APPLY_EXPIRE_TIME_HOURS int = 72
	declare @MAX_PENDING_APPS int = 5	-- can be maximum 5 pending invitations
	
-- sanity checks

	-- player must be without clan
	declare @PlayerClanID int = 0
	select @PlayerClanID=ClanID from LoginID where CustomerID=@in_CustomerID
	if(@PlayerClanID > 0) begin
		select 6 as ResultCode, 'already in clan' as ResultMsg
		return
	end

	-- make sure clan exists
	if not exists (select ClanID from ClanData where ClanID=@in_ClanID) begin
		select 6 as ResultCode, 'no clanid' as ResultMsg
		return
	end
	
	-- see if we already have pending invidation
	declare @AppExpireTime datetime
	select @AppExpireTime=ExpireTime from ClanApplications where ClanID=@in_ClanID and CustomerID=@in_CustomerID and GETDATE()<ExpireTime
	if(@@ROWCOUNT > 0) begin
		select 24 as ResultCode, 'pending application' as ResultMsg
		return
	end
	
	-- see if we already have too much applications
	declare @AppTotalCounts int = 0
	select @AppTotalCounts=COUNT(*) from ClanApplications where CustomerID=@in_CustomerID and GETDATE()<ExpireTime
	if(@AppTotalCounts >= @MAX_PENDING_APPS) begin
		select 25 as ResultCode, 'too many applications' as ResultMsg
		return 
	end
	
-- send application

	insert into ClanApplications (
		ClanID,
		CustomerID,
		ExpireTime,
		ApplicationText,
		IsProcessed
	) values (
		@in_ClanID,
		@in_CustomerID,
		DATEADD(hour, @APPLY_EXPIRE_TIME_HOURS, GETDATE()),
		@in_ApplicationText,
		0
	)

	-- success
	select 0 as ResultCode
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanApplyGetList]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanApplyGetList]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- give list of applyers

	-- only leader and officers can view application list
	if(@ClanRank > 1) begin
		select 6 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- success
	select 0 as ResultCode
	
	select 
		a.ClanApplicationID,
		a.ApplicationText,
		l.Gamertag,
		DATEDIFF(mi, GETDATE(), a.ExpireTime) as MinutesLeft,
		l.HonorPoints,
		s.Kills,
		s.Deaths,
		s.Wins,
		s.Losses,
		s.TimePlayed
	from ClanApplications a
	join LoginID l on (l.CustomerID=a.CustomerID)
	join Stats s on (s.CustomerID=a.CustomerID)
	where a.ClanID=@ClanID and GETDATE()<ExpireTime and IsProcessed=0
	
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanApplyAnswer]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanApplyAnswer]
	@in_CustomerID int,
	@in_ClanApplicationID int,
	@in_Answer int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- only leader and officers can answer application
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	if(@NumClanMembers >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end

-- check application

	declare @AppClanID int = 0
	declare @AppCustomerID int
	select @AppClanID=ClanID, @AppCustomerID=CustomerID	from ClanApplications where ClanApplicationID=@in_ClanApplicationID
	if(@AppClanID <> @ClanID) begin
		select 6 as ResultCode, 'bad application id' as ResultMsg
		return
	end
	
	-- mark that application as processed
	update ClanApplications set IsProcessed=1 where ClanApplicationID=@in_ClanApplicationID
	
	-- make sure that this guy isn't joined other clan somehow (race condition)
	declare @AppGamertag nvarchar(64)
	select @AppClanID=ClanID, @AppGamertag=Gamertag from LoginID where CustomerID=@AppCustomerID
	if(@AppClanID <> 0) begin
		select 21 as ResultCode, 'applicant already joined clan' as ResultMsg
		return
	end

	if(@in_Answer = 0)
	begin
		-- declined clan joining
		-- TODO: send message to player about denial

		select 0 as ResultCode
		return
	end
	
	-- accept application, join player to clan
	update ClanData set NumClanMembers=(NumClanMembers + 1) where ClanID=@ClanID
	update LoginID set ClanID=@ClanID, ClanRank=99 where CustomerID=@AppCustomerID
	
	-- clear all other applications
	delete from ClanApplications where CustomerID=@AppCustomerID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		4, -- CLANEvent_Join
		99, -- Visible to all
		@AppCustomerID,
		@AppGamertag
	)
	
	select 0 as ResultCode
	return

END
GO
/****** Object:  StoredProcedure [dbo].[WO_ChangeGamertag]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ChangeGamertag]
	@in_IP char(32),
	@in_CustomerID int,
	@in_GamerTag nvarchar(32),
	@in_ActualExec int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- change gamertag
	if(@in_ActualExec > 0) begin
		update LoginID set Gamertag=@in_GamerTag where CustomerID=@in_CustomerID
		select 0 as ResultCode
		return
	end

	-- check if gamertag is unique
	if exists (select CustomerID from LoginID where Gamertag=@in_GamerTag) begin
		select 9 as ResultCode, 'Gamertag already exists' as ResultMsg
		return
	end

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LeaderboardGet]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LeaderboardGet]
	@in_CustomerID int,
	@in_TableID int,
	@in_StartPos int
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always success
	select 0 as ResultCode
	
	declare @TotalRows int = 0
	declare @ROWS_TO_FETCH int = 100
	
	-- if need to find our position in leaderboard
	if(@in_StartPos < 0) 
	begin
		if(@in_TableID = 0) begin
			select @in_StartPos=Pos from Leaderboard1 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard1
		end else if(@in_TableID = 1) begin
			select @in_StartPos=Pos from Leaderboard7 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard7
		end else if(@in_TableID = 2) begin
			select @in_StartPos=Pos from Leaderboard30 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard30
		end else begin
			select @in_StartPos=Pos from Leaderboard where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard
		end
	
		set @in_StartPos = @in_StartPos - (@ROWS_TO_FETCH / 2)
		if(@in_StartPos < 0)
			set @in_StartPos = 0
	end

	-- report starting position
	select @in_StartPos as 'StartPos', @TotalRows as 'Size'
	
	-- return actual leaderboard

	if(@in_TableID = 0) begin
		select * from Leaderboard1 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else if(@in_TableID = 1) begin
		select * from Leaderboard7 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else if(@in_TableID = 2) begin
		select * from Leaderboard30 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else begin
		select * from Leaderboard where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ItemUpgradePutSlot]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ItemUpgradePutSlot]
	@in_CustomerID int,
	@in_ItemID int,
	@in_SlotID int,
	@in_NewUpgradeID int,
	-- parameters for statistics
	@in_Success int,
	@in_Category int,
	@in_Type int,
	@in_Level int,
	@in_Price int,
	@in_IsGP int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- check that we have that item
	declare @TempItemId int
	select @TempItemId=ItemID from Inventory 
		where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no such item' as ResultMsg
		return
	end

	-- TODO (if needed) - add logging to some table...
	-- xxxx
	
	-- put new upgrade item to inventory slot
	if(@in_SlotID = 0) 
		update Inventory set UpSlot1=@in_NewUpgradeID where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else if(@in_SlotID = 1) 
		update Inventory set UpSlot2=@in_NewUpgradeID where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else if(@in_SlotID = 2) 
		update Inventory set UpSlot3=@in_NewUpgradeID where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else if(@in_SlotID = 3) 
		update Inventory set UpSlot4=@in_NewUpgradeID where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else if(@in_SlotID = 4) 
		update Inventory set UpSlot5=@in_NewUpgradeID where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else begin
		select 6 as ResultCode, 'invalid in_SlotID' as ResultMsg
		return
	end

	select 0 as ResultCode
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ItemUpgradeGetUpgrades]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ItemUpgradeGetUpgrades]
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode

	-- return upgrade types and their values
	select ItemID, Value, PriceP, GPChance, GPriceP, GDChance from Items_UpgradeData
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ItemUpgradeGetSlot]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ItemUpgradeGetSlot]
	@in_CustomerID int,
	@in_ItemID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- check that we have that item
	declare @UpSlot1 int
	declare @UpSlot2 int
	declare @UpSlot3 int
	declare @UpSlot4 int
	declare @UpSlot5 int
	select @UpSlot1=UpSlot1,
		@UpSlot2=UpSlot2, 
		@UpSlot3=UpSlot3, 
		@UpSlot4=UpSlot4, 
		@UpSlot5=UpSlot5
		from Inventory where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no such item' as ResultMsg
		return
	end
	
	-- success
	select 0 as ResultCode
	
	declare @Category int = 0
	declare @IsUpgradeable int = 0
	select @Category=Category, @IsUpgradeable=IsUpgradeable from Items_Weapons 
		where ItemID=@in_ItemID
	
	select 
		@Category as 'Category',
		@IsUpgradeable as 'IsUpgradeable',
		@UpSlot1 as 'UpSlot1',
		@UpSlot2 as 'UpSlot2',
		@UpSlot3 as 'UpSlot3',
		@UpSlot4 as 'UpSlot4',
		@UpSlot5 as 'UpSlot5'
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetShopInfo5]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetShopInfo5] 
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	SELECT * from DataSkill2Price

	-- select common shop items
	      SELECT ItemID, Category, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP FROM Items_Gear
	union SELECT ItemID, Category, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Weapons
	union SELECT ItemID, Category, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Generic
	union SELECT ItemID, Category, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Attachments
	
	-- packages (later we'll report their content as well)
	SELECT * from Items_Packages
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetItemsData]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetItemsData] 
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	select * from Items_Gear
	select * from Items_Weapons;
	select * from Items_Generic
	select * from Items_Packages
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetDataGameRewards]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetDataGameRewards]
AS
BEGIN  
	SET NOCOUNT ON;  

	select 0 as ResultCode
	select * from DataGameRewards
END
GO
/****** Object:  StoredProcedure [dbo].[WO_WeaponAttachSet]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_WeaponAttachSet]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_AttachmentID int,
	@in_Slot int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- clearing attachment
	if(@in_AttachmentID = 0) begin
		update Inventory_FPS set IsEquipped=0 where CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and Slot=@in_Slot
		select 0 as 'ResultCode'
		return
	end
	
	-- check if we have that weapon attachment
	declare @Slot int = 0
	select @Slot=Slot from Inventory_FPS 
		where (CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and AttachmentID=@in_AttachmentID)
	if(@@ROWCOUNT = 0) begin
		select 6 as 'ResultCode', 'attachment not exists' as 'ResultMsg'
		return
	end
	
	-- client sanity check against slot
	if(@in_Slot <> @Slot) begin
		select 6 as 'ResultCode', 'wrong slot' as 'ResultMsg'
		return
	end
	
	update Inventory_FPS set IsEquipped=0 where CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and Slot=@Slot
	update Inventory_FPS set IsEquipped=1 where CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and AttachmentID=@in_AttachmentID
	
	select 0 as 'ResultCode'
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_WeaponAttachCheckBuy]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_WeaponAttachCheckBuy]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_AttachmentID int,
	@in_Slot int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- check if we have that attachment and get their SpecID
	declare @SpecID int = 0
	declare @Slot int = 0
	select @Slot=[Type], @SpecID=SpecID from Items_Attachments where ItemID=@in_AttachmentID
	if(@@ROWCOUNT = 0) begin
		select 6 as 'ResultCode', 'no such attachment' as 'ResultMsg'
		return
	end
	
	-- check slot (just in case client screwed something)
	if(@Slot <> @in_Slot) begin
		select 6 as 'ResultCode', 'bad attachment slot' as 'ResultMsg'
		return
	end
	
	-- get weapon attachment parameters
	declare @FPSSpec0 int
	declare @FPSSpec1 int
	declare @FPSSpec2 int
	declare @FPSSpec3 int
	declare @FPSSpec4 int
	declare @FPSSpec5 int
	declare @FPSSpec6 int
	declare @FPSSpec7 int
	declare @FPSSpec8 int
	select
		@FPSSpec0=FPSSpec0,
		@FPSSpec1=FPSSpec1,
		@FPSSpec2=FPSSpec2,
		@FPSSpec3=FPSSpec3,
		@FPSSpec4=FPSSpec4,
		@FPSSpec5=FPSSpec5,
		@FPSSpec6=FPSSpec6,
		@FPSSpec7=FPSSpec7,
		@FPSSpec8=FPSSpec8
	from Items_Weapons where ItemID=@in_WeaponID
	if(@@ROWCOUNT = 0) begin
		select 6 as 'ResultCode', 'no such weapon' as 'ResultMsg'
		return
	end
	
	-- check if we can put that attachment to this slot
	declare @BadPut int = 0
	if(@Slot = 0 and @FPSSpec0 <> @SpecID) set @BadPut = 1
	if(@Slot = 1 and @FPSSpec1 <> @SpecID) set @BadPut = 1
	if(@Slot = 2 and @FPSSpec2 <> @SpecID) set @BadPut = 1
	if(@Slot = 3 and @FPSSpec3 <> @SpecID) set @BadPut = 1
	if(@Slot = 4 and @FPSSpec4 <> @SpecID) set @BadPut = 1
	if(@Slot = 5 and @FPSSpec5 <> @SpecID) set @BadPut = 1
	if(@Slot = 6 and @FPSSpec6 <> @SpecID) set @BadPut = 1
	if(@Slot = 7 and @FPSSpec7 <> @SpecID) set @BadPut = 1
	if(@Slot = 8 and @FPSSpec8 <> @SpecID) set @BadPut = 1
	if(@BadPut > 0) begin
		select 6 as 'ResultCode', 'SpecID mismatch' as 'ResultMsg'
		return
	end
	
	select 0 as 'ResultCode'
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_UpdateLoginSession2]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_UpdateLoginSession2]
	@in_IP varchar(32),
	@in_CustomerID int,
	@in_SessionID int,
	@in_GameSessionID bigint
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @SessionID int
	declare @IP varchar(16)

	-- check if we have record for that user          
	SELECT 
		@SessionID=LoginSessions.SessionID,
		@IP=LoginSessions.LoginIP
	FROM LoginSessions
	WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode
		return
	end

	-- compare session key. if it's different, supplied sesson is invalid	
	if(@in_SessionID <> @SessionID) begin
		select 1 as ResultCode
		return
	end
	
	-- update last ping time
	UPDATE LoginSessions SET 
		LoginSessions.TimeUpdated=GETDATE(),
		GameSessionID=@in_GameSessionID
	WHERE CustomerID=@in_CustomerID
	
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_UPDATELOGINSESSION]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_UPDATELOGINSESSION]
	@in_IP varchar(32),
	@in_CustomerID int,
	@in_SessionID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @SessionID int
	declare @IP varchar(16)

	-- check if we have record for that user          
	SELECT 
		@SessionID=LoginSessions.SessionID,
		@IP=LoginSessions.LoginIP
	FROM LoginSessions
	WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode
		return
	end

	-- compare session key. if it's different, supplied sesson is invalid	
	if(@in_SessionID <> @SessionID) begin
		select 1 as ResultCode
		return
	end
	
	-- update last ping time
	UPDATE LoginSessions SET 
		LoginSessions.TimeUpdated=GETDATE()
	WHERE CustomerID=@in_CustomerID
	
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_UpdateAchievementStatus]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_UpdateAchievementStatus]
	@in_CustomerID int,
	@in_AchID int,
	@in_AchValue int,
	@in_AchUnlocked int
AS
BEGIN
	SET NOCOUNT ON;

	if not exists (select * from Achievements where (AchID=@in_AchID and CustomerID=@in_CustomerID))
	begin
		INSERT INTO Achievements(
			CustomerID, 
			AchID, 
			Value, 
			Unlocked
		)
		VALUES (
			@in_CustomerID,
			@in_AchID,
			@in_AchValue,
			@in_AchUnlocked
		)
	end
	else
	begin
		UPDATE Achievements SET 
			Value=@in_AchValue,
			Unlocked=@in_AchUnlocked
		WHERE AchID=@in_AchID and CustomerID=@in_CustomerID
    end

    select 0 as ResultCode
    
    -- check for steamID
    declare @SteamID bigint = 0
	select @SteamID=SteamID from SteamUserIDMap where CustomerID=@in_CustomerID
	select @SteamID as 'SteamID'
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SteamStartOrder]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SteamStartOrder]
	@in_IP varchar(100),
	@in_CustomerID int,
	@in_SteamID bigint,
	@in_SteamGPItemId int
AS
BEGIN
	SET NOCOUNT ON;

	declare @TotalGP int = 0
	declare @PriceUSD int = 0
	declare @ItemName nvarchar(64) = NULL
	declare @ItemCode varchar(32) = NULL
	
	if(@in_SteamGPItemId = 1000) begin
		-- HARDBOILED
		set @PriceUSD = 1499
		set @ItemName = N'Hardboiled Package'
		set @ItemCode = 'PACK_RETAIL1'
	end
	else if(@in_SteamGPItemId = 1001) begin
		-- SNAKEEATER
		set @PriceUSD = 2499
		set @ItemName = N'Snake Eater Package'
		set @ItemCode = 'PACK_RETAIL2'
	end
	else if(@in_SteamGPItemId = 1002) begin
		-- WARLORD
		set @PriceUSD = 3999
		set @ItemName = N'WARLORD Package'
		set @ItemCode = 'PACK_RETAIL3'
	end
	else if(@in_SteamGPItemId = 1003) begin
		-- COLLECTOR EDITION
		set @PriceUSD = 3499
		set @ItemName = N'Collectors Edition'
		set @ItemCode = 'PACK_COLLECTOR_EDITION'
	end
	else begin
		select 
			@TotalGP=(GP+BonusGP), @PriceUSD=PriceCentsUSD
			from SteamGPShop 
			where IsEnabled>0 and SteamGPItemId=@in_SteamGPItemId
		if (@@RowCount = 0) begin
			select 6 as ResultCode, 'no steam item found' as ResultMsg
			return
		end
	end
	
	-- store transaction
	insert into SteamGPOrders
		(CustomerID, SteamID, InitTxnTime, Price, GP, ItemCode)
		values
		(@in_CustomerID, @in_SteamID, GETDATE(), @PriceUSD, @TotalGP, @ItemCode)
	declare @OrderID int = SCOPE_IDENTITY();

	select 0 as ResultCode
	select @TotalGP as 'GP', @PriceUSD as 'PriceUSD', 
		@OrderID as 'OrderID', @ItemName as 'ItemName'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetAccountWeeklyStats]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetAccountWeeklyStats]
	@in_CustomerID int
AS
BEGIN  
	SET NOCOUNT ON;  

	-- get current day and make current week range
	declare @dt1 date = GETDATE()
	set @dt1 = DATEADD(day, -(DATEPART(weekday, @dt1) - 1), @dt1)
	declare @dt2 date = DATEADD(day, 7, @dt1)

	declare @DailyGames int = 0
	declare @Kills int = 0
	declare @Headshots int = 0
	declare @CaptureFlags int = 0
	declare @MatchesCQ int = 0
	declare @MatchesDM int = 0
	declare @MatchesSB int = 0

	-- count daily games, kills, headshots, capture enemy flags
	select 
		@DailyGames = count(CustomerID), 
		@Kills = SUM(Kills), 
		@Headshots = SUM(Headshots), 
		@CaptureFlags = SUM(CaptureEnemyPoints)
	from DBG_UserRoundResults 
	where GameReportTime >= @dt1 and GameReportTime < @dt2 and CustomerID=@in_CustomerID

	select @MatchesCQ=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=0)

	select @MatchesDM=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=1)

	select @MatchesSB=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=3)

	-- report to us
	select 
		@DailyGames as 'DailyGames', 
		@Kills as 'Kills', 
		@Headshots as 'Headshots', 
		@CaptureFlags as 'CaptureFlags',
		@MatchesCQ as 'MatchesCQ',
		@MatchesDM as 'MatchesDM',
		@MatchesSB as 'MatchesSB'

END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetAccountDailyStats]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetAccountDailyStats]
	@in_CustomerID int
AS
BEGIN  
	SET NOCOUNT ON;  

	-- get current day and make 1 day range
	declare @dt1 date = GETDATE()
	declare @dt2 date = DATEADD(d, 1, GETDATE())

	declare @DailyGames int = 0
	declare @Kills int = 0
	declare @Headshots int = 0
	declare @CaptureFlags int = 0
	declare @MatchesCQ int = 0
	declare @MatchesDM int = 0
	declare @MatchesSB int = 0

	-- count daily games, kills, headshots, capture enemy flags
	select 
		@DailyGames = count(CustomerID), 
		@Kills = SUM(Kills), 
		@Headshots = SUM(Headshots), 
		@CaptureFlags = SUM(CaptureEnemyPoints)
	from DBG_UserRoundResults 
	where GameReportTime >= @dt1 and GameReportTime < @dt2 and CustomerID=@in_CustomerID

	select @MatchesCQ=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=0)

	select @MatchesDM=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=1)

	select @MatchesSB=COUNT(*) from DBG_UserRoundResults
		where CustomerID=@in_CustomerID and (GameReportTime >= @dt1 and GameReportTime < @dt2)
		and (MapType=3)

	-- report to us
	select 
		@DailyGames as 'DailyGames', 
		@Kills as 'Kills', 
		@Headshots as 'Headshots', 
		@CaptureFlags as 'CaptureFlags',
		@MatchesCQ as 'MatchesCQ',
		@MatchesDM as 'MatchesDM',
		@MatchesSB as 'MatchesSB'

END
GO
/****** Object:  StoredProcedure [dbo].[WO_LoadoutUpdateStats]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LoadoutUpdateStats] 
	@in_CustomerID int,
	@in_LoadoutID int,
	@in_TimePlayed int,
	@in_HonorPoints int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- validate that player own that loadout	
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from Profile_Chars where LoadoutID=@in_LoadoutID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no loadout id' as ResultMsg
		return
	end
	
	if(@CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad customerid' as ResultMsg
		return
	end

	-- update loadout data
	update Profile_Chars set 
		TimePlayed=(TimePlayed+@in_TimePlayed), 
		HonorPoints=(HonorPoints+@in_HonorPoints)
	where LoadoutID=@in_LoadoutID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LootGetData]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LootGetData] 
	@in_LootID int
AS
BEGIN
	SET NOCOUNT ON;

	-- success
	select 0 as ResultCode

	-- report item category (loot box or mystery box)
	declare @Category int = 0
	select @Category=Category from Items_Generic where ItemID=@in_LootID
	select @Category as 'Category'

	-- report content
	select * from Items_LootData where LootID=@in_LootID order by Chance asc
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LoginFN_Exec]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LoginFN_Exec]
	@in_IP varchar(100),
	@CustomerID int,
	@AccountStatus int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- helper function that perform actual user login
	--

	-- status greater or equal to 200 means that user is banned
	if (@AccountStatus >= 200) begin
		select
			3 as LoginResult,
			@CustomerID as CustomerID,
			@AccountStatus as AccountStatus,
			0 as SessionID
		return
	end
	
	-- TEMP ban by IP one annoying idiot
	if(@in_IP = '24.128.30.151' OR @in_IP='122.61.157.213') begin
		select
			3 as LoginResult,
			@CustomerID as CustomerID,
			200 as AccountStatus,
			0 as SessionID
		return
	end
	
	declare @email varchar(100) = ''
	SELECT @email=email FROM AccountInfo WHERE CustomerID = @CustomerID
	if(@email like '%@klzlk.com') begin
		select
			3 as LoginResult,
			@CustomerID as CustomerID,
			200 as AccountStatus,
			0 as SessionID
		return
	end

	-- update session key/id
	declare @SessionKey varchar(50) = NEWID()
	declare @SessionID int = checksum(@SessionKey)
	if exists (SELECT CustomerID FROM LoginSessions WHERE CustomerID = @CustomerID)
	begin
		UPDATE LoginSessions SET 
			SessionKey=@SessionKey, 
			SessionID=@SessionID,
			LoginIP=@in_IP, 
			TimeLogged=GETDATE(), 
			TimeUpdated=GETDATE()
		WHERE CustomerID=@CustomerID
	end
	else
	begin
		INSERT INTO LoginSessions
			(CustomerID, SessionKey, SessionID, LoginIP, TimeLogged, TimeUpdated)
		VALUES 
			(@CustomerID, @SessionKey, @SessionID, @in_IP, GETDATE(), GETDATE())
	end

	-- get dev status - need to avoid region lock
	declare @IsDeveloper int = 0
	select @IsDeveloper=IsDeveloper from LoginID where CustomerID=@CustomerID
	
	-- update other tables
	UPDATE LoginID SET 
		lastlogindate=GETDATE(), 
		lastloginIP=@in_IP
	WHERE CustomerID=@CustomerID
	
	INSERT INTO Logins 
		(CustomerID, LoginTime, IP, LoginSource) 
	VALUES 
		(@CustomerID, GETDATE(), @in_IP, 0)

	--	exec FN_AddItemToUser @CustomerID, 101033, 2000 -- Thanksgiving weekend
	
	-- return session info
	SELECT 
		0 as LoginResult,
		@CustomerID as CustomerID,
		@AccountStatus as AccountStatus,
		@SessionID as SessionID,
		@IsDeveloper as IsDeveloper
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_AddWeaponStats]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SRV_AddWeaponStats] 
	@in_ItemID int,
	@in_ShotsFired int,
	@in_ShotsHits int,
	@in_KillsCQ int,
	@in_KillsDM int,
	@in_KillsSB int
AS
BEGIN
	SET NOCOUNT ON;

	update Items_Weapons set
		ShotsFired=(ShotsFired + @in_ShotsFired),
		ShotsHits=(ShotsHits + @in_ShotsHits),
		KillsCQ=(KillsCQ + @in_KillsCQ),
		KillsDM=(KillsDM + @in_KillsDM),
		KillsSB=(KillsSB + @in_KillsSB)
	where ItemID=@in_ItemID

	-- we're done
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WO_SteamLinkAccount]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SteamLinkAccount]
	@in_CustomerID int,
	@in_SteamID bigint
AS
BEGIN
	SET NOCOUNT ON;
	
	select 0 as ResultCode
	insert into SteamUserIDMap (CustomerID, SteamID) values (@in_CustomerID, @in_SteamID)
	
	-- steam account bonuses (was before 24th Jule)
	--update LoginID set GameDollars=GameDollars+5000 where CustomerID=@in_CustomerID
	--exec FN_AddItemToUser @in_CustomerID, 301001, 14
	--exec FN_AddItemToUser @in_CustomerID, 101210, 14
	--exec FN_AddItemToUser @in_CustomerID, 101083, 14
	--exec FN_AddItemToUser @in_CustomerID, 20063, 14
	--exec FN_AddItemToUser @in_CustomerID, 20065, 14
	--exec FN_AddItemToUser @in_CustomerID, 20064, 14
	--exec FN_AddItemToUser @in_CustomerID, 20066, 14
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SteamGetGPShop]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SteamGetGPShop]
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode
	select * from SteamGPShop where IsEnabled>0 order by GP asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_SetCreateGameKey2]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SRV_SetCreateGameKey2]
	@in_IP varchar(32),
	@in_ServerID int,
	@in_CreateGameKey int
AS
BEGIN
	SET NOCOUNT ON;

	if not exists (select ServerID from MasterServerInfo where ServerID=@in_ServerID) begin
		insert into MasterServerInfo (ServerID) values (@in_ServerID)
	end
	
	-- update
	UPDATE MasterServerInfo set 
		LastUpdated=GETDATE(),
		CreateGameKey = @in_CreateGameKey,
		IP=@in_IP
	WHERE ServerID = @in_ServerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode
		return
	end
	
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WO_RetBonusFN_CheckDays]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_RetBonusFN_CheckDays]
	@in_CustomerID int,
	@out_RetDays int out
AS
BEGIN
	SET NOCOUNT ON;
	
	-- get last gime when bonus was given
	declare @lastRetBonusDate datetime
	select @lastRetBonusDate=lastRetBonusDate from LoginID where CustomerID=@in_CustomerID
	if(@lastRetBonusDate is NULL) begin
		update LoginID set lastRetBonusDate=GETDATE() where CustomerID=@in_CustomerID
		set @out_RetDays = 0
		return
	end

	-- calc next possible date with same *time* as @lastRetBonusDate
	declare @NextBonusTime datetime = DATEADD(day, 1, @lastRetBonusDate)
	declare @SecToNextDay int = DATEDIFF(second, GETDATE(), @NextBonusTime) % (24*60*60)
	while(@SecToNextDay < 0) begin
		set @SecToNextDay = @SecToNextDay + (24*60*60)
	end
	set @NextBonusTime = DATEADD(second, @SecToNextDay + 2, GETDATE())	-- add 2 sec delta for lower loop compare

	-- loop into past per one day frame between and see if user was logged at least once per day
	declare @dt1 datetime = DATEADD(day, -2, @NextBonusTime)
	declare @dt2 datetime = DATEADD(day, -1, @NextBonusTime)
	declare @days int = 0

	while(@lastRetBonusDate < @dt1) 
	begin
		declare @NumGames int = 0
		select @NumGames=COUNT(*) from Logins 
			where CustomerID=@in_CustomerID and LoginTime>@dt1 and LoginTime<@dt2
		if(@NumGames = 0)
			break

		-- add one day to continued play time, limit by 15 days for now
		set @days = @days + 1
		if(@days > 15)
			break
			
		set @dt1 = DATEADD(day, -1, @dt1)
		set @dt2 = DATEADD(day, -1, @dt2)
	end
	
	set @out_RetDays = @days
	return

END
GO
/****** Object:  StoredProcedure [dbo].[WO_RECORD_NAIVE_CCU]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_RECORD_NAIVE_CCU]
AS
BEGIN

	SET NOCOUNT ON;


declare @today datetime
set @today = GETDATE()

declare @CCU int;

set @CCU = (select count(distinct CustomerID ) from LoginSessions where TimeUpdated > DATEADD(MINUTE, -10, @today))

INSERT INTO VitalStats_CCU (UpdateTime, CCU) VALUES (@today, @CCU );
	    
END
GO
/****** Object:  StoredProcedure [dbo].[WO_RECORD_DAILY_STATS]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_RECORD_DAILY_STATS]
AS
BEGIN

	SET NOCOUNT ON;


declare @today datetime
set @today = GETDATE()

declare @Visitors int;
declare @TUsersLogin int;
declare @TUsersActive int;
declare @TUsersJoined int;
declare @TUsersPlayed int;

declare @NewVisitors int;
declare @NewActived int;

declare @MAUL int;
declare @MAUJ int;
declare @MAUP int;
declare @DAUL int;
declare @DAUJ int;
declare @DAUP int;


set @Visitors = (select count(*) from LoginID)
set @TUsersLogin = (select count(*) from LoginID where AccountStatus>100 and lastlogindate > '3-28-2010 00:00:00')
set @TUsersActive = (select count(*) from LoginID where AccountStatus>100 )
set @TUsersJoined = (select count(*) from LoginID where AccountStatus>100 and lastjoineddate > '3-28-2010 00:00:00')
set @TUsersPlayed = (select count(*) from LoginID where AccountStatus>100 and lastgamedate > '3-28-2010 00:00:00')

set @NewVisitors = (select count(*) from LoginID where dateregistered >DATEADD(day, -1, @today))
set @NewActived = (select count(*) from LoginID where dateregistered >DATEADD(day, -1, @today) and AccountStatus>100)


set @MAUL = (select count(*) from LoginID where lastlogindate > DATEADD(day, -31, @today) )
set @MAUJ = (select count(*) from LoginID where lastjoineddate > DATEADD(day, -31, @today) )
set @MAUP = (select count(*) from LoginID where lastgamedate > DATEADD(day, -31, @today) )


set @DAUL = (select count(*) from LoginID where lastlogindate > DATEADD(hour, -25, @today) )
set @DAUJ = (select count(*) from LoginID where lastjoineddate > DATEADD(hour, -25, @today) )
set @DAUP = (select count(*) from LoginID where lastgamedate > DATEADD(hour, -25, @today) )


declare @CashPaying int;
declare @Cash24Paying int;
declare @Cash24Num int;

declare @Cash24Total float;
declare @CashTotal float;

declare @CashM float;
declare @CashMPaying int;

declare @ARPU float;
declare @ARPPU float;


set @CashPaying = (SELECT COUNT (distinct CustomerID) FROM FinancialTransactions where TransactionType=1000 )
set @CashTotal = (SELECT SUM(Amount) FROM FinancialTransactions where TransactionType=1000 )

set @Cash24Num= (select count(*) from FinancialTransactions where DateTime > DATEADD(hour, -26, @today ) and TransactionType = 1000)
set @Cash24Paying = (SELECT COALESCE(COUNT (distinct CustomerID),0) FROM FinancialTransactions where DateTime > DATEADD(hour, -26, @today ) and TransactionType=1000 )
set @Cash24Total = (SELECT COALESCE(SUM(Amount),0) FROM FinancialTransactions where DateTime >DATEADD(hour, -26, @today ) and TransactionType=1000 )

set @CashM = (SELECT COALESCE(SUM(Amount),0) FROM FinancialTransactions where DateTime >DATEADD(day, -32, @today ) and TransactionType=1000 )
set @CashMPaying = (SELECT COALESCE(COUNT (distinct CustomerID),0) FROM FinancialTransactions where DateTime >DATEADD(day, -32, @today ) and TransactionType=1000 )

set @ARPU = @CashM/(@MAUP)
set @ARPPU = @CashM/(@CashMPaying)

declare @PlayedToday int;


set @PlayedToday = (select count(distinct GameSessionID ) from DBG_UserRoundResults where GameReportTime > DATEADD(day, -1, GETDATE()))

INSERT INTO VitalStatsV3 (	UpdateTime, TotalVisitors, TotalUsersLogin, TotalUsersActivated, TotalUsersJoined, TotalUsersPlayed, 	NewRegistered,	NewActivated,	MAU_Login,	MAU_Joined,	MAU_Played,	DAU_Login,	DAU_Joined, 	DAU_Played,	Cash24Num,	Cash24Total,	Cash24Paying,	CashTotal,	CashPaying,	ARPU,	ARPPU,	PlayedToday) VALUES (@today, @Visitors, @TUsersLogin, @TUsersActive, @TUsersJoined, @TUsersPlayed, @NewVisitors, @NewActived, @MAUL, @MAUJ,  @MAUP,@DAUL,  @DAUJ,  @DAUP, @Cash24Num, @Cash24Total,@Cash24Paying, @CashTotal,@CashPaying,@ARPU,@ARPPU,@PlayedToday );

	    
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_AddLogInfo]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SRV_AddLogInfo]
	@in_CustomerID int,
	@in_CustomerIP varchar(64),
	@in_GameSessionID bigint,
	@in_CheatID int,
	@in_Msg varchar(4000),
	@in_Data varchar(4000)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- see if this event is recurring inside single game session
	declare @RecordID int
	select @RecordID=RecordID from DBG_SrvLogInfo where
		GameSessionID=@in_GameSessionID 
		and CustomerID=@in_CustomerID
		and (@in_CheatID > 0 and CheatID=@in_CheatID)
		and @in_Msg=Msg 
		and @in_Data=Data
	if(@@ROWCOUNT > 0) begin
		-- increase count
		update DBG_SrvLogInfo set RepeatCount=RepeatCount+1 where RecordID=@RecordID

		select 0 as ResultCode
		return
	end
	
	insert into DBG_SrvLogInfo (
		ReportTime,
		IsProcessed,
		CustomerID,
		CustomerIP,
		GameSessionID,
		CheatID,
		RepeatCount,
		Msg,
		Data)
	values (
		GETDATE(),
		0,
		@in_CustomerID,
		@in_CustomerIP,
		@in_GameSessionID,
		@in_CheatID,
		1,
		@in_Msg,
		@in_Data)
		
	-- we're done
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_AddCheatAttempt]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SRV_AddCheatAttempt]
	@in_IP char(32),
	@in_CustomerID int,
	@in_GameSessionID bigint,

	@in_CheatID int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO CheatLog (SessionID, CustomerID, CheatID, ReportTime)
	VALUES               (@in_GameSessionID, @in_CustomerID, @in_CheatID, GETDATE())

	-- increase cheat attempts
	update Stats set CheatAttempts=(CheatAttempts+1) where CustomerID=@in_CustomerID

	-- we're done
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SkillReset]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SkillReset]
	@in_CustomerID int,
	@in_LoadoutID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from Profile_Chars where LoadoutID=@in_LoadoutID
	if(@CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad loadout' as ResultMsg
		return
	end
	
	select 0 as ResultCode
	
	update Profile_Chars set SpendSP1=0, SpendSP2=0, SpendSP3=0, Skills='' where LoadoutID=@in_LoadoutID
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SkillLearnSetLoadout]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SkillLearnSetLoadout]
	@in_CustomerID int,
	@in_LoadoutID int,
	@in_SpendSP1 int,
	@in_SpendSP2 int,
	@in_SpendSP3 int,
	@in_Skills varchar(64)
AS
BEGIN
	SET NOCOUNT ON;
	
	select 0 as ResultCode
	
	-- convert to CURRENT size of Profile_Chars.Skills.
	declare @Skills char(31) = @in_Skills

	-- no checks, they was done in api_SkillLearn.aspx
	update Profile_Chars set 
		SpendSP1=@in_SpendSP1,
		SpendSP2=@in_SpendSP2,
		SpendSP3=@in_SpendSP3,
		Skills=@in_Skills 
		where LoadoutID=@in_LoadoutID
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SkillLearnPrepare]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SkillLearnPrepare]
	@in_CustomerID int,
	@in_LoadoutID int,
	@in_SkillID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @SkillPoints int = 0
	select @SkillPoints=SkillPoints from LoginID where CustomerID=@in_CustomerID
	if(@@ROWCOUNT=0) begin
		select 6 as ResultCode, 'no customer' as ResultMsg
		return
	end
	
	declare @CustomerID int = 0
	declare @SpendSP1 int
	declare @SpendSP2 int
	declare @SpendSP3 int
	declare @Class int
	declare @Skills varchar(64)
	select 
		@CustomerID=CustomerID, 
		@Class=Class,
		@SpendSP1=SpendSP1, 
		@SpendSP2=SpendSP2, 
		@SpendSP3=SpendSP3, 
		@Skills=Skills
		from Profile_Chars where LoadoutID=@in_LoadoutID
	if(@CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad loadout' as ResultMsg
		return
	end
	
	select 0 as ResultCode
	
	select 
		@SkillPoints as 'PlayerSP',
		@SpendSP1 as 'SpendSP1',
		@SpendSP2 as 'SpendSP2',
		@SpendSP3 as 'SpendSP3',
		@Class as 'Class',
		@Skills as 'Skills'

	select * from DataSkill2Price where SkillID=@in_SkillID
END
GO
/****** Object:  StoredProcedure [dbo].[FN_VALIDATE_LOADOUT_ITEM]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_VALIDATE_LOADOUT_ITEM] 
	@in_IP varchar(100),
	@in_CustomerID int,
	@in_ItemID int,
	@in_EquipIdx int
AS
BEGIN
	SET NOCOUNT ON;
	
	if @in_ItemID = 0
		return 0

	if not exists (SELECT ItemID from Inventory WHERE ItemID=@in_ItemID and CustomerID=@in_CustomerID and LeasedUntil>GETDATE()) begin
		return 0
	end

	-- item is valid
	return @in_ItemID
END
GO
/****** Object:  StoredProcedure [dbo].[FN_RemoveOneItemFromUser]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_RemoveOneItemFromUser]
	@in_CustomerID int,
	@in_ItemId int
AS
BEGIN
	SET NOCOUNT ON;

	declare @Quantity int = 0
	select @Quantity=Quantity from Inventory where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	if(@@ROWCOUNT = 0)
		return

	-- update item quantity
	set @Quantity = @Quantity - 1
	if(@Quantity <= 0)
		delete from Inventory where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	else
		update Inventory set Quantity=@Quantity where CustomerID=@in_CustomerID and ItemID=@in_ItemID

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_MatomyLinkUser]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_MatomyLinkUser]
	@in_CustomerID int,
	@in_ce_pub varchar(32),
	@in_ce_cid varchar(64)
AS
BEGIN
	SET NOCOUNT ON;
	
	if exists (select CustomerID from MatomyUserMap where CustomerID=@in_CustomerID)
	begin
		select 0 as ResultCode, 'User is already linked' as ResultMsg
		return
	end
	
	insert into MatomyUserMap values (
		@in_CustomerID,
		@in_ce_pub,
		@in_ce_cid,
		GETDATE(),
		0,
		'1970-01-01'
		)

	-- done
	select 0 as ResultCode, '' as ResultMsg
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_MatomyDoConversion]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_MatomyDoConversion]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @ce_pub varchar(32)
	declare @ce_cid varchar(64)
	declare @IsConverted int
	select 
		@ce_pub=ce_pub,
		@ce_cid=ce_cid,
		@IsConverted=IsConverted
	from MatomyUserMap where CustomerID=@in_CustomerID
	
	if(@@ROWCOUNT = 0) begin
		-- not matomy user
		select 1 as ResultCode, '' as ce_pub, '' as ce_cid
		return
	end
	
	if(@IsConverted > 0) begin
		-- already converted
		select 2 as ResultCode, '' as ce_pub, '' as ce_cid
		return
	end

	update MatomyUserMap set IsConverted=1, DateConverted=GETDATE() 
		where CustomerID=@in_CustomerID

	-- converted
	select 0 as ResultCode, @ce_pub as ce_pub, @ce_cid as ce_cid
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_LOGIN]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_LOGIN]
	@in_Username varchar(100), 
	@in_Password varchar(100),
	@in_IP varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	declare @CustomerID int
	declare @AccountStatus int
	declare @MD5Password varchar(100)
	declare @AccountName varchar(100)

	-- search for record with username
	SELECT 
		@CustomerID=CustomerID,
		@MD5Password=MD5Password,
		@AccountStatus=AccountStatus,
		@AccountName=AccountName
	FROM LoginID 
	WHERE AccountName=@in_Username
	if (@@RowCount = 0) begin
		--EXEC FN_ADD_SECURITY_LOG 100, @in_IP, 0, @in_Username
		select
			0 as CustomerID,
			0 as AccountStatus
		return
	end
	
	-- check MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	if(@MD5Password <> @MD5FromPwd) begin
		--EXEC FN_ADD_SECURITY_LOG 101, @in_IP, @CustomerID, ''
		select
			0 as CustomerID,
			0 as AccountStatus
		return
	end

	-- status greater or equal to 200 means that user is banned
	if (@AccountStatus >= 200) begin
		select
			0 as CustomerID,
			@AccountStatus as AccountStatus
		return
	end
	
	-- check if that is gamerstfirst user
	declare @GamersfirstID int = 0
	select @GamersfirstID=GamersfirstID from GamersfirstUserIDMap where CustomerID=@CustomerID

	select
		@CustomerID as CustomerID,
		@AccountStatus as AccountStatus,
		@AccountName as AccountName,
		@GamersfirstID as GamersfirstID
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_GETALLITEMS1]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_GETALLITEMS1] 
	@pkey char(32) = 'wrong app key'
AS
BEGIN
	SET NOCOUNT ON;

	if (@pkey != 'ACOR4823G%sjYU*@476xnDvYaK@!56' )
	begin

		select -1 as CustomerID;

		print 'WRONG API KEY'
	 return;
	end


SELECT * FROM Items_Weapons
SELECT * FROM Items_Gear
SELECT * FROM Items_Generic
SELECT * FROM Items_Packages

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_GETACCOUNTINFO]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_GETACCOUNTINFO] 
	@in_CustomerID int,
	@in_db_apikey varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	if(@in_db_apikey != 'ACOR4823G%sjYU*@476xnDvYaK@!56') begin
		print 'WRONG API KEY'
		return;
	end

	-- check if CustomerID is valid
	if not exists (SELECT CustomerID FROM LoginID WHERE CustomerID=@in_CustomerID)
	begin
		return;
	end

	SELECT *
	FROM LoginID 
	JOIN Stats ON (LoginID.CustomerID = Stats.CustomerID) 
	JOIN ProfileData ON (LoginID.CustomerID = ProfileData.CustomerID) 
	where LoginID.CustomerID=@in_CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_CREATEACCOUNT_CHECK]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_CREATEACCOUNT_CHECK]
	@in_Username varchar(16),
	@in_Email varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	-- validate that username & email is unique
	if exists (SELECT CustomerID FROM LoginID WHERE AccountName=@in_Username) begin
		select 1 as ResultCode, 'Username already in use' as ResultMsg;
		return;
	end
	if exists (SELECT CustomerID FROM LoginID WHERE Gamertag=@in_Username) begin
		select 1 as ResultCode, 'Gamertag already in use' as ResultMsg;
		return;
	end
	if exists (SELECT CustomerID from AccountInfo WHERE email=@in_Email) begin
		select 2 as ResultCode, 'Email already in use' as ResultMsg;
		return;
	end

	-- done
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_CREATEACCOUNT]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_CREATEACCOUNT]
	@in_IP varchar(64),
	@in_Username varchar(16),
	@in_Password varchar(16), 
	@in_Email varchar(100),
	@in_Reg_SID varchar(128),
	@in_ReferralID int
AS
BEGIN
	SET NOCOUNT ON;

	-- validate that username & email is unique
	if exists (SELECT CustomerID FROM LoginID WHERE AccountName=@in_Username) begin
		select 1 as ResultCode, 'Username already in use' as ResultMsg;
		return;
	end
	if exists (SELECT CustomerID FROM LoginID WHERE Gamertag=@in_Username) begin
		select 1 as ResultCode, 'Gamertag already in use' as ResultMsg;
		return;
	end
	if exists (SELECT CustomerID from AccountInfo WHERE email=@in_Email) begin
		select 2 as ResultCode, 'Email already in use' as ResultMsg;
		return;
	end
	-- do not allow to use 10minute emails
	if (CHARINDEX('@nepwk.com', @in_Email) > 0) OR 
	   (CHARINDEX('@TempEMail.net', @in_Email) > 0) OR 
	   (CHARINDEX('@sharklasers.com', @in_Email) > 0) OR 
	   (CHARINDEX('@mailinator.com', @in_Email) > 0) OR 
	   (CHARINDEX('@yopmail.com', @in_Email) > 0) OR 
	   (CHARINDEX('@tempinbox.com', @in_Email) > 0) begin
		select 2 as ResultCode, 'Email already in use' as ResultMsg;
		return;
	end

	-- create user
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	INSERT INTO LoginID 
		(AccountName, Password, Gamertag, dateregistered, ReferralID, MD5Password, reg_sid) 
		VALUES 
		(@in_Username, '', @in_Username, GETDATE(), @in_ReferralID, @MD5FromPwd, @in_Reg_SID)

	declare @CustomerID int
	SELECT @CustomerID=CustomerID from LoginID where AccountName=@in_Username

	-- create user
	INSERT INTO AccountInfo (CustomerID, email) VALUES (@CustomerID, @in_Email)
	INSERT INTO Stats (CustomerID) VALUES (@CustomerID)
	INSERT INTO ProfileData (CustomerID) VALUES (@CustomerID)
	
	-- NOTE: no default items is added, because they will be added in WelcomePackage
	-- but you can add new items based on @RefferalID
	
	/*
	-- IGN CODE
	if(@in_ReferralID = 23793) begin
		exec FN_AddItemToUser @CustomerID, 101209, 2000
		exec FN_AddItemToUser @CustomerID, 20029, 2000
		exec FN_AddItemToUser @CustomerID, 20031, 2000
		exec FN_AddItemToUser @CustomerID, 301000, 7
	end
	*/
	
	-- REFERAL ID PROMO
	-- functactix.com 
	--if(@in_ReferralID = 1288885485) begin
		-- no rewards. rev share link
	--end
	
	-- done
	select 0 as ResultCode, @CustomerID as CustomerID
	select @CustomerID as CustomerID
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_CHANGEPASSWORD]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_CHANGEPASSWORD]
	@in_IP varchar(100),
	@in_CustomerID int, 
	@in_Password varchar(100),
	@in_NewPassword varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	declare @MD5Password varchar(100)

	-- search for record with username
	SELECT @MD5Password=MD5Password	FROM LoginID 
	WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'No CustomerID' as ResultMsg
		return
	end

	-- check MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	if(@MD5Password <> @MD5FromPwd) begin
		select 6 as ResultCode, 'Wrong Password' as ResultMsg
		return
	end
	
	-- update new password
	exec FN_CreateMD5Password @in_NewPassword, @MD5FromPwd OUTPUT
	update LoginID set MD5Password=@MD5FromPwd where CustomerID=@in_CustomerID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[DB_PurgeUnusedUserData]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Denis Zhulitov
-- Create date: 03/15/2011
-- Description:	deleting unused records from tables if user record was deleted
-- =============================================
CREATE PROCEDURE [dbo].[DB_PurgeUnusedUserData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from AccountInfo
	where not exists (select * from LoginID where LoginID.CustomerID = AccountInfo.CustomerID)
	select @@RowCount as Deleted, 'AccountInfo' as FromTable

	delete from Profile_Chars
	where not exists (select * from LoginID where LoginID.CustomerID = Profile_Chars.CustomerID)
	select @@RowCount as Deleted, 'Profile_Chars' as FromTable

	delete from ProfileData
	where not exists (select * from LoginID where LoginID.CustomerID = ProfileData.CustomerID)
	select @@RowCount as Deleted, 'ProfileData' as FromTable

	delete from Stats
	where not exists (select * from LoginID where LoginID.CustomerID = Stats.CustomerID)
	select @@RowCount as Deleted, 'Stats' as FromTable

	delete from Logins
	where not exists (select * from LoginID where LoginID.CustomerID = Logins.CustomerID)
	select @@RowCount as Deleted, 'Logins' as FromTable

	delete from Inventory
	where not exists (select * from LoginID where LoginID.CustomerID = Inventory.CustomerID)
	select @@RowCount as Deleted, 'Inventory' as FromTable

	delete from Inventory_FPS
	where not exists (select * from LoginID where LoginID.CustomerID = Inventory_FPS.CustomerID)
	select @@RowCount as Deleted, 'Inventory_FPS' as FromTable

	delete from SteamUserIDMap
	where not exists (select * from LoginID where LoginID.CustomerID = SteamUserIDMap.CustomerID)
	select @@RowCount as Deleted, 'SteamUserIDMap' as FromTable

	delete from GamersfirstUserIDMap
	where not exists (select * from LoginID where LoginID.CustomerID = GamersfirstUserIDMap.CustomerID)
	select @@RowCount as Deleted, 'GamersfirstUserIDMap' as FromTable
	
	-- purge inventory
	declare @InvCleanDate datetime = DATEADD(day, -30, GETDATE())
	delete from Inventory where LeasedUntil<@InvCleanDate
	delete from Inventory_FPS where LeasedUntil<@InvCleanDate
	
END
GO
/****** Object:  StoredProcedure [dbo].[DBG_ShowCheatersAcc]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DBG_ShowCheatersAcc]
AS
BEGIN
	SET NOCOUNT ON;

	select LoginID.AccountName, DBG_UserRoundResults.* from DBG_UserRoundResults 
		join LoginID on LoginId.CustomerID=DBG_UserRoundResults.CustomerID
		where ShotsFired>50 and ShotsHits>ShotsFired*0.9
		and exists (select CustomerID from LoginID 
			where LoginID.CustomerID=DBG_UserRoundResults.CustomerID 
				and LoginID.AccountStatus<200
			)
		order by GameReportTime desc
		
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_UserInviteGetStatus2]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_UserInviteGetStatus2] 
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	select Gamertag, 
		email,
		lastgamedate,
		(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc) as 'Rank'
	from LoginID 
	join AccountInfo on AccountInfo.CustomerID=LoginID.CustomerID
	where ReferralID=@in_CustomerID
	order by Rank desc

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddAttachmentToUser]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddAttachmentToUser]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_AttachmentID int,
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;

	declare @LeasedUntil datetime
	declare @CurDate datetime = GETDATE()
       
	select @LeasedUntil=LeasedUntil from Inventory_FPS where (CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and AttachmentID=@in_AttachmentID)
	if(@@ROWCOUNT = 0)
	begin
		-- detect attachment slot
		declare @Slot int = 0
		select @Slot=[Type] from Items_Attachments where ItemID=@in_AttachmentID
		if(@@ROWCOUNT = 0) begin
			-- error, no attachment. unfortunately we can't report this...
			return
		end

		-- check if we have equipped item in same slot
		declare @NumEquipped int = 0
		select @NumEquipped = count(*) from Inventory_FPS where CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and Slot=@Slot and IsEquipped > 0

		-- add new attachment and equip it
		INSERT INTO Inventory_FPS (
			CustomerID, 
			WeaponID, 
			AttachmentID,
			LeasedUntil,
			Slot,
			IsEquipped
			)
			VALUES (
			@in_CustomerID,
			@in_WeaponID,
			@in_AttachmentID,
			DATEADD(day, @in_ExpDays, @CurDate),
			@Slot,
			0
			)

		-- if new attachment, equip it
		if(@NumEquipped = 0)
		begin
			update Inventory_FPS set IsEquipped=1 
				where CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and AttachmentID=@in_AttachmentID
		end

		return
	end
       
	if(@LeasedUntil < @CurDate)
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @CurDate)
	else
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @LeasedUntil)
               
	if(@LeasedUntil > '2020-1-1')
		set @LeasedUntil = '2020-1-1'

	UPDATE Inventory_FPS SET 
		LeasedUntil=@LeasedUntil
	WHERE (CustomerID=@in_CustomerID and WeaponID=@in_WeaponID and AttachmentID=@in_AttachmentID)
END
GO
/****** Object:  StoredProcedure [dbo].[FN_ADD_SECURITY_LOG]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FN_ADD_SECURITY_LOG] 
	-- Add the parameters for the stored procedure here
	@EventID int,
	@IP varchar(64),
	@CustomerID int,
	@EventData varchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SecurityLog
		(EventID, Date, IP, CustomerID, EventData) 
	VALUES 
		(@EventID, GETDATE(), @IP, @CustomerID, @EventData)

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_PwdResetRequest]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_PwdResetRequest]
	@in_IP varchar(100),
	@in_email varchar(128)
AS
BEGIN
	SET NOCOUNT ON
	
	declare @CustomerID int
	select @CustomerID=CustomerID from AccountInfo where email=@in_email
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'No email' as ResultMsg
		return
	end
	
	-- generate password reset token
	declare @token varchar(100) = CONVERT(varchar(100), NEWID())
	set @token = SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5', @token)), 3, 999)
	
	DELETE FROM AccountPwdReset where token=@token
	INSERT INTO AccountPwdReset
		(RequestTime, IP, token, CustomerID, email)
		VALUES
		(GETDATE(), @in_IP, @token, @CustomerID, @in_email)

	select 0 as ResultCode, @token as 'token'
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_PwdResetExec]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_PwdResetExec]
	@in_IP varchar(100),
	@in_token varchar(128),
	@in_NewPassword varchar(100)
AS
BEGIN
	SET NOCOUNT ON
	
	declare @CustomerID int
	declare @RequestTime datetime
	declare @email varchar(100)
	select 
		@CustomerID=CustomerID, 
		@RequestTime=RequestTime,
		@email=email
	from AccountPwdReset where token=@in_token
	if(@@ROWCOUNT = 0) begin
		select 1 as ResultCode, 'Bad Token' as ResultMsg
		return
	end
	
	-- check if token expired
	if(GETDATE() > DATEADD(hour, 2, @RequestTime)) begin
		select 2 as ResultCode, 'Token Expired' as ResultMsg
		return
	end

	-- create MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_NewPassword, @MD5FromPwd OUTPUT
	-- and set it
	update LoginID set MD5Password=@MD5FromPwd where CustomerID=@CustomerID
	
	-- clear that token
	delete from AccountPwdReset where token=@in_token
	
	-- get account name and return user info
	declare @AccountName varchar(64) = ''
	select @AccountName=AccountName from LoginID where CustomerID=@CustomerID
	
	select 0 as ResultCode, @email as 'email', @AccountName as 'AccountName'
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_PROCESSTRANSACTION_CHECK]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_PROCESSTRANSACTION_CHECK]
	@in_CustomerID int,
	@in_DoBlock int
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_DoBlock > 0) begin
		-- block user
		delete from FinancialBlocks where CustomerID=@in_CustomerID
		insert into FinancialBlocks values (@in_CustomerID, GETDATE())
		return
	end
	
	-- check block status
	declare @LastBlockedTime datetime
	select @LastBlockedTime=LastBlockedTime from FinancialBlocks where CustomerID=@in_CustomerID
	if(@@ROWCOUNT = 0) begin
		select 0 as 'Blocked'
	end
	
	-- enforce 60 sec delay between blocked transactions
	declare @secs int = DATEDIFF(second, @LastBlockedTime, GETDATE())
	if(@secs < 60) begin
		select 1 as 'Blocked'
	end
	
	select 0 as 'Blocked'
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_Unsubscribe]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_Unsubscribe]
	@in_Email varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	declare @CustomerID as int
	declare @OptOut1 as int
	SELECT @CustomerID=CustomerID, @OptOut1=OptOut1 from AccountInfo where email=@in_Email
	if(@@ROWCOUNT = 0) begin
		-- no email
		select 3 as 'ResultCode', 'bad email' as 'ResultMsg'
		return
	end
	
	if(@OptOut1 > 0) begin
		-- already unsubscribed or blocked
		select 0 as 'ResultCode'
		return
	end

	-- unsubscribe	
	update AccountInfo set OptOut1=1 where CustomerID=@CustomerID
	select 0 as 'ResultCode'
	return
		
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_TEST]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_TEST]
       @itemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from SecurityLog
	
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_SETPASSWORD]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_SETPASSWORD]
	@in_CustomerID int, 
	@in_NewPassword varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	-- create MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_NewPassword, @MD5FromPwd OUTPUT
	
	-- and set it
	update LoginID set MD5Password=@MD5FromPwd where CustomerID=@in_CustomerID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_ReportHWInfo_CustomerID]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pavel Tumik
-- Create date: Jun 7, 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ECLIPSE_ReportHWInfo_CustomerID] 
	@in_IP varchar(100),
	@in_CustomerID int,
	@r00 bigint,
	@r10 varchar(128),
	@r11 varchar(128),
	@r12 int,
	@r13 int,
	@r20 int,
	@r21 int,
	@r22 int,
	@r23 int,
	@r24 int,
	@r25 varchar(128),
	@r30 varchar(32)
AS
BEGIN
	SET NOCOUNT ON;

	-- insert new record in case we didn't had it
	if not exists (SELECT ComputerID FROM DBG_HWInfo WHERE ComputerID=@r00) begin
		insert into DBG_HWInfo (ComputerID, CustomerID) values (@r00, 0)
	end
	
	UPDATE DBG_HWInfo SET
		CustomerID=@in_CustomerID,
		ReportDate=GETDATE(),
		CPUName=@r10,
		CPUBrand=@r11,
		CPUFreq=@r12,
		TotalMemory=@r13,
		DisplayW=@r20,
		DisplayH=@r21,
		gfxErrors=@r22,
		gfxVendorId=@r23,
		gfxDeviceId=@r24,
		gfxDescription=@r25,
		OSVersion=@r30
	WHERE ComputerID=@r00

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_ReferralsLogPixel]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_ReferralsLogPixel]
	@in_CustomerID int,
	@in_ReferralID int,
	@in_PixelUrl varchar(128),
	@in_ErrorMsg varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	insert into DBG_RefPixelLog
		(CustomerID, ReferralID, PixelUrl, PixelCallTime, ErrorMsg)
		values
		(@in_CustomerID, @in_ReferralID, @in_PixelUrl, GETDATE(), @in_ErrorMsg)

	return
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_ReferralsGetUserInfo]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_ReferralsGetUserInfo]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	declare @ReferralID int = 0
	declare @reg_sid varchar(128) = ''
	select @ReferralID=ReferralID, @reg_sid=reg_sid from LoginID where CustomerID=@in_CustomerID
	
	-- TODO: (think) check DBG_RefPixelLog to avoid double pixel firing?
	
	select @ReferralID as 'ReferralID', @reg_sid as 'reg_sid'
END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_RadiumGiveBonus]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_RadiumGiveBonus] 
	@in_CustomerID int,
	@in_Amount int,
	@in_TrackId varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO FinancialTransactions VALUES (
		@in_CustomerID, 
		@in_TrackId, 
		1002, 
		GETDATE(), 
		@in_Amount, 
		'RADIUM', 
		'APPROVED', 
		'RADIUM_BONUS')
		
	exec FN_AlterUserGP @in_CustomerID, @in_Amount, 'RadiumBonus'
	select 0 as 'ResultCode'
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_RetBonusGiveBonus]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[WO_RetBonusGetInfo]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_RetBonusGetInfo]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode

	-- detect retention days
	declare @out_RetDays int
	exec WO_RetBonusFN_CheckDays @in_CustomerID, @out_RetDays out

	-- calc minutes to next day
	declare @lastRetBonusDate datetime
	select @lastRetBonusDate=lastRetBonusDate from LoginID where CustomerID=@in_CustomerID
	declare @NextDay datetime = DATEADD(day, 1, @lastRetBonusDate)
	declare @MinsToNextDay int = DATEDIFF(minute, GETDATE(), @NextDay) % (24*60)
	while(@MinsToNextDay < 0) begin 
		set @MinsToNextDay = @MinsToNextDay + (24*60)
	end

	if (@out_RetDays > 10 ) begin -- temp, need proper fix. do not return @out_RetDays bigger than DataRetentionBonuses elements
	 set @out_RetDays = 10
	end
	select @out_RetDays as 'RetDays', @MinsToNextDay as 'MinsToNextDay'

	-- get bonuses list
	select Bonus from DataRetentionBonuses order by [Day] asc

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LootSellLootBox]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LootSellLootBox]
	@in_CustomerID int,
	@in_ItemID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @SellGD int = 0
	
	-- check if this item is actually a loot box and have sell price (in GD, Permanent)
	select @SellGD=GPriceP from Items_Generic where ItemID=@in_ItemID and Category=7
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no loot box' as ResultMsg
		return
	end
	if(@SellGD = 0) begin
		select 6 as ResultCode, 'no loot box sell price set' as ResultMsg
		return
	end
	
	-- check if we actually have that box in inventory
	declare @Quantity int = 0
	select @Quantity=Quantity from Inventory where CustomerID=@in_CustomerID and ItemID=@in_ItemID
	if(@@ROWCOUNT = 0 or @Quantity < 1) begin
		select 6 as ResultCode, 'no loot box in inventory' as ResultMsg
		return
	end

	-- sell item
	update LoginID set GameDollars=GameDollars+@SellGD where CustomerID=@in_CustomerID
	
	-- update item quantity
	exec FN_RemoveOneItemFromUser @in_CustomerID, @in_ItemID
	
	-- record that
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'LOOTBOX_SELL', 2003, GETDATE(), 
				@SellGD, '1', 'APPROVED', @in_ItemId)

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_RemoveItem]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SRV_RemoveItem]
	@in_CustomerID int,
	@in_ItemID int
AS
BEGIN
	SET NOCOUNT ON;
	
	exec FN_RemoveOneItemFromUser @in_CustomerID, @in_ItemID
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_GIVEITEM_IN_MINUTES]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pavel Tumik
-- Create date: May 24, 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[WO_SRV_GIVEITEM_IN_MINUTES] 
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyMinutes int,
	@in_skey2 varchar(64)
AS
BEGIN
	if(@in_skey2 != 'ACsR4x23GsjYU*476xnDvYXK@!56')
	begin
		EXEC FN_ADD_SECURITY_LOG 251, @in_IP, @in_CustomerID, @in_skey2
		select 6 as ResultCode
		return;
	end

	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME_SRV', 2002, GETDATE(), 
				0, '1', 'APPROVED', @in_ItemId)

	if(@in_ItemId = 301004) begin
	-- premium acc
		select 0 as ResultCode
	end 
	else begin
		-- add that item
		exec FN_AddItemToUserInMin @in_CustomerID, @in_ItemId, @in_BuyMinutes
	end

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_Login]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_Login]
	@in_IP varchar(100),
	@in_Username varchar(100), 
	@in_Password varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	declare @CustomerID int
	declare @AccountStatus int
	declare @MD5Password varchar(100)

	-- this call is always valid
	select 0 as ResultCode
	
	-- search for record with username
	SELECT 
		@CustomerID=CustomerID,
		@AccountStatus=AccountStatus,
		@MD5Password=MD5Password
	FROM LoginID 
	WHERE AccountName=@in_Username
	if (@@RowCount = 0) begin
		--EXEC FN_ADD_SECURITY_LOG 100, @in_IP, 0, @in_Username
		select
			1 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus
		return
	end

	-- check MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	if(@MD5Password <> @MD5FromPwd) begin
		--EXEC FN_ADD_SECURITY_LOG 101, @in_IP, @CustomerID, ''
		select
			2 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus
		return
	end
	
	-- perform actual login
	exec WO_LoginFN_Exec @in_IP, @CustomerID, @AccountStatus
END
GO
/****** Object:  StoredProcedure [dbo].[WO_G1Login]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_G1Login]
	@in_IP varchar(100),
	@in_G1ID bigint
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode

	-- find customer id based on id
	declare @CustomerID int
	select @CustomerID=CustomerID from GamersfirstUserIDMap where GamersfirstID=@in_G1ID
	if (@@RowCount = 0) begin
		select
			1 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus,
			0 as SessionID
		return
	end
	
	-- get AccountStatus from LoginID
	declare @AccountStatus int
	select @AccountStatus=AccountStatus from LoginID where CustomerID=@CustomerID
	if (@@RowCount = 0) begin
		-- some crap happened - we have broken relationship between GamersfirstID-CustomerID
		-- delete that record, just in case.
		delete from GamersfirstUserIDMap where CustomerID=@CustomerID and GamersfirstID=@in_G1ID
		select
			9 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus,
			0 as SessionID
		return
	end
	
	-- login user
	exec WO_LoginFN_Exec @in_IP, @CustomerID, @AccountStatus
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetAccountInfo4]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetAccountInfo4] 
	@in_CustomerID int,
	@in_IsJoiningGame int
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID is valid
	if not exists (SELECT CustomerID FROM LoginID WHERE CustomerID=@in_CustomerID)
	begin
		select 6 as ResultCode
		return;
	end
	
	if(@in_IsJoiningGame > 0) begin
		update LoginID set lastjoineddate=GETDATE() where CustomerID=@in_CustomerID
	end

	select 0 as ResultCode

	SELECT LoginID.CustomerID, AccountStatus, GamePoints, GameDollars, HonorPoints, SkillPoints, Gamertag,
		Faction1Score, Faction2Score, Faction3Score, Faction4Score, Faction5Score,
		LoginID.ClanID, ClanRank, IsFPSEnabled, IsDeveloper,
		Kills, Deaths, ShotsFired, ShotsHits, Headshots, AssistKills, Wins, Losses, CaptureNeutralPoints, CaptureEnemyPoints, TimePlayed, 
		Skills, Abilities,
		ClanData.ClanTag, ClanData.ClanTagColor
	FROM LoginID 
	JOIN Stats ON (LoginID.CustomerID = Stats.CustomerID) 
	JOIN ProfileData ON (LoginID.CustomerID = ProfileData.CustomerID) 
	left JOIN ClanData on (LoginID.ClanID = ClanData.ClanID)
	where LoginID.CustomerID=@in_CustomerID
	
--
-- report loadouts
--
	select * from Profile_Chars where CustomerID=@in_CustomerID order by LoadoutID asc

-- 
--	report achievements
--
	select * from Achievements where CustomerID=@in_CustomerID

--
-- report weapon attachments
--	
	select 
		*,
		DATEDIFF(mi, GETDATE(), LeasedUntil) as MinutesLeft
	from Inventory_FPS
	where CustomerID=@in_CustomerID and LeasedUntil>GETDATE()
	order by WeaponID

--
-- report inventory
--
	select 
		*,
		DATEDIFF(mi, GETDATE(), LeasedUntil) as MinutesLeft
	from Inventory
	where CustomerID=@in_CustomerID and LeasedUntil>GETDATE()

--
-- report new items
--
	select ItemID from Items_Weapons where IsNew > 0 and (Price1+Price7+Price30+PriceP+GPrice1+GPrice7+GPrice30+GPriceP) > 0
	union select ItemID from Items_Gear where IsNew > 0 and (Price1+Price7+Price30+PriceP+GPrice1+GPrice7+GPrice30+GPriceP) > 0
	union select ItemID from Items_Generic where IsNew > 0 and (Price1+Price7+Price30+PriceP+GPrice1+GPrice7+GPrice30+GPriceP) > 0
	union select ItemID from Items_Packages where IsNew > 0 and (Price1+Price7+Price30+PriceP+GPrice1+GPrice7+GPrice30+GPriceP) > 0

--
-- report statistics
--
	exec WO_GetAccountDailyStats @in_CustomerID
	exec WO_GetAccountWeeklyStats @in_CustomerID
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SteamLogin]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SteamLogin]
	@in_IP varchar(100),
	@in_SteamID bigint
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode

	-- find customer id based on steam id
	declare @CustomerID int
	select @CustomerID=CustomerID from SteamUserIDMap where SteamID=@in_SteamID
	if (@@RowCount = 0) begin
		select
			1 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus,
			0 as SessionID
		return
	end
	
	-- get AccountStatus from LoginID
	declare @AccountStatus int
	select @AccountStatus=AccountStatus from LoginID where CustomerID=@CustomerID
	if (@@RowCount = 0) begin
		-- some crap happened - we have broken relationship between SteamID-CustomerID
		-- delete that record, just in case.
		delete from SteamUserIdMap where CustomerID=@CustomerID and SteamID=@in_SteamID
		select
			9 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus,
			0 as SessionID
		return
	end
	
	-- login user
	exec WO_LoginFN_Exec @in_IP, @CustomerID, @AccountStatus
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LoadoutModify]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LoadoutModify] 
	@in_CustomerID int,
	@in_LoadoutID int,
	@i1 int,
	@i2 int,
	@i3 int,
	@i4 int,
	@i5 int,
	@i6 int,
	@i7 int,
	@i8 int,
	@i9 int,
	@i10 int,
	@i11 int,
	@i12 int,
	@i13 int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- validate that player own that loadout	
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from Profile_Chars where LoadoutID=@in_LoadoutID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no loadout id' as ResultMsg
		return
	end
	
	if(@CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad customerid' as ResultMsg
		return
	end

--
-- verify all items against player inventory
--	
	EXEC @i1 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i1, 0
	EXEC @i2 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i2, 1
	EXEC @i3 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i3, 2
	EXEC @i4 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i4, 3
	EXEC @i5 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i5, 4
	EXEC @i6 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i6, 5
	EXEC @i7 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i7, 6
	EXEC @i8 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i8, 7
	EXEC @i9 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i9, 8
	EXEC @i10 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i10, 9
	EXEC @i11 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i11, 10
	EXEC @i12 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i12, 11
	EXEC @i13 = FN_VALIDATE_LOADOUT_ITEM '', @in_CustomerID, @i13, 12

	-- create loadout string.
	-- note that STR return leftpadded char of size 10
	declare @SlotData varchar(1000) = ''
	set @SlotData = LTRIM(STR(@i1)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i2)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i3)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i4)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i5)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i6)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i7)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i8)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i9)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i10)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i11)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i12)) + ' '
	set @SlotData = @SlotData + LTRIM(STR(@i13))
	
	-- update loadout slot
	UPDATE Profile_Chars SET Loadout=@SlotData where LoadoutID=@in_LoadoutID

	select 0 as ResultCode
	select @SlotData as 'Loadout'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_GetCreateGameKey3]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_GetCreateGameKey3]
	@in_IP varchar(32),
	@in_CustomerID int,
	@in_ServerID int,
	@in_BasicGame int
AS
BEGIN
	SET NOCOUNT ON;

	-- always return success
	select 0 as ResultCode
	
	declare @PREMIUM_ITEM_ID int = 301004

	-- basic games requires level 20+ or premium account
	-- premium game requires only premium account
	
	if(@in_BasicGame=1) begin
		-- check player's level, should be 20+ to create a game
		declare @honorPoints int = 0
		select @honorPoints=[HonorPoints] from LoginID where CustomerID=@in_CustomerID
		declare @HPLevel20 int = 0
		select @HPLevel20=[HonorPoints] from DataRankPoints where [Rank]=19 -- ranks in DB are starting from 1, hence check with 19
		if(@honorPoints<@HPLevel20) -- if not level 20+, then reject
		begin
			--check if user have premium account
			if not exists(
				select ItemID from Inventory 
					where (CustomerID = @in_CustomerID and ItemID = @PREMIUM_ITEM_ID))
			begin
				select 0 as CreateGameKey
				return
			end
		end
	end
	else begin
		--check if user have premium account
		if not exists(
			select ItemID from Inventory 
				where (CustomerID = @in_CustomerID and ItemID = @PREMIUM_ITEM_ID))
		begin
			select 0 as CreateGameKey
			return
		end
	end
	
	-- retrieve create game key from master server info
	declare @CreateGameKey int
	select @CreateGameKey=CreateGameKey from MasterServerInfo 
		where ServerID = @in_ServerID
	if(@@ROWCOUNT = 0) begin
		EXEC FN_ADD_SECURITY_LOG 301, @in_IP, @in_CustomerID, @in_ServerID
		select 0 as CreateGameKey
		return
	end

	select @CreateGameKey as CreateGameKey

END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanLeave]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanLeave]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- leader is leaving clan	
	if(@ClanRank = 0) 
	begin
		declare @NumClanMembers int
		select @NumClanMembers=COUNT(*) from LoginID where ClanID=@ClanID
		if(@NumClanMembers > 1) begin
			select 6 as ResultCode, 'owner cant leave - there is people left in clan' as ResultMsg
			return
		end

		-- generate clan event
		insert into ClanEvents (
			ClanID,
			EventDate,
			EventType,
			EventRank,
			Var1,
			Text1
		) values (
			@ClanID,
			GETDATE(),
			99, -- CLANEvent_Disband
			99, -- Visible to all
			@in_CustomerID,
			@Gamertag
		)
		
		-- and delete clan
		exec WO_ClanFN_DeleteClan @ClanID
		
		select 0 as ResultCode
		return
	end

	-- actual leave
	update LoginID set ClanID=0, ClanContributedGP=0, ClanContributedXP=0 where CustomerID=@in_CustomerID
	update ClanData set NumClanMembers=(NumClanMembers - 1) where ClanID=@ClanID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		5, -- CLANEvent_Left
		99, -- Visible to all
		@in_CustomerID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanDonateToMemberGP]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanDonateToMemberGP]
	@in_CustomerID int,
	@in_GP int,
	@in_MemberID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	declare @GamePoints int
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag, @GamePoints=GamePoints from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end
	
	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	select @MemberClanID=ClanID, @MemberGamerTag=GamerTag from LoginID where CustomerID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- donating
	if(@ClanRank > 0) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	declare @ClanGP int = 0
	select @ClanGP=ClanGP from ClanData where ClanID=@ClanID
	if(@in_GP < 0) begin
		select 6 as ResultCode, 'sneaky bastard...' as ResultMsg
		return
	end
	if(@in_GP > @ClanGP) begin
		select 6 as ResultCode, 'not enough GP in clan' as ResultMsg
		return
	end

	-- substract GP from clan
	update ClanData set ClanGP=(ClanGP-@in_GP) where ClanID=@ClanID

	-- add member gp
	exec FN_AlterUserGP @in_MemberID, @in_GP, 'fromclan'
	-- and record that
	INSERT INTO FinancialTransactions
		VALUES (@in_MemberID, 'CLAN_GPToMember', 4001, GETDATE(), 
				@in_GP, '1', 'APPROVED', @ClanID)
	
-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Var3,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		11, -- CLANEvent_DonateToMemberGP
		1, -- Visible to officers
		@in_CustomerID,
		@in_MemberID,
		@in_GP,
		@Gamertag,
		@MemberGamertag
	)
	
-- TODO: send message to player about donate

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_ClanDonateToClanGP]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_ClanDonateToClanGP]
	@in_CustomerID int,
	@in_GP int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	declare @GamePoints int
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag, @GamePoints=GamePoints from LoginID where CustomerID=@in_CustomerID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end
	
	if(@in_GP < 0) begin
		select 6 as ResultCode, 'sneaky bastard...' as ResultMsg
		return
	end
	if(@in_GP > @GamePoints) begin
		select 6 as ResultCode, 'not enough GP' as ResultMsg
		return
	end

	-- customer must have purchased GP
	if not exists (select * from FinancialTransactions where TransactionType=1000 and CustomerID=@in_CustomerID) begin
		select 26 as ResultCode, 'must have GP purchased' as ResultMsg
		return
	end
	-- most not be greater that sum of last 30 days purchases
	declare @BuyDate datetime = DATEADD(day, -30, GETDATE())
	declare @BuyAmount float = 0
	select @BuyAmount=SUM(amount) from FinancialTransactions where TransactionType=1000 and CustomerID=@in_CustomerID
	if(@in_GP > @BuyAmount) begin
		select 26 as ResultCode, '30 days limit' as ResultMsg
		return
	end
	
-- donating

	-- substract GP
	declare @AlterGP int = -@in_GP
	exec FN_AlterUserGP @in_CustomerID, @AlterGP, 'toclan'
	update LoginID set ClanContributedGP=(ClanContributedGP+@in_GP) where CustomerID=@in_CustomerID
	-- and record that
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'CLAN_GPToClan', 4000, GETDATE(), 
				@in_GP, '1', 'APPROVED', @ClanID)
	
	-- add clan gp
	update ClanData set ClanGP=(ClanGP+@in_GP) where ClanID=@ClanID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var3,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		10, -- CLANEvent_DonateToClanGP
		99, -- Visible to all
		@in_CustomerID,
		@in_GP,
		@Gamertag
	)

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddDefaultAttachments]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddDefaultAttachments]
	@in_CustomerID int,
	@in_WeaponID int,			-- weapon id for adding attachment
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @IsFPS int = 0
	declare @FPSAttach0 int = 0
	declare @FPSAttach1 int = 0
	declare @FPSAttach2 int = 0
	declare @FPSAttach3 int = 0
	declare @FPSAttach4 int = 0
	declare @FPSAttach5 int = 0
	declare @FPSAttach6 int = 0
	declare @FPSAttach7 int = 0
	declare @FPSAttach8 int = 0

	select 
		@IsFPS=IsFPS,
		@FPSAttach0=FPSAttach0,
		@FPSAttach1=FPSAttach1,
		@FPSAttach2=FPSAttach2,
		@FPSAttach3=FPSAttach3,
		@FPSAttach4=FPSAttach4,
		@FPSAttach5=FPSAttach5,
		@FPSAttach6=FPSAttach6,
		@FPSAttach7=FPSAttach7,
		@FPSAttach8=FPSAttach8
	from Items_Weapons where ItemID=@in_WeaponID

	if(@IsFPS > 0) begin
		if(@FPSAttach0 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach0, @in_ExpDays
		if(@FPSAttach1 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach1, @in_ExpDays
		if(@FPSAttach2 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach2, @in_ExpDays
		if(@FPSAttach3 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach3, @in_ExpDays
		if(@FPSAttach4 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach4, @in_ExpDays
		if(@FPSAttach5 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach5, @in_ExpDays
		if(@FPSAttach6 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach6, @in_ExpDays
		if(@FPSAttach7 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach7, @in_ExpDays
		if(@FPSAttach8 > 0) exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @FPSAttach8, @in_ExpDays
	end
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddWeaponSlotAttachments]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddWeaponSlotAttachments]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_SpecID int,
	@in_BuyDays int
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_SpecID = 0)
		return;
	
	declare @ItemID int

	DECLARE t_cursorWA CURSOR FOR select ItemID from Items_Attachments where SpecID=@in_SpecID
	OPEN t_cursorWA
	FETCH NEXT FROM t_cursorWA into @ItemID
	while @@FETCH_STATUS = 0 
	begin
		exec FN_AddAttachmentToUser @in_CustomerID, @in_WeaponID, @ItemID, @in_BuyDays

		FETCH NEXT FROM t_cursorWA into @ItemID
	end
	CLOSE t_cursorWA
	DEALLOCATE t_cursorWA

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddWeaponAllAttachments]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddWeaponAllAttachments]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_BuyDays int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- adding all attachments to already existing weapon
	--
	
	declare @FPSSpec0 int = 0
	declare @FPSSpec1 int = 0
	declare @FPSSpec2 int = 0
	declare @FPSSpec3 int = 0
	declare @FPSSpec4 int = 0
	declare @FPSSpec5 int = 0
	declare @FPSSpec6 int = 0
	declare @FPSSpec7 int = 0
	declare @FPSSpec8 int = 0

	select
		@FPSSpec0=FPSSpec0,
		@FPSSpec1=FPSSpec1,
		@FPSSpec2=FPSSpec2,
		@FPSSpec3=FPSSpec3,
		@FPSSpec4=FPSSpec4,
		@FPSSpec5=FPSSpec5,
		@FPSSpec6=FPSSpec6,
		@FPSSpec7=FPSSpec7,
		@FPSSpec8=FPSSpec8
	from Items_Weapons where ItemID=@in_WeaponID
	
	if(@FPSSpec0 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec0, @in_BuyDays
	if(@FPSSpec1 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec1, @in_BuyDays
	if(@FPSSpec2 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec2, @in_BuyDays
	if(@FPSSpec3 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec3, @in_BuyDays
	if(@FPSSpec4 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec4, @in_BuyDays
	if(@FPSSpec5 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec5, @in_BuyDays
	if(@FPSSpec6 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec6, @in_BuyDays
	if(@FPSSpec7 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec7, @in_BuyDays
	if(@FPSSpec8 > 0) exec FN_AddWeaponSlotAttachments @in_CustomerID, @in_WeaponID, @FPSSpec8, @in_BuyDays

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddItemToUser]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddItemToUser]
	@in_CustomerID int,
	@in_ItemID int,
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;

	declare @LeasedUntil datetime
	declare @CurDate datetime = GETDATE()
	
	-- add default weapon attachments
	if(@in_ItemID >= 100000 and @in_ItemID <= 199999) begin
		exec FN_AddDefaultAttachments @in_CustomerID, @in_ItemID, @in_ExpDays
	end

	declare @Quantity int = 1

	-- check if this is usable item, if so - get buying stack size.
	-- usable items is weapons, with 28 category. stackable item defined where NumClips>1, Quantity is ClipSize
	declare @BuyStackSize int = 0
	select @BuyStackSize=ClipSize from Items_Weapons where ItemID=@in_ItemID and Category=28 and NumClips>1
	if(@BuyStackSize > 0)
		set @Quantity = @BuyStackSize

	-- add item to inventory
	select @LeasedUntil=LeasedUntil from Inventory where (ItemID=@in_ItemID and CustomerID=@in_CustomerID)
	if(@@ROWCOUNT = 0) 
	begin
		INSERT INTO Inventory (
			CustomerID, 
			ItemID, 
			LeasedUntil, 
			Quantity
		)
		VALUES (
			@in_CustomerID,
			@in_ItemID,
			DATEADD(day, @in_ExpDays, @CurDate),
			@Quantity
		)
		return
	end
       
	if(@LeasedUntil < @CurDate)
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @CurDate)
	else
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @LeasedUntil)
		
	if(@LeasedUntil > '2020-1-1')
		set @LeasedUntil = '2020-1-1'

	UPDATE Inventory SET 
		LeasedUntil=@LeasedUntil
	WHERE ItemID=@in_ItemID and CustomerID=@in_CustomerID
       
	-- set if we need to increase item quantity
	declare @IsStackable int = 0
	select @IsStackable=IsStackable from Items_Generic where ItemID=@in_ItemID
	if(@IsStackable > 0 or @BuyStackSize > 0) 
	begin
		update Inventory set Quantity=Quantity+@Quantity
			where ItemID=@in_ItemID and CustomerID=@in_CustomerID
	end
END
GO
/****** Object:  StoredProcedure [dbo].[WO_WeaponAttachFixDefaults]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_WeaponAttachFixDefaults]
	@in_CustomerID int,
	@in_WeaponID int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- this procedure is called from client in case weapons is missing its default attachments
	-- so we need to fix that.
	--
	
	if(not exists (select * from Inventory where CustomerID=@in_CustomerID and ItemID=@in_WeaponID and LeasedUntil>GETDATE()))
	begin
		select 6 as ResultCode, 'no such weapon' as ResultMsg
		return
	end
	
	exec FN_AddDefaultAttachments @in_CustomerID, @in_WeaponID, 2000
	
	select 0 as 'ResultCode'
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LoadoutResetClass]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LoadoutResetClass] 
	@in_CustomerID int,
	@in_LoadoutID int,
	@in_Class int
AS
BEGIN
	SET NOCOUNT ON;

	-- validate that player own that loadout	
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from Profile_Chars where LoadoutID=@in_LoadoutID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no loadout id' as ResultMsg
		return
	end
	
	if(@CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad customerid' as ResultMsg
		return
	end
	
	-- give things to player
	declare @SlotData varchar(256) = ''

	if(@in_Class = 0) 
	begin
		-- assault
		exec FN_AddItemToUser @in_CustomerID, 20026, 2000 -- PMC Soldier Body
		exec FN_AddItemToUser @in_CustomerID, 20019, 2000 -- Lumberjack head
		exec FN_AddItemToUser @in_CustomerID, 20061, 2000 -- Medium Desert Armor
		exec FN_AddItemToUser @in_CustomerID, 101002, 2000 -- Colt M16
		exec FN_AddItemToUser @in_CustomerID, 101158, 2000 -- Mossberg 590
		exec FN_AddItemToUser @in_CustomerID, 101004, 2000 -- FN 57 handgun
		
		set @SlotData = '20061 0 20019 20026 0 0 0 0 0 0 101002 101158 101004'
	end

	if(@in_Class = 1) 
	begin
		-- specialist
		exec FN_AddItemToUser @in_CustomerID, 20092, 2000 -- Spetznaz body
		exec FN_AddItemToUser @in_CustomerID, 20020, 2000 -- Mr East head
		exec FN_AddItemToUser @in_CustomerID, 20056, 2000 -- MTV Forest Armor
		exec FN_AddItemToUser @in_CustomerID, 101093, 2000 -- RPK-74
		exec FN_AddItemToUser @in_CustomerID, 101003, 2000 -- RPG-7
		exec FN_AddItemToUser @in_CustomerID, 101004, 2000 -- FN 57 handgun

		set @SlotData = '20056 0 20020 20092 0 0 0 0 0 0 101093 101003 101004'
	end

	if(@in_Class = 2) 
	begin
		-- recon
		exec FN_AddItemToUser @in_CustomerID, 20000, 2000 -- Grunt Body
		exec FN_AddItemToUser @in_CustomerID, 20018, 2000 -- Chinese Melvin head
		exec FN_AddItemToUser @in_CustomerID, 20014, 2000 -- Ghili Suit
		exec FN_AddItemToUser @in_CustomerID, 101068, 2000 -- SVD
		exec FN_AddItemToUser @in_CustomerID, 101103, 2000 -- MP5 SMG
		exec FN_AddItemToUser @in_CustomerID, 101004, 2000 -- FN 57 handgun
		
		set @SlotData = '20014 0 20018 20000 0 0 0 0 0 0 101068 101103 101004'
	end

	if(@in_Class >= 3) 
	begin
		-- medic
		exec FN_AddItemToUser @in_CustomerID, 20007, 2000 -- Specops body
		exec FN_AddItemToUser @in_CustomerID, 20021, 2000 -- Mr West head
		exec FN_AddItemToUser @in_CustomerID, 20001, 2000 -- Light Gear
		exec FN_AddItemToUser @in_CustomerID, 20043, 2000 -- M9 Helmet Black
		exec FN_AddItemToUser @in_CustomerID, 101002, 2000 -- Colt M16
		exec FN_AddItemToUser @in_CustomerID, 101103, 2000 -- MP5 SMG
		exec FN_AddItemToUser @in_CustomerID, 101004, 2000 -- FN 57 handgun

		set @SlotData = '20001 0 20021 20007 0 0 0 0 0 0 101002 101103 101004'
	end
	
	update Profile_Chars set 
		Class=@in_Class,
		HonorPoints=0,
		TimePlayed=0,
		Loadout=@SlotData,
		Skills='',
		SpendSP1=0,
		SpendSP2=0,
		SpendSP3=0
	where LoadoutID=@in_LoadoutID

	select 0 as ResultCode
	select @in_LoadoutID as 'LoadoutID', @SlotData as 'Loadout'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_LootAddReward]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LootAddReward]
	@in_CustomerID int,
	@in_Roll float,
	@in_LootID int,
	@in_ItemID int,
	@in_ExpDays int,
	@in_GD int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- check if we have item already, and if not - reset GD winning
	if(@in_ItemID > 0) begin
		if not exists (select ItemID from Inventory where CustomerID=@in_CustomerID and ItemID=@in_ItemID)
			set @in_GD = 0
	end
	
	-- log winning
	insert into DBG_LootRewards 
		(ReportTime, CustomerID, Roll, LootID, ItemID, ExpDays, GD)
	values	(GETDATE(), @in_CustomerID, @in_Roll, @in_LootID, @in_ItemID, @in_ExpDays, @in_GD)
	
	-- add rewards
	if(@in_GD > 0) begin
		update LoginID set GameDollars=GameDollars+@in_GD where CustomerID=@in_CustomerID
	end
	if(@in_ItemID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @in_ItemID, @in_ExpDays
	end

	-- success
	select 0 as ResultCode
	
	select @in_GD as 'GD'
END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddWeaponWithAllAttachments]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddWeaponWithAllAttachments]
	@in_CustomerID int,
	@in_WeaponID int,
	@in_BuyDays int,
	@in_AttachBuyDays int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- adding weapon with all attachments
	--

	exec FN_AddItemToUser @in_CustomerID, @in_WeaponID, @in_BuyDays
	exec FN_AddWeaponAllAttachments @in_CustomerID, @in_WeaponID, @in_AttachBuyDays

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddItemToGamertag]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddItemToGamertag]
	@in_Gamertag nvarchar(100),
	@in_ItemId int,
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;
       
	declare @in_CustomerID int
	select @in_CustomerID=CustomerID from LoginID where Gamertag=@in_Gamertag
	if(@@ROWCOUNT = 0) begin
		print @in_Gamertag-- as 'Not Found'
		return
	end
	
	exec FN_AddItemToUser @in_CustomerID, @in_ItemID, @in_ExpDays
END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddPremiumAccToUser]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddPremiumAccToUser]
	@in_CustomerID int,
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;

	-- add Item_AccountPremium
	exec FN_AddItemToUser @in_CustomerID, 301004, @in_ExpDays

	-- add 1 SP - not anymore
	-- update LoginID SET SkillPoints=(SkillPoints+1) WHERE CustomerID=@in_CustomerID
	
	-- Item of the month - G11
	--exec FN_AddItemToUser @in_CustomerID, 101171, @in_ExpDays
END
GO
/****** Object:  StoredProcedure [dbo].[WO_AMAZON_BuySKU]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_AMAZON_BuySKU]
	@in_Address varchar(128),
	@in_SKU varchar(128),
	@in_PurchaseId varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode
	
	-- NOTE: this can happen in case of retried FULLFIL query
	if(exists(select * from AmazonPurchases where PurchaseID=@in_PurchaseId)) begin
		select 'SUCCESS' as 'Status';
		return;
	end

	-- need for amazon sandbox test, convert test user to 0
	if(@in_Address = 'AMZNTESTVALIDADDRESS')
		set @in_Address = '0'

	-- NO other CHECKS - they WAS done in [WO_AMAZON_CheckSKU]
	declare @CustomerID int = convert(int, @in_Address)
	
	declare @PriceUSD float = 0
	select @PriceUSD=PriceUSD_For_Log from AmazonShop where SKU=@in_SKU

	-- log 1
	INSERT INTO FinancialTransactions VALUES (
		@CustomerID, 
		@in_PurchaseId, 
		1000, 
		GETDATE(), 
		@PriceUSD, 
		'AMAZON', 
		'APPROVED', 
		@in_SKU)
		
	-- log 2
	insert into AmazonPurchases (
		PurchaseID,
		CustomerID,
		PurchaseTime,
		SKU,
		IsRevoked
		)
		VALUES (
		@in_PurchaseID,
		@CustomerID,
		GETDATE(),
		@in_SKU,
		0
		)

	--
	-- make fucking sure that you handle ALL possible combinations for SKUs here
	-- and return with select 'SUCCESS' as 'Status';
	--
	
	if(@in_SKU = 'AMZNTESTVALIDSKU') begin
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_GP5') begin
		exec FN_AlterUserGP @CustomerID, 4480, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_GP8')	begin
		exec FN_AlterUserGP @CustomerID, 8000, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end
	
	if(@in_SKU = 'AMZ_GP12') begin
		exec FN_AlterUserGP @CustomerID, 12000, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_GP16') begin
		exec FN_AlterUserGP @CustomerID, 16800, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_GP26') begin
		exec FN_AlterUserGP @CustomerID, 26400, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_GP48') begin
		exec FN_AlterUserGP @CustomerID, 48000, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_PK1') begin
		exec FN_AddItemToUser @CustomerID, 301001, 7
		exec FN_AddItemToUser @CustomerID, 101037, 2000
		exec FN_AlterUserGP @CustomerID, 5000, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_PK2') begin
		exec FN_AddItemToUser @CustomerID, 301004, 30
		exec FN_AddItemToUser @CustomerID, 20016, 2000
		exec FN_AddItemToUser @CustomerID, 101027, 2000
		exec FN_AddItemToUser @CustomerID, 101140, 2000
		select 'SUCCESS' as 'Status';
		return;
	end

	if(@in_SKU = 'AMZ_PK3') begin
		declare @out_FNResult int
		exec FN_AddItemToUser @CustomerID, 101221, 2000
		exec FN_AddItemToUser @CustomerID, 101055, 2000
		exec FN_AddItemToUser @CustomerID, 101245, 2000
		exec FN_AddItemToUser @CustomerID, 301061, 2000
		exec FN_AddItemToUser @CustomerID, 301062, 2000
		exec FN_AddItemToUser @CustomerID, 301067, 2000
		exec FN_AddItemToUser @CustomerID, 301071, 2000
		exec FN_AlterUserGP @CustomerID, 20000, 'WO_AMAZON_BuySKU'
		select 'SUCCESS' as 'Status';
		return;
	end

	
	select 'FAILURE_SKU_INVALID' as 'Status';
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_RentWeapons]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_RentWeapons]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_BuyDays int,
	@in_Category int	-- category can be 0 for all of them
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- function must be called from WO_BuyItemFN_Exec
	--
	--
	
	declare @ItemID int

	DECLARE t_cursorW CURSOR FOR select ItemID from Items_Weapons
		where (Price1+Price7+Price30+PriceP + GPrice1+GPrice7+GPrice30+GPriceP) > 0
		and (@in_Category = 0 or @in_Category=Category)
	OPEN t_cursorW
	FETCH NEXT FROM t_cursorW into @ItemID
	while @@FETCH_STATUS = 0 
	begin
		exec FN_AddItemToUser @in_CustomerID, @ItemID, @in_BuyDays

		FETCH NEXT FROM t_cursorW into @ItemID
	end
	CLOSE t_cursorW
	DEALLOCATE t_cursorW

	-- success
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_RentGears]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_RentGears]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_BuyDays int,
	@in_Category int	-- category can be 0 for all of them
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- function must be called from WO_BuyItemFN_Exec
	--
	--
	
	declare @ItemID int

	DECLARE t_cursorG CURSOR FOR select ItemID from Items_Gear
		where (Price1+Price7+Price30+PriceP + GPrice1+GPrice7+GPrice30+GPriceP) > 0
		and (@in_Category = 0 or @in_Category=Category)
	OPEN t_cursorG
	FETCH NEXT FROM t_cursorG into @ItemID
	while @@FETCH_STATUS = 0 
	begin
		exec FN_AddItemToUser @in_CustomerID, @ItemID, @in_BuyDays

		FETCH NEXT FROM t_cursorG into @ItemID
	end
	CLOSE t_cursorG
	DEALLOCATE t_cursorG

	-- success
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_AddPackage]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_AddPackage]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_ItemId int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- function must be called from WO_BuyItemFN_Exec
	--
	--

	declare @IsEnabled int
	declare @AddGP int
	declare @AddSP int
	declare @Item1_ID int
	declare @Item1_Exp int
	declare @Item2_ID int
	declare @Item2_Exp int
	declare @Item3_ID int
	declare @Item3_Exp int
	declare @Item4_ID int
	declare @Item4_Exp int
	declare @Item5_ID int
	declare @Item5_Exp int
	declare @Item6_ID int
	declare @Item6_Exp int
	
	SELECT 
		@IsEnabled=IsEnabled,
		@AddGP=AddGP,
		@AddSP=AddSP,
		@Item1_ID=Item1_ID,
		@Item1_Exp=Item1_Exp,
		@Item2_ID=Item2_ID,
		@Item2_Exp=Item2_Exp,
		@Item3_ID=Item3_ID,
		@Item3_Exp=Item3_Exp,
		@Item4_ID=Item4_ID,
		@Item4_Exp=Item4_Exp,
		@Item5_ID=Item5_ID,
		@Item5_Exp=Item5_Exp,
		@Item6_ID=Item6_ID,
		@Item6_Exp=Item6_Exp
	FROM Items_Packages WHERE ItemID=@in_ItemId
	if (@@RowCount = 0) begin
		set @out_FNResult = 6
		return
	end
	
	--if(@IsEnabled = 0) begin
	--	set @out_FNResult = 7
	--	return
	--end
	
	if(@Item1_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item1_ID, @Item1_Exp
	end
	if(@Item2_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item2_ID, @Item2_Exp
	end
	if(@Item3_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item3_ID, @Item3_Exp
	end
	if(@Item4_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item4_ID, @Item4_Exp
	end
	if(@Item5_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item5_ID, @Item5_Exp
	end
	if(@Item6_ID > 0) begin
		exec FN_AddItemToUser @in_CustomerID, @Item6_ID, @Item6_Exp
	end
	
	update LoginID set 
		GameDollars=(GameDollars+@AddGP), 
		SkillPoints=(SkillPoints+@AddSP)
	where CustomerID=@in_CustomerID
	
	-- success
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_UseCouponPAX2011]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_UseCouponPAX2011]
	@in_CustomerID int, 
	@in_CouponCode varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @IsUsed int
	declare @ExecCode int
	declare @MultiUse int
	select @IsUsed=IsUsed, @ExecCode=Team, @MultiUse=MultiUse from Coupons2 where CouponCode=@in_CouponCode
	if(@@RowCount = 0) begin
		select 'Invalid coupon code' as ResultMsg
		return
	end

	if(@MultiUse > 0)
	begin
		-- multi use coupon
		if exists (select * from Coupons2CustomerMap where CustomerID=@in_CustomerID and CouponID=@ExecCode) begin
			select 'You have already used this coupon' as ResultMsg
			return
		end

		insert into Coupons2CustomerMap 
			(CouponID, CustomerID, UseTime) 
			values 
			(@ExecCode, @in_CustomerID, GETDATE())
	end
	else
	begin
		-- single use coupon
		if(@IsUsed > 0) begin
			select 'This coupon code is already used' as ResultMsg
			return
		end
	
		update Coupons2 set IsUsed=1, CustomerID=@in_CustomerID where CouponCode=@in_CouponCode
	end

	
	if(@ExecCode = 7)
	begin
		exec FN_AlterUserGP @in_CustomerID, 13000, 'Coupon 7'
		select 'Your 10 euro coupon is activated' as ResultMsg
		return;
	end

	-- Mark Davidson <mark.davidson@microprose.com>
	-- promo cards
	if(@ExecCode = 8) -- 25k codes
	begin
		exec FN_AlterUserGP @in_CustomerID, 7500, 'Coupon 8'
		select 'Your 7500GP coupon is activated' as ResultMsg
		return;
	end

	if(@ExecCode = 9) -- 25k codes
	begin
		exec FN_AlterUserGP @in_CustomerID, 15000, 'Coupon 9'
		select 'Your 15000GP coupon is activated' as ResultMsg
		return;
	end

	if(@ExecCode = 10) -- 100k codes
	begin
		update LoginID set GameDollars=GameDollars+5000 where CustomerID=@in_CustomerID
		select 'Your 5000 Game Dollars coupon is activated' as ResultMsg
		return;
	end

	if(@ExecCode = 11)
	begin
		exec FN_AlterUserGP @in_CustomerID, 7000, 'Coupon 11'
		select 'Your £5 coupon is activated. 7000GP has been added to your account' as ResultMsg
		return;
	end

	if(@ExecCode = 12)
	begin
		exec FN_AlterUserGP @in_CustomerID, 15000, 'Coupon 12'
		select 'Your £10 coupon is activated. 15000GP has been added to your account' as ResultMsg
		return;
	end

	if(@ExecCode = 13)
	begin
		exec FN_AlterUserGP @in_CustomerID, 10000, 'Coupon 13'
		select 'Your $10 Cash Card is activated. 10000GP has been added to your account' as ResultMsg
		return;
	end

	if(@ExecCode = 14)
	begin
		exec FN_AlterUserGP @in_CustomerID, 20000, 'Coupon 14'
		select 'Your $20 Cash Card is activated. 20000GP has been added to your account' as ResultMsg
		return;
	end

	if(@ExecCode = 15)
	begin
		update LoginID set GameDollars=GameDollars+25000 where CustomerID=@in_CustomerID
		select 'Your 25,000GD Gift Card is activated' as ResultMsg
		return;
	end

	if(@ExecCode = 16)
	begin
		update LoginID set GameDollars=GameDollars+50000 where CustomerID=@in_CustomerID
		select 'Your 50,000GD Gift Card is activated' as ResultMsg
		return;
	end

	-- 4000 x 7900 Gold Credit (Additional for UK, £5)
	if(@ExecCode = 17)
	begin
		exec FN_AlterUserGP @in_CustomerID, 7900, 'Coupon 17'
		select 'Your £5 Card is activted. 7900 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	-- 4000 x 17000 Gold Credit (Additional for UK, £10 - w/10% bonus over £5)
	if(@ExecCode = 18)
	begin
		exec FN_AlterUserGP @in_CustomerID, 17000, 'Coupon 18'
		select 'Your £10 Card is activted. 17000 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	-- 8000 x 7500 Gold Credit (5€ for Italy and Spain)
	if(@ExecCode = 19)
	begin
		exec FN_AlterUserGP @in_CustomerID, 7500, 'Coupon 19'
		select 'Your 5€ Card is activted. 7500 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	-- 8000 x 16500 Gold Credit (10€ for Italy and Spain - w/10% bonus over 5€)
	if(@ExecCode = 20)
	begin
		exec FN_AlterUserGP @in_CustomerID, 16500, 'Coupon 20'
		select 'Your 10€ Card is activted. 16500 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	-- 45000 x 5000 War Points (Gift)
	if(@ExecCode = 21)
	begin
		update LoginID set GameDollars=GameDollars+5000 where CustomerID=@in_CustomerID
		select 'Your 5000 War Points coupon is activated' as ResultMsg
		return;
	end

	-- outdated sniper/assault/machine gun PAX2011 loadout coupons
	if(@ExecCode = 22 or @ExecCode = 23 or @ExecCode = 24)
	begin
		select 'Sorry, this coupon is outdated.' as ResultMsg
		return;
	end

	-- Gamestop/Impulse promo, 2k codes
	if(@ExecCode = 25)
	begin
		exec FN_AddItemToUser @in_CustomerID, 101241, 2000	-- snp_aw_impulse
		exec FN_AddItemToUser @in_CustomerID, 101242, 2000	-- ASR_tar21_Impulse
 		exec FN_AddItemToUser @in_CustomerID, 20099, 2000	-- BODY_Shadow_Impulse_01
		exec FN_AddItemToUser @in_CustomerID, 20100, 2000	-- Armor_MTV_01_Impulse_01
		exec FN_AddItemToUser @in_CustomerID, 20101, 2000	-- HGEAR_M9_Helmet_Impulse_01
		exec FN_AlterUserGP @in_CustomerID, 10000, 'Coupon 25'
		select 'Your Gamestop/Impulse coupon code is activated' as ResultMsg
		return;
	end


	--  2012-04-02 cybergun 300,000 x $5 GC
	if(@ExecCode = 50)
	begin
		exec FN_AlterUserGP @in_CustomerID, 5000, 'Coupon 50'
		select 'Your $5 coupon is activated. 4000 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	--  2012-04-02 cybergun -  300,000 x $5 GC
	if(@ExecCode = 51)
	begin
		exec FN_AlterUserGP @in_CustomerID, 4000, 'Coupon 51'
		select 'Your $5 coupon is activated. 4000 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	--  2012-04-02 cybergun - 15,000 x 7500GC 
	if(@ExecCode = 52)
	begin
		exec FN_AlterUserGP @in_CustomerID, 7500, 'Coupon 52'
		select 'Your coupon is activated. 7500 Gold Credit has been added to your account' as ResultMsg
		return;
	end

	--  2012-04-02 cybergun - multiuse 10,000 WP
	if(@ExecCode = 53)
	begin
		update LoginID set GameDollars=GameDollars+10000 where CustomerID=@in_CustomerID
		select 'Your coupon is activated. 10,000 WP has been added to your account' as ResultMsg
		return;
	end

	-- Play with Devs coupon code. Will re-enable once they have another promo
	if(@ExecCode = 2001111)
	begin
		exec FN_AddItemToUser @in_CustomerID, 101215, 3
		exec FN_AddItemToUser @in_CustomerID, 101227, 3			
		exec FN_AddItemToUser @in_CustomerID, 101245, 3			
		exec FN_AddItemToUser @in_CustomerID, 101216, 3			
		exec FN_AddItemToUser @in_CustomerID, 101232, 3			
		exec FN_AddItemToUser @in_CustomerID, 101214, 3			
		select 'Play With Devs coupon code is activated' as ResultMsg
		--select 'Play With Devs coupon code is not currently active' as ResultMsg
		return
	end

			
	select 'This coupon is expired. You can contact support at support@thewarinc.com' as ResultMsg

END
GO
/****** Object:  StoredProcedure [dbo].[FN_MNT_ResetInventoryToFPS]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_MNT_ResetInventoryToFPS]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;
	
	delete from Inventory where CustomerID=@in_CustomerID and ItemID>=100000 and ItemID<199999
	delete from Inventory_FPS where CustomerID=@in_CustomerID

	-- add all FPS weapons
	
	declare @ItemID int

	DECLARE t_cursorW CURSOR FOR select ItemID from Items_Weapons where IsFPS>0
	OPEN t_cursorW
	FETCH NEXT FROM t_cursorW into @ItemID
	while @@FETCH_STATUS = 0 
	begin
		exec FN_AddItemToUser @in_CustomerID, @ItemID, 2000

		FETCH NEXT FROM t_cursorW into @ItemID
	end
	CLOSE t_cursorW
	DEALLOCATE t_cursorW

END
GO
/****** Object:  StoredProcedure [dbo].[FN_LevelUpBonus]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pavel Tumik
-- Create date: May 29, 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FN_LevelUpBonus] 
       @in_CustomerID int,
       @in_LevelUp int
AS
BEGIN
	SET NOCOUNT ON;

	declare @out_FNResult int
	
	declare @gp int
	declare @gd int
	declare @sp int
	set @gp=0
	set @gd=0 -- level up bonus
	set @sp=1 -- always give at least one SP


	if (@in_LevelUp = 2) begin
		exec FN_AddItemToUser @in_CustomerID, 301000, 3 -- blackops crate
		exec FN_AddItemToUser @in_CustomerID, 101173, 1 -- IMI Tavor
	end
	if (@in_LevelUp = 3) begin
		exec FN_AddItemToUser @in_CustomerID, 301003, 1 -- 2X GD
		exec FN_AddItemToUser @in_CustomerID, 101254, 3 -- camera drone
		exec FN_AddItemToUser @in_CustomerID, 101106, 1 --	Honey Badger
	end
	if (@in_LevelUp = 4) begin
		exec FN_AddItemToUser @in_CustomerID, 101218, 1 --	G36 Elite
	end
	else if(@in_LevelUp = 5) begin
		exec FN_AddItemToUser @in_CustomerID, 101180, 1	-- 	Desert Eagle	45
	end
	else if(@in_LevelUp = 6) begin
		exec FN_AddItemToUser @in_CustomerID, 301067, 3 --	big surprise
		exec FN_AddItemToUser @in_CustomerID, 101247, 1 --	Blaser 93R
	end
	else if(@in_LevelUp = 7) begin
		exec FN_AddItemToUser @in_CustomerID, 101092, 1 --	Pecheneg 	29
	end
	else if(@in_LevelUp = 8) begin
		exec FN_AddItemToUser @in_CustomerID, 101037, 1 --	Famas F1	24
	end
	else if(@in_LevelUp = 9) begin
		exec FN_AddItemToUser @in_CustomerID, 101109, 1 --	Bizon
	end
	else if(@in_LevelUp = 10) begin
		set @gd=(@gd+10000)
		exec FN_AddItemToUser @in_CustomerID, 301003, 1 -- 2X GD
		exec FN_AddItemToUser @in_CustomerID, 301001, 1 -- 2X XP
		exec FN_AddItemToUser @in_CustomerID, 101215, 1 --	Sig 516 Elite
	end
	else if(@in_LevelUp = 11) begin
		exec FN_AddItemToUser @in_CustomerID, 101202, 1	--	QLB 06
	end
	else if(@in_LevelUp = 12) begin
		exec FN_AddItemToUser @in_CustomerID, 101200, 1 -- AA-12, USAS-12
	end
	else if(@in_LevelUp = 13) begin
		exec FN_AddItemToUser @in_CustomerID, 101189, 1	--	M 202 Flash 
	end
	else if(@in_LevelUp = 14) begin
		exec FN_AddItemToUser @in_CustomerID, 101084, 1 --	VSS Vintorez 
	end
	else if(@in_LevelUp = 15) begin
		exec FN_AddItemToUser @in_CustomerID, 101214, 1 --	M249 Elite
		exec FN_AddItemToUser @in_CustomerID, 101227, 1 -- Bizon Elite
		exec FN_AddItemToUser @in_CustomerID, 101219, 1 -- SCAR ELITE
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 1, 0
		set @gd=(@gd+10000)
	end
	else if(@in_LevelUp = 16) begin
		exec FN_AddItemToUser @in_CustomerID, 101087, 1 --	Mauser HP50
	end
	else if(@in_LevelUp = 17) begin
		exec FN_AddItemToUser @in_CustomerID, 101063, 1 --	TR7 SMG
	end
	else if(@in_LevelUp = 18) begin
		exec FN_AddItemToUser @in_CustomerID, 101106, 1 --	Honey Badger
	end
	else if(@in_LevelUp = 19) begin
		exec FN_AddItemToUser @in_CustomerID, 101246, 3 --	FN P90S
	end
	else if(@in_LevelUp = 20) begin
		set @gd=(@gd+10000)
		exec FN_AddItemToUser @in_CustomerID, 301003,1 -- 2X GD
		exec FN_AddItemToUser @in_CustomerID, 301001,1 -- 2X XP
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 1, 0
	end
	else if(@in_LevelUp = 25) begin
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 5, 0
	end
	else if(@in_LevelUp = 30) begin
		set @gd=(@gd+50000)
		exec FN_AddItemToUser @in_CustomerID, 301003,1 -- 2X GD
		exec FN_AddItemToUser @in_CustomerID, 301001,1 -- 2X XP
	end
	else if(@in_LevelUp = 35) begin
		set @gd=(@gd+15000)
	end
	else if(@in_LevelUp = 40) begin
		set @gd=(@gd+50000)
		exec FN_AddItemToUser @in_CustomerID, 301003,2 -- 2X GD
		exec FN_AddItemToUser @in_CustomerID, 301001,2 -- 2X XP
	end
	else if(@in_LevelUp = 45) begin
		set @gd=(@gd+15000)
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 7, 0
	end
	else if(@in_LevelUp = 50) begin
		set @gd=(@gd+100000)
		exec FN_AddItemToUser @in_CustomerID, 301003,3 -- 2X GD
	end
	else if(@in_LevelUp = 55) begin
--		set @gd=(@gd+150000)
		exec FN_AddItemToUser @in_CustomerID, 301003,2 -- 2X GD
	end
	else if(@in_LevelUp = 60) begin
		set @gd=(@gd+200000)
		set @gp=(@gp+25000)
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 30, 0
	end

	exec FN_AlterUserGP @in_CustomerID, @gp, 'levelup'
	
	UPDATE LoginID SET 
		GameDollars=(GameDollars + @gd),
		SkillPoints=(SkillPoints + @sp)
	where CustomerID=@in_CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[FN_GiveReferrerReward]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_GiveReferrerReward] 
	@in_CustomerID int,	-- receiver of bonuses
	@in_InvitedID int	-- CustomerID of user who leveled up
AS
BEGIN
	SET NOCOUNT ON;
	
	-- ignore steam
	if(@in_CustomerID = 24388)
		return
	
	-- ignore special referrer users
	declare @AccountName nvarchar(128)
	select @AccountName=AccountName from LoginID where CustomerID=@in_CustomerID
	if(@AccountName like 'REFERID_%')
		return

	declare @out_FNResult int
	
	-- calculate total number of referrers >= lvl10
	declare @XP10 int
	declare @NumReferrals int
	select @XP10=HonorPoints from DataRankPoints where Rank=9
	select @NumReferrals = COUNT(*) from LoginID where ReferralID=@in_CustomerID and HonorPoints>=@XP10
	
	-- update number of referrers and remember old value. NOTE: must be SINGLE operation
	declare @CurRef int
	update AccountInfo set @CurRef=NumReferrals, NumReferrals=@NumReferrals where CustomerID = 1000

	-- make a loop for each added referrer
	set @CurRef = @CurRef + 1
	WHILE(@CurRef <= @NumReferrals)
	BEGIN
	
		insert into DBG_ReferredEvents
			(CustomerID, InvitedID, LevelUpTime, NumReferrers)
			values
			(@in_CustomerID, @in_InvitedID, GETDATE(), @CurRef)
	
		-- each successful referral we should give them 250 GC. 
		exec FN_AlterUserGP @in_CustomerID, 250, 'RefBonus'

		-- 1	500 GC
		if(@CurRef = 1) begin
			exec FN_AlterUserGP @in_CustomerID, 500, 'RefBonus'
		end

		--  5	?????? 30 day rental of any weapon
		--if(@CurRef = 5) begin
		--end

		-- 10	5,000 Gold Credits 
		if(@CurRef = 10) begin
			exec FN_AlterUserGP @in_CustomerID, 5000, 'RefBonus'
		end

		-- 25	?????? Special "Recruiter" title on forums
		--if(@CurRef = 25) begin
		--end

		-- 50	Collectors Pack
		if(@CurRef = 50) begin
			-- 30days all weapon rent
			exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 30, 0
			-- 30days premium acc
			exec FN_AddPremiumAccToUser @in_CustomerID, 30
			-- 20k GC
			exec FN_AlterUserGP @in_CustomerID, 20000, 'RefBonus'
			-- permanent QBZ 95
			exec FN_AddItemToUser @in_CustomerID, 101081, 2000
		end

		-- 100	50,000 Gold Credits
		if(@CurRef = 100) begin
			exec FN_AlterUserGP @in_CustomerID, 50000, 'RefBonus'
		end

		-- 1000	permanent unlock of all items in a store
		if(@CurRef = 1000) begin
			exec WO_BuyItemFN_RentGears @out_FNResult out, @in_CustomerID, 2000, 0
			exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, 2000, 0
		end

		set @CurRef = @CurRef + 1
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ECLIPSE_PROCESSTRANSACTION]    Script Date: 09/05/2014 18:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECLIPSE_PROCESSTRANSACTION] 
	@tr_transid varchar(64) = '0000', 
	@tr_userid int = 0, 
	@tr_date varchar(64) = '12/1/1973', 
	@tr_amount float = 0, 
	@tr_result varchar(64) = '0000', 
	@tr_status varchar(64) = '0000', 
	@tr_itemid varchar(64) = '0000', 
	@pkey varchar(32) = 'wrong app key'
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO FinancialTransactions VALUES (
		@tr_userid, 
		@tr_transid, 
		1000, 
		GETDATE(), 
		@tr_amount, 
		@tr_result, 
		@tr_status, 
		@tr_itemid)
	
	if(@tr_itemid = 'PACK_COLLECTOR_EDITION') -- 
	begin
		declare @out_FNResult int
		
		-- 30days all weapon rent
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @tr_userid, 30, 0
		
		-- 30days premium acc
		--exec FN_AddPremiumAccToUser @tr_userid, 30
		
		--20k GC
		exec FN_AlterUserGP @tr_userid, 20000, 'PACK_COLLECTOR_EDITION'
		
		-- permanent QBZ 95
		exec FN_AddItemToUser @tr_userid, 101081, 2000

		return
	end
	
	declare @AddedGP int = 0

	     if (@tr_itemid = 'GPX4') set @AddedGP = 3680 --+ 552
	else if (@tr_itemid = 'GPX10') set @AddedGP = 7370 --+ 1449
	else if (@tr_itemid = 'GPX20') set @AddedGP = 18220 --+ 4232
	else if (@tr_itemid = 'GPX25') set @AddedGP = 21880 --+ 6906
	else if (@tr_itemid = 'GPX50') set @AddedGP = 44080 --+ 27126
	else if (@tr_itemid = 'GP1500') set @AddedGP = 1500
	else if (@tr_itemid = 'GP2500') set @AddedGP = 2500
	else if (@tr_itemid = 'GP4000') set @AddedGP = 4000
	else if (@tr_itemid = 'GP5000') set @AddedGP = 5000
	else if (@tr_itemid = 'GP10K') set @AddedGP = 10000
	else if (@tr_itemid = 'G1C_GPX4') set @AddedGP = 4000
	else if (@tr_itemid = 'G1C_GPX10') set @AddedGP = 10000
	else if (@tr_itemid = 'G1C_GPX20') set @AddedGP = 20000
	else if (@tr_itemid = 'G1C_GPX30') set @AddedGP = 30000
	else if (@tr_itemid = 'G1C_GPX50') set @AddedGP = 50000
	else begin
		EXEC FN_ADD_SECURITY_LOG 300, '', @tr_userid, @tr_itemid
		return
	end

	exec FN_AlterUserGP @tr_userid, @AddedGP, 'ECLIPSE_PROCESSTRANSACTION'

END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItemFN_Exec]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItemFN_Exec]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int,
	@in_Param1 int = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- main function for buying items in game, should be called from WO_BuyItem2
	--
	--

	-- set success by default
	set @out_FNResult = 0
	
	-- weapon attachment item
	if(@in_ItemId >= 400000 and @in_ItemId < 490000) begin
		exec FN_AddAttachmentToUser @in_CustomerID, @in_Param1, @in_ItemId, @in_BuyDays
		return
	end

	-- package item
	if(@in_ItemId >= 500000 and @in_ItemId < 590000) begin
		exec WO_BuyItemFN_AddPackage @out_FNResult out, @in_CustomerID, @in_ItemId
		return
	end

	-- item upgrade item - skip inventory
	if(@in_ItemId >= 600000 and @in_ItemId < 699999) begin
		return
	end

	-- premium acc
	if(@in_ItemId = 301004) begin
		exec FN_AddPremiumAccToUser @in_CustomerID, @in_BuyDays
		return
	end
	
	-- unlock loadout (5 slots) : not used items
	if(@in_ItemId >= 301050 and @in_ItemId <= 301054) begin
		return
	end
	
	-- unlock new loadout. NOTE: no item adding
	if(@in_ItemId = 301142) begin
		return
	end
	
	-- clan create item. NOTE: no item adding
	if(@in_ItemId = 301143) begin
		return
	end
	-- clan add members
	if(@in_ItemId >= 301144 and @in_ItemId <= 301149) begin
		exec WO_BuyItemFN_AddClanMembers @out_FNResult out, @in_CustomerID, @in_ItemId
		return
	end

	-- add generic ability. NOTE: no item adding
	if(@in_ItemId = 301055) begin
		return
	end
	
	-- change gamertag. NOTE: no item adding
	if(@in_ItemId = 301045) begin
		return
	end
	
	-- reset stats
	if(@in_ItemId = 301046) begin 
		update Stats set ShotsFired=0, ShotsHits=0 where CustomerID=@in_CustomerID
		return
	end

	-- reset kill/death
	if(@in_ItemId = 301047) begin 
		update Stats set Kills=0, Deaths=0 where CustomerID=@in_CustomerID
		return
	end

	-- reset win/lose
	if(@in_ItemId = 301049) begin 
		update Stats set Wins=0, Losses=0 where CustomerID=@in_CustomerID
		return
	end

	-- reset skills
	if(@in_ItemId = 301048) begin 
		exec WO_BuyItemFN_UnlearnSkills @out_FNResult out, @in_CustomerID, 1
		return
	end
	
	-- skip adding to inventory by some special Items_Generic category
	--  3: mystery boxes
	--  6: airstrikes
	declare @ItemCategory int = 0
	select @ItemCategory=Category from Items_Generic where ItemID=@in_ItemId
	if(@ItemCategory = 3 or @ItemCategory = 6) begin
		return
	end
	-- loot boxes must be *removed* from user inventory, we're unlocking them
	--  7: loot boxes
	if(@ItemCategory = 7) begin
		exec FN_RemoveOneItemFromUser @in_CustomerID, @in_ItemID
		return
	end
	
	-- all weapon renting
	if(@in_ItemId = 301106) begin
		exec WO_BuyItemFN_RentWeapons @out_FNResult out, @in_CustomerID, @in_BuyDays, 0
		return
	end
	
	-- 10k GD
	if(@in_ItemId = 301107) begin
		update LoginID set GameDollars=GameDollars+10000 where CustomerID=@in_CustomerID
		return
	end
	
	-- normal item
	exec FN_AddItemToUser @in_CustomerID, @in_ItemId, @in_BuyDays
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[WO_LoadoutUnlock]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_LoadoutUnlock] 
	@in_CustomerID int,
	@in_Class int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- temp solution for now - limit maximum loadout slots to 6
	declare @NumLoadouts int = 0
	select @NumLoadouts=COUNT(*) from Profile_Chars where CustomerID=@in_CustomerID
	if(@NumLoadouts < 6) 
	begin
		insert into Profile_Chars (
			CustomerID,
			Class,
			Loadout
		) values (
			@in_CustomerID,
			@in_Class,
			''
		)
	end
	
	-- detect loadout id
	declare @LoadoutID int = 0
	select top(1) @LoadoutID=LoadoutID from Profile_Chars where CustomerID=@in_CustomerID order by LoadoutID desc
	
	-- fallthru to WO_LoadoutResetClass
	-- all items will be given there!
	-- ResultCode and data will be selected from there
	
	exec WO_LoadoutResetClass @in_CustomerID, @LoadoutID, @in_Class
END
GO
/****** Object:  StoredProcedure [dbo].[WO_G1LinkAccount]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_G1LinkAccount]
	@in_CustomerID int,
	@in_G1ID int,
	@in_G1PayCode int
AS
BEGIN
	SET NOCOUNT ON;
	
	select 0 as ResultCode

	insert into GamersfirstUserIDMap (CustomerID, GamersfirstID) values (@in_CustomerID, @in_G1ID)
	
	--
	-- g1 account bonuses based on tiers
	--

	if(@in_G1PayCode = 1)	-- WRPaidTier5 - Tier 1: Top 1% of paying players
	begin
		exec FN_AlterUserGP @in_CustomerID, 10000, 'G1RefBonus'

		-- 5 day rental of following guns plus for each gun rental of 3 days of all attachments:
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101055, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101077, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101218, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101219, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101215, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101084, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101232, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101200, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101245, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101197, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101214, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101227, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101106, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101246, 5, 3
		return
	end

	if(@in_G1PayCode = 2)	-- WRPaidTier4 - Tier 2: Next 9% of paying players
	begin
		exec FN_AlterUserGP @in_CustomerID, 5000, 'G1RefBonus'

		-- 7 day rental of following guns plus for each gun rental of 3 days of all attachments:
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101055, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101077, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101215, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101084, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101227, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101106, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101246, 7, 3
		return
	end

	if(@in_G1PayCode = 3)	-- WRPaidTier3 - Tier 3: Next 20% of paying players
	begin
		exec FN_AlterUserGP @in_CustomerID, 5000, 'G1RefBonus'
		update LoginID set GameDollars=(GameDollars+100000) where CustomerID=@in_CustomerID

		-- 7 day rental of following guns plus for each gun rental of 3 days of all attachments:
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101055, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101215, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101106, 7, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101246, 7, 3
		return
	end

	if(@in_G1PayCode = 4)	-- WRPaidTier2 - Tier 4: Next 30 % of paying players
	begin
		exec FN_AlterUserGP @in_CustomerID, 8000, 'G1RefBonus'
		update LoginID set GameDollars=(GameDollars+100000) where CustomerID=@in_CustomerID

		-- 5 day rental of following guns plus for each gun rental of 3 days of all attachments:
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101055, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 5, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101106, 5, 3
		return
	end

	if(@in_G1PayCode = 5)	-- WRPaidTier1 - Tier 5: Bottom 40% of paying players
	begin
		exec FN_AlterUserGP @in_CustomerID, 10000, 'G1RefBonus'

		-- 3 day rental of following guns plus for each gun rental of 3 days of all attachments:
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101215, 3, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 3, 3
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101106, 3, 3
		return
	end


	if(@in_G1PayCode = 6)	-- WRFreeTier4 - Tier 6: Top 1% of level-earners
	begin
		exec FN_AlterUserGP @in_CustomerID, 15000, 'G1RefBonus'

		-- 7 day rental of following guns ( no attachments rentals ):
		exec FN_AddItemToUser @in_CustomerID, 101247, 7
		exec FN_AddItemToUser @in_CustomerID, 101055, 7
		exec FN_AddItemToUser @in_CustomerID, 101227, 7
		-- 7 days rental of
		exec FN_AddItemToUser @in_CustomerID, 301001, 7
		exec FN_AddItemToUser @in_CustomerID, 301003, 7
		return
	end
		
	if(@in_G1PayCode = 7)	-- WRFreeTier3 - Tier 7: Next 9% of level-earners 
	begin
		exec FN_AlterUserGP @in_CustomerID, 10000, 'G1RefBonus'

		-- 5 day rental of following guns ( no attachments rentals ):
		exec FN_AddItemToUser @in_CustomerID, 101247, 5
		exec FN_AddItemToUser @in_CustomerID, 101055, 5
		exec FN_AddItemToUser @in_CustomerID, 101227, 5
		-- 5 days rental of
		exec FN_AddItemToUser @in_CustomerID, 301001, 5
		exec FN_AddItemToUser @in_CustomerID, 301003, 5
		return
	end

	if(@in_G1PayCode = 8)	-- WRFreeTier2 - Tier 8: Next 20% of level earners
	begin
		exec FN_AlterUserGP @in_CustomerID, 7000, 'G1RefBonus'
		return
	end

	if(@in_G1PayCode = 9)	-- WRFreeTier1 - Tier 9: Next 30% of level earners
	begin
		exec FN_AlterUserGP @in_CustomerID, 5000, 'G1RefBonus'
		return
	end

	if(@in_G1PayCode >= 0)	-- any other tier - Tier 10: Bottom 40% of level earners
	begin
		exec FN_AlterUserGP @in_CustomerID, 5000, 'G1RefBonus'
		-- 7 day rental of following guns with 5 days rental of all attachments for each gun
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101247, 7, 5
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101215, 7, 5
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101055, 7, 5
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101108, 7, 5
		exec FN_AddWeaponWithAllAttachments @in_CustomerID, 101227, 7, 5
		-- 5 days rental of
		exec FN_AddItemToUser @in_CustomerID, 301001, 5
		exec FN_AddItemToUser @in_CustomerID, 301003, 5
		return
	end

END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_GIVEITEM]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pavel Tumik
-- Create date: May 24, 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[WO_SRV_GIVEITEM] 
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int,
	@in_skey2 varchar(64)
AS
BEGIN
	if(@in_skey2 != 'ACsR4x23GsjYU*476xnDvYXK@!56')
	begin
		EXEC FN_ADD_SECURITY_LOG 251, @in_IP, @in_CustomerID, @in_skey2
		select 6 as ResultCode
		return;
	end

	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME_SRV', 2002, GETDATE(), 
				0, '1', 'APPROVED', @in_ItemId)

	if(@in_ItemId = 301004) begin
	-- premium acc
		exec FN_AddPremiumAccToUser @in_CustomerID, @in_BuyDays
	end 
	else begin
		-- add that item
		exec FN_AddItemToUser @in_CustomerID, @in_ItemId, @in_BuyDays
	end

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WO_WelcomePackage4]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_WelcomePackage4] 
	@in_IP varchar(100),
	@in_CustomerID int,
	@in_Class int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @AccountStatus int
	SELECT @AccountStatus=AccountStatus FROM LoginID WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'no CustomerID' as ResultMsg
		return
	end

	if @AccountStatus <> 100 begin
		EXEC FN_ADD_SECURITY_LOG 161, @in_IP, @in_CustomerID, @AccountStatus
		select 7 as ResultCode, 'bad AccountStatus' as ResultMsg
		return
	end

	--
	-- NOTE: class related items is added inside 
	--  WO_LoadoutUnlock procedure
	--

	-- actually add things to inventory - those are your permanent items
	exec FN_AddItemToUser @in_CustomerID, 101008, 2000 -- M26 grenade
	exec FN_AddItemToUser @in_CustomerID, 101149, 2000 -- Green smoke grenade
	
	-- Add lots of goodies but just for 5 days of playing game. 
	exec FN_AddItemToUser @in_CustomerID, 101085, 3 --	Mauser SRG
	exec FN_AddItemToUser @in_CustomerID, 101095, 3 --	FN M249 MkII	23
	exec FN_AddItemToUser @in_CustomerID, 101183, 3 --	KT Decider
	exec FN_AddItemToUser @in_CustomerID, 101196, 3	-- 	Jericho
	exec FN_AddItemToUser @in_CustomerID, 101107, 3 --	FN P90 	30	
	exec FN_AddItemToUser @in_CustomerID, 101193, 3 --	FN SCAR 16
	exec FN_AddItemToUser @in_CustomerID, 101158, 3 -- Mossberg 590
	
	exec FN_AddItemToUser @in_CustomerID, 301124, 2000
	exec FN_AddItemToUser @in_CustomerID, 301124, 2000
	exec FN_AddItemToUser @in_CustomerID, 301124, 2000
	exec FN_AddItemToUser @in_CustomerID, 301124, 2000
	exec FN_AddItemToUser @in_CustomerID, 301124, 2000
	
	

	exec FN_AddItemToUser @in_CustomerID, 20022, 3 --	Beret Cover
	exec FN_AddItemToUser @in_CustomerID, 20023, 3 --	Boonie Cover
	exec FN_AddItemToUser @in_CustomerID, 20024, 3 --	M. Style Helmet
	exec FN_AddItemToUser @in_CustomerID, 20025, 3 --	Shadow
	exec FN_AddItemToUser @in_CustomerID, 20035, 3 --	Skull Mask
	exec FN_AddItemToUser @in_CustomerID, 20036, 3 --	Slash Mask
	exec FN_AddItemToUser @in_CustomerID, 20043, 3 --	M9 helmet black
	exec FN_AddItemToUser @in_CustomerID, 20046, 3 --	M9 Helmet Googles
	exec FN_AddItemToUser @in_CustomerID, 20052, 3 --	Maska Helmet
	exec FN_AddItemToUser @in_CustomerID, 20067, 3 --	KStyle NVG

	exec FN_AddItemToUser @in_CustomerID, 20018, 3 --	Sifu Lee
	exec FN_AddItemToUser @in_CustomerID, 20019, 3 --	Joe the Lumberjack
	exec FN_AddItemToUser @in_CustomerID, 20020, 3 --	Mr. East
	exec FN_AddItemToUser @in_CustomerID, 20021, 3 --	Mr. West
	exec FN_AddItemToUser @in_CustomerID, 20004, 3 --	Mr. Clean
	exec FN_AddItemToUser @in_CustomerID, 20005, 3 --	The Stealth Man
	exec FN_AddItemToUser @in_CustomerID, 20064, 3 --	Night Stalker

	exec FN_AddItemToUser @in_CustomerID, 20003, 2 --	Heavy Gear
	exec FN_AddItemToUser @in_CustomerID, 20015, 2 --	Custom Guerilla
	exec FN_AddItemToUser @in_CustomerID, 20016, 2 --	SWAT Heavy
	exec FN_AddItemToUser @in_CustomerID, 20054, 2 --	IBA Sand
	exec FN_AddItemToUser @in_CustomerID, 20056, 2 --	MTV Forest
	exec FN_AddItemToUser @in_CustomerID, 20061, 2 --	Medium Desert
	exec FN_AddItemToUser @in_CustomerID, 20065, 2 --	Night Stalker Vest

	exec FN_AddItemToUser @in_CustomerID, 20007, 2 --	SpecOps
	exec FN_AddItemToUser @in_CustomerID, 20012, 2 --	Guerilla
	exec FN_AddItemToUser @in_CustomerID, 20026, 2 --	PMC Soldier
	exec FN_AddItemToUser @in_CustomerID, 20038, 2 --	PMC Desert
	exec FN_AddItemToUser @in_CustomerID, 20039, 2 --	Prison Break
	exec FN_AddItemToUser @in_CustomerID, 20070, 2 --	Paradise Jack
	exec FN_AddItemToUser @in_CustomerID, 20071, 2 --	Sandstorm


	-- update account status and give 5000GD	
	UPDATE LoginID SET AccountStatus=101,GameDollars=(GameDollars+5000), IsFPSEnabled=1 where CustomerID=@in_CustomerID
	exec FN_AlterUserGP @in_CustomerID, 500, 'WelcomePackage'

	-- pass to unlocking loadout base slot - it'll return correct ResultCode and things
	exec WO_LoadoutUnlock @in_CustomerID, @in_Class
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SteamFinishOrder]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_SteamFinishOrder]
	@in_IP varchar(100),
	@in_CustomerID int,
	@in_OrderID bigint,
	@in_transid varchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	declare @TotalGP int = 0
	declare @PriceUSD float
	declare @ItemCode varchar(32)
			
	select @PriceUSD=Price, @TotalGP=GP, @ItemCode=ItemCode
		from SteamGPOrders 
		where OrderID=@in_OrderID and CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 7 as ResultCode, 'no order found' as ResultMsg
		return
	end
	
	set @PriceUSD = @PriceUSD / 100;	-- convert from cents to dollars
	
	-- clear that order
	delete from SteamGPOrders where OrderID=@in_OrderID and CustomerID=@in_CustomerID
	
	-- special case for predefined packages
	if(@ItemCode is not NULL) 
	begin
		declare @tr_date varchar(32) = GETDATE()
	
		exec ECLIPSE_PROCESSTRANSACTION
			@in_transid,
			@in_CustomerID,
			@tr_date,
			@PriceUSD,
			'STEAM',
			'APPROVED',
			@ItemCode,
			'SJFei937cjsjf029sdkWccYY9';
	end
	else
	begin
		-- insert to table
		declare @ItemName varchar(100) = convert(varchar(50), @TotalGP) + ' GP'
		INSERT INTO FinancialTransactions VALUES (
			@in_CustomerID, 
			@in_transid, 
			1000, 
			GETDATE(), 
			@PriceUSD, 
			'STEAM', 
			'APPROVED', 
			@ItemName)
		
		-- increate GP
		exec FN_AlterUserGP @in_CustomerID, @TotalGP, 'Steam'
	end
	
	declare @GamePoints int = 0
	select @GamePoints=GamePoints from LoginID where CustomerID=@in_CustomerID
	
	-- report balance
	select 0 as ResultCode
	select @GamePoints as 'Balance'
END
GO
/****** Object:  StoredProcedure [dbo].[WO_SRV_AddUserRoundResult4]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pavel Tumik
-- Create date: May 29, 2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[WO_SRV_AddUserRoundResult4] 
	@in_IP char(32),
	@in_CustomerID int,
	@in_GameSessionID bigint,
	@in_skey2 varchar(64),

	@in_MapID int,
	@in_MapType int = 99,
	@in_TeamID int,
	@in_GamePoints int,
	@in_GameDollars int,
	@in_HonorPoints int,
	@in_SkillPoints int,
	@in_Kills int,
	@in_Deaths int,
	@in_ShotsFired int,
	@in_ShotsHits int,
	@in_Headshots int,
	@in_AssistKills int,
	@in_Wins int,
	@in_Losses int,
	@in_CaptureNeutralPoints int,
	@in_CaptureEnemyPoints int,
	@in_TimePlayed int,
	@in_LevelUpMin int,
	@in_LevelUpMax int
AS
BEGIN
	SET NOCOUNT ON;

	if(@in_skey2 != 'ACsR4x23GsjYU*476xnDvYXK@!56')
	begin
		EXEC FN_ADD_SECURITY_LOG 171, @in_IP, 0, @in_skey2
		select 6 as ResultCode
		return;
	end

	declare @GamePoints int = 0
	declare @GameDollars int = 0
	declare @HonorPoints int = 0
	declare @SkillPoints int = 0
	declare @Kills int = 0
	declare @Deaths int = 0
	declare @ShotsFired int = 0
	declare @ShotsHits int = 0
	declare @Headshots int = 0
	declare @AssistKills int = 0
	declare @Wins int = 0
	declare @Losses int = 0
	declare @CaptureNeutralPoints int = 0
	declare @CaptureEnemyPoints int = 0
	declare @TimePlayed int = 0
	
	declare @RefferalID int

	-- get current data#1 from player info
	SELECT
		@GamePoints=GamePoints, 
		@GameDollars=GameDollars,
		@HonorPoints=HonorPoints, 
		@SkillPoints=SkillPoints,
		@RefferalID=ReferralID
	FROM LoginID
	WHERE CustomerID=@in_CustomerID
	-- fail if CustomerID is valid
	if @@ROWCOUNT = 0 begin
		EXEC FN_ADD_SECURITY_LOG 170, @in_IP, 0, @in_CustomerID
		select 6 as ResultCode
		return;
	end

	-- get current data#2 from player info
	SELECT
		@Kills=Kills, 
		@Deaths=Deaths, 
		@ShotsFired=ShotsFired, 
		@ShotsHits=ShotsHits, 
		@Headshots=Headshots, 
		@AssistKills=AssistKills, 
		@Wins=Wins, 
		@Losses=Losses, 
		@CaptureNeutralPoints=CaptureNeutralPoints, 
		@CaptureEnemyPoints=CaptureEnemyPoints, 
		@TimePlayed=TimePlayed 
	FROM Stats
	WHERE CustomerID=@in_CustomerID
	
	-- store for debug	
	INSERT INTO DBG_UserRoundResults VALUES (
		@in_IP,
		@in_GameSessionID,
		@in_CustomerID,
		@in_GamePoints,
		@in_HonorPoints,
		@in_SkillPoints,
		@in_Kills,
		@in_Deaths,
		@in_ShotsFired,
		@in_ShotsHits,
		@in_Headshots,
		@in_AssistKills,
		@in_Wins,
		@in_Losses,
		@in_CaptureNeutralPoints,
		@in_CaptureEnemyPoints,
		@in_TimePlayed,
		GETDATE(),	
		@in_GameDollars,
		@in_TeamID,
		@in_MapID,
		@in_MapType
	)

	-- update
	UPDATE Stats SET 
		Kills=(@Kills + @in_Kills), 
		Deaths=(@Deaths + @in_Deaths), 
		ShotsFired=(@ShotsFired + @in_ShotsFired),
		ShotsHits=(@ShotsHits + @in_ShotsHits), 
		Headshots=(@Headshots + @in_Headshots), 
		AssistKills=(@AssistKills + @in_AssistKills), 
		Wins=(@Wins + @in_Wins), 
		Losses=(@Losses + @in_Losses), 
		CaptureNeutralPoints=(@CaptureNeutralPoints + @in_CaptureNeutralPoints), 
		CaptureEnemyPoints=(@CaptureEnemyPoints + @in_CaptureEnemyPoints), 
		TimePlayed=(@TimePlayed + @in_TimePlayed)
	where CustomerID=@in_CustomerID
	
	UPDATE LoginID SET 
		GameDollars=(@GameDollars + @in_GameDollars),
		HonorPoints=(@HonorPoints + @in_HonorPoints), 
		SkillPoints=(@SkillPoints + @in_SkillPoints), 
		lastgamedate=GETDATE()  
	where CustomerID=@in_CustomerID
	
	exec FN_AlterUserGP @in_CustomerID, @in_GamePoints, 'AddUserRoundResult'

	-- level up bonuses
	declare @newLevel int;
	set @newLevel = @in_LevelUpMin+1;
	WHILE(@newLevel <= @in_LevelUpMax)
	BEGIN
		insert into DBG_LevelUpEvents (CustomerID, LevelGained, ReportTime, SessionID) 
			VALUES (@in_CustomerID, @newLevel, GETDATE(), @in_GameSessionID)

		exec FN_LevelUpBonus @in_CustomerID, @newLevel
		
		if(@newLevel = 10) begin
			exec FN_GiveReferrerReward @RefferalID, @in_CustomerID
		end
		
		set @newLevel = (@newLevel+1);
	END
	
	-- faction bonus
	exec WO_FactionAddRoundResult @in_CustomerID, @in_MapID, @in_TeamID, @in_Wins
	
	-- clan xp
	declare @ClanID int = 0
	select @ClanID=ClanID from LoginID where CustomerID=@in_CustomerID
	if(@ClanID > 0) begin
		declare @ClanAddXP int = @in_HonorPoints / 10
		update LoginID set ClanContributedXP=(ClanContributedXP+@ClanAddXP) where CustomerID=@in_CustomerID
		
		exec WO_ClanFN_AddXP @ClanID, @ClanAddXP
	end

	-- we're done
	select 0 as ResultCode
	
END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItem_GP]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItem_GP]
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int,
	@in_Param1 int = 0 -- used for WeaponID in FPS attachment buys
AS
BEGIN
	SET NOCOUNT ON;

	-- get points for that customer
	declare @GamePoints int
	SELECT @GamePoints=GamePoints FROM LoginID WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'no CustomerID' as ResultMsg
		return
	end

	declare @smsg1 varchar(1000)
	declare @out_FNResult int = 100

	-- get price
	declare @FinalPrice int
	exec WO_BuyItemFN_GetPrice @out_FNResult out, @in_ItemId, @in_BuyDays, 'GP', @FinalPrice out
	if(@out_FNResult > 0) begin
		set @smsg1 = LTRIM(STR(@out_FNResult)) + ' GP '
		set @smsg1 = @smsg1 + LTRIM(STR(@in_BuyDays)) + ' ' + LTRIM(STR(@in_ItemID))
		EXEC FN_ADD_SECURITY_LOG 110, @in_IP, @in_CustomerID, @smsg1
		select 6 as ResultCode, 'bad GetPrice' as ResultMsg
		return
	end
	
	-- check if enough money
	if(@GamePoints < @FinalPrice) begin
		set @smsg1 = LTRIM(STR(@in_ItemId)) + ' ' + LTRIM(STR(@in_BuyDays)) + ' '
		set @smsg1 = @smsg1 + ' GP ' + LTRIM(STR(@FinalPrice)) + ' ' + LTRIM(STR(@GamePoints))
		EXEC FN_ADD_SECURITY_LOG 114, @in_IP, @in_CustomerID, @smsg1
		select 7 as ResultCode, 'Not Enough GP' as ResultMsg
		return
	end

	-- exec item adding function, if it fail, do not process transaction further
	exec WO_BuyItemFN_Exec @out_FNResult out, @in_CustomerID, @in_ItemId, @in_BuyDays, @in_Param1
	if(@out_FNResult <> 0) begin
		set @smsg1 = 'BuyExec failed' + LTRIM(STR(@out_FNResult))
		select 7 as ResultCode, @smsg1 as ResultMsg
		return
	end

	-- perform actual transaction
	declare @AlterGP int = -@FinalPrice;
	exec FN_AlterUserGP @in_CustomerID, @AlterGP, 'WO_BuyItem_GP'
	set @GamePoints=@GamePoints-@FinalPrice;

	-- set transaction type
	declare @TType int = 0
	if(@in_BuyDays = 2000) set @TType = 3000;
	else set @TType = 2000;
	
	-- update transaction detail
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME', @TType, GETDATE(), 
				@FinalPrice, '1', 'APPROVED', @in_ItemId)

	select 0 as ResultCode
	select @GamePoints as 'Balance';

END
GO
/****** Object:  StoredProcedure [dbo].[WO_BuyItem_GD]    Script Date: 09/05/2014 18:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WO_BuyItem_GD]
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int,
	@in_Param1 int = 0 -- used for WeaponID in FPS attachment buys
AS
BEGIN
	SET NOCOUNT ON;

	-- get points for that customer
	declare @GameDollars int
	SELECT @GameDollars=GameDollars FROM LoginID WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'no CustomerID' as ResultMsg
		return
	end

	declare @smsg1 varchar(1000)
	declare @out_FNResult int = 100

	-- get price
	declare @FinalPrice int
	exec WO_BuyItemFN_GetPrice @out_FNResult out, @in_ItemId, @in_BuyDays, 'GD', @FinalPrice out
	if(@out_FNResult > 0) begin
		set @smsg1 = LTRIM(STR(@out_FNResult)) + ' GD '
		set @smsg1 = @smsg1 + LTRIM(STR(@in_BuyDays)) + ' ' + LTRIM(STR(@in_ItemID))
		EXEC FN_ADD_SECURITY_LOG 110, @in_IP, @in_CustomerID, @smsg1
		select 6 as ResultCode, 'bad GetPrice' as ResultMsg
		return
	end
	
	-- check if enough money
	if(@GameDollars < @FinalPrice) begin
		set @smsg1 = LTRIM(STR(@in_ItemId)) + ' ' + LTRIM(STR(@in_BuyDays)) + ' '
		set @smsg1 = @smsg1 + ' GD ' + LTRIM(STR(@FinalPrice)) + ' ' + LTRIM(STR(@GameDollars))
		EXEC FN_ADD_SECURITY_LOG 114, @in_IP, @in_CustomerID, @smsg1
		select 7 as ResultCode, 'Not Enough GD' as ResultMsg
		return
	end

	-- exec item adding function, if it fail, do not process transaction further
	exec WO_BuyItemFN_Exec @out_FNResult out, @in_CustomerID, @in_ItemId, @in_BuyDays, @in_Param1
	if(@out_FNResult <> 0) begin
		set @smsg1 = 'BuyExec failed' + LTRIM(STR(@out_FNResult))
		select 7 as ResultCode, @smsg1 as ResultMsg
		return
	end

	-- perform actual transaction
	set @GameDollars = @GameDollars-@FinalPrice;
	UPDATE LoginID SET GameDollars=@GameDollars where CustomerID=@in_CustomerID

	-- set transaction type
	declare @TType int = 0
	if(@in_BuyDays = 2000) set @TType = 3001;
	else set @TType = 2001;
	
	-- update transaction detail
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME', @TType, GETDATE(), 
				@FinalPrice, '1', 'APPROVED', @in_ItemId)

	select 0 as ResultCode
	select @GameDollars as 'Balance';

END
GO
/****** Object:  Default [DF_AccountInfo_email]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_email]  DEFAULT ('noemail@nowhere.com') FOR [email]
GO
/****** Object:  Default [DF_AccountInfo_firstname]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_firstname]  DEFAULT ('John') FOR [firstname]
GO
/****** Object:  Default [DF_AccountInfo_lastname]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_lastname]  DEFAULT ('Doe') FOR [lastname]
GO
/****** Object:  Default [DF__AccountInfo__sex__208CD6FA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF__AccountInfo__sex__208CD6FA]  DEFAULT ((0)) FOR [sex]
GO
/****** Object:  Default [DF_AccountInfo_dob]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_dob]  DEFAULT (((1)/(1))/(1910)) FOR [dob]
GO
/****** Object:  Default [DF_AccountInfo_street]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_street]  DEFAULT ('1 Main St') FOR [street]
GO
/****** Object:  Default [DF_AccountInfo_city]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_city]  DEFAULT ('Los Angeles') FOR [city]
GO
/****** Object:  Default [DF_AccountInfo_state]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_state]  DEFAULT ('CA') FOR [state]
GO
/****** Object:  Default [DF_AccountInfo_postalcode]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_postalcode]  DEFAULT ('0') FOR [postalcode]
GO
/****** Object:  Default [DF_AccountInfo_Country]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_Country]  DEFAULT ((1)) FOR [Country]
GO
/****** Object:  Default [DF_AccountInfo_phone]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_phone]  DEFAULT (((555)-(555))-(5555)) FOR [phone]
GO
/****** Object:  Default [DF_AccountInfo_OutOut1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_OutOut1]  DEFAULT ((0)) FOR [OptOut1]
GO
/****** Object:  Default [DF_AccountInfo_admin_note]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF_AccountInfo_admin_note]  DEFAULT ('') FOR [admin_note]
GO
/****** Object:  Default [DF__AccountIn__NumRe__18C19800]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [DF__AccountIn__NumRe__18C19800]  DEFAULT ((0)) FOR [NumReferrals]
GO
/****** Object:  Default [DF_Achievements_Value]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Achievements] ADD  CONSTRAINT [DF_Achievements_Value]  DEFAULT ((0)) FOR [Value]
GO
/****** Object:  Default [DF_Achievements_Unlocked]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Achievements] ADD  CONSTRAINT [DF_Achievements_Unlocked]  DEFAULT ((0)) FOR [Unlocked]
GO
/****** Object:  Default [DF_ClanEvents_Var1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF_ClanEvents_Var1]  DEFAULT ((0)) FOR [Var1]
GO
/****** Object:  Default [DF_ClanEvents_Var2]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF_ClanEvents_Var2]  DEFAULT ((0)) FOR [Var2]
GO
/****** Object:  Default [DF_ClanEvents_Var3]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF_ClanEvents_Var3]  DEFAULT ((0)) FOR [Var3]
GO
/****** Object:  Default [DF_ClanEvents_Var4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF_ClanEvents_Var4]  DEFAULT ((0)) FOR [Var4]
GO
/****** Object:  Default [DF__Coupons2__MultiU__11207638]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Coupons2] ADD  CONSTRAINT [DF__Coupons2__MultiU__11207638]  DEFAULT ((0)) FOR [MultiUse]
GO
/****** Object:  Default [DF_DataGameRewards_RewardDescription]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_RewardDescription]  DEFAULT ('') FOR [RewardName]
GO
/****** Object:  Default [DF_DataGameRewards_GD_CQ]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_GD_CQ]  DEFAULT ((0)) FOR [GD_CQ]
GO
/****** Object:  Default [DF_DataGameRewards_HP_CQ]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_HP_CQ]  DEFAULT ((0)) FOR [HP_CQ]
GO
/****** Object:  Default [DF_DataGameRewards_GD_DM]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_GD_DM]  DEFAULT ((0)) FOR [GD_DM]
GO
/****** Object:  Default [DF_DataGameRewards_HP_DM]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_HP_DM]  DEFAULT ((0)) FOR [HP_DM]
GO
/****** Object:  Default [DF_DataGameRewards_GD_SB]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_GD_SB]  DEFAULT ((0)) FOR [GD_SB]
GO
/****** Object:  Default [DF_DataGameRewards_HP_SB]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF_DataGameRewards_HP_SB]  DEFAULT ((0)) FOR [HP_SB]
GO
/****** Object:  Default [DF_DataSkill2Price_SkillName]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_SkillName]  DEFAULT ('SKILL DESC') FOR [SkillName]
GO
/****** Object:  Default [DF_DataSkill2Price_Lv1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_Lv1]  DEFAULT ((0)) FOR [Lv1]
GO
/****** Object:  Default [DF_DataSkill2Price_Lv2]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_Lv2]  DEFAULT ((0)) FOR [Lv2]
GO
/****** Object:  Default [DF_DataSkill2Price_Lv3]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_Lv3]  DEFAULT ((0)) FOR [Lv3]
GO
/****** Object:  Default [DF_DataSkill2Price_Lv4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_Lv4]  DEFAULT ((0)) FOR [Lv4]
GO
/****** Object:  Default [DF_DataSkill2Price_Lv5]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF_DataSkill2Price_Lv5]  DEFAULT ((0)) FOR [Lv5]
GO
/****** Object:  Default [DF_DBG_HWInfo_MacAddress]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_MacAddress]  DEFAULT ('') FOR [ComputerID]
GO
/****** Object:  Default [DF_DBG_HWInfo_CustomerID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_CustomerID]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_DBG_HWInfo_ReportDate]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_ReportDate]  DEFAULT (((2000)-(1))-(1)) FOR [ReportDate]
GO
/****** Object:  Default [DF_DBG_HWInfo_CPUName]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_CPUName]  DEFAULT ('') FOR [CPUName]
GO
/****** Object:  Default [DF_DBG_HWInfo_CPUBrand]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_CPUBrand]  DEFAULT ('') FOR [CPUBrand]
GO
/****** Object:  Default [DF_DBG_HWInfo_CPUFreq]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_CPUFreq]  DEFAULT ((0)) FOR [CPUFreq]
GO
/****** Object:  Default [DF_DBG_HWInfo_TotalMemory]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_TotalMemory]  DEFAULT ((0)) FOR [TotalMemory]
GO
/****** Object:  Default [DF_DBG_HWInfo_DisplayW]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_DisplayW]  DEFAULT ((0)) FOR [DisplayW]
GO
/****** Object:  Default [DF_DBG_HWInfo_DisplayH]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_DisplayH]  DEFAULT ((0)) FOR [DisplayH]
GO
/****** Object:  Default [DF_DBG_HWInfo_gfxIsValid]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_gfxIsValid]  DEFAULT ((0)) FOR [gfxErrors]
GO
/****** Object:  Default [DF_DBG_HWInfo_gfxVendorId]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_gfxVendorId]  DEFAULT ((0)) FOR [gfxVendorId]
GO
/****** Object:  Default [DF_DBG_HWInfo_gfxDeviceId]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_gfxDeviceId]  DEFAULT ((0)) FOR [gfxDeviceId]
GO
/****** Object:  Default [DF_DBG_HWInfo_gfxDescription]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_gfxDescription]  DEFAULT ('') FOR [gfxDescription]
GO
/****** Object:  Default [DF_DBG_HWInfo_osVersion]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_HWInfo] ADD  CONSTRAINT [DF_DBG_HWInfo_osVersion]  DEFAULT ('') FOR [OSVersion]
GO
/****** Object:  Default [DF_DBG_SQLHacks_CustomerID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_SQLHacks] ADD  CONSTRAINT [DF_DBG_SQLHacks_CustomerID]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_GameResultAdds_GameSessionID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_GameSessionID]  DEFAULT ((0)) FOR [GameSessionID]
GO
/****** Object:  Default [DF_GameResultAdds_CustomerID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_CustomerID]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_GameResultAdds_GamePoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_GamePoints]  DEFAULT ((0)) FOR [GamePoints]
GO
/****** Object:  Default [DF_GameResultAdds_HonorPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_HonorPoints]  DEFAULT ((0)) FOR [HonorPoints]
GO
/****** Object:  Default [DF_GameResultAdds_SkillPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_SkillPoints]  DEFAULT ((0)) FOR [SkillPoints]
GO
/****** Object:  Default [DF_GameResultAdds_Kills]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_Kills]  DEFAULT ((0)) FOR [Kills]
GO
/****** Object:  Default [DF_GameResultAdds_Deaths]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_Deaths]  DEFAULT ((0)) FOR [Deaths]
GO
/****** Object:  Default [DF_GameResultAdds_ShotsFired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_ShotsFired]  DEFAULT ((0)) FOR [ShotsFired]
GO
/****** Object:  Default [DF_GameResultAdds_Headshots]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_Headshots]  DEFAULT ((0)) FOR [Headshots]
GO
/****** Object:  Default [DF_GameResultAdds_AssistKills]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_AssistKills]  DEFAULT ((0)) FOR [AssistKills]
GO
/****** Object:  Default [DF_GameResultAdds_Wins]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_Wins]  DEFAULT ((0)) FOR [Wins]
GO
/****** Object:  Default [DF_GameResultAdds_Losses]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_Losses]  DEFAULT ((0)) FOR [Losses]
GO
/****** Object:  Default [DF_GameResultAdds_CaptureNeutralPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_CaptureNeutralPoints]  DEFAULT ((0)) FOR [CaptureNeutralPoints]
GO
/****** Object:  Default [DF_GameResultAdds_CaptureEnemyPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_CaptureEnemyPoints]  DEFAULT ((0)) FOR [CaptureEnemyPoints]
GO
/****** Object:  Default [DF_GameResultAdds_TimePlayed]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_GameResultAdds_TimePlayed]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF_DBG_UserRoundResults_GameReportTime]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_DBG_UserRoundResults_GameReportTime]  DEFAULT (((1)/(1))/(1970)) FOR [GameReportTime]
GO
/****** Object:  Default [DF_DBG_UserRoundResults_GameDollars]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF_DBG_UserRoundResults_GameDollars]  DEFAULT ((0)) FOR [GameDollars]
GO
/****** Object:  Default [DF__DBG_UserR__TeamI__5AF96FB1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__TeamI__5AF96FB1]  DEFAULT ((2)) FOR [TeamID]
GO
/****** Object:  Default [DF__DBG_UserR__MapID__5BED93EA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__MapID__5BED93EA]  DEFAULT ((255)) FOR [MapID]
GO
/****** Object:  Default [DF__Inventory__Quant__41F8B7BD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__Quant__41F8B7BD]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF__Inventory__UpSlo__7A3D10E0]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__UpSlo__7A3D10E0]  DEFAULT ((0)) FOR [UpSlot1]
GO
/****** Object:  Default [DF__Inventory__UpSlo__7C255952]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__UpSlo__7C255952]  DEFAULT ((-1)) FOR [UpSlot2]
GO
/****** Object:  Default [DF__Inventory__UpSlo__7D197D8B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__UpSlo__7D197D8B]  DEFAULT ((-1)) FOR [UpSlot3]
GO
/****** Object:  Default [DF__Inventory__UpSlo__7E0DA1C4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__UpSlo__7E0DA1C4]  DEFAULT ((-1)) FOR [UpSlot4]
GO
/****** Object:  Default [DF__Inventory__UpSlo__7F01C5FD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF__Inventory__UpSlo__7F01C5FD]  DEFAULT ((-1)) FOR [UpSlot5]
GO
/****** Object:  Default [DF_Inventory_FPS_IsEquipped]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Inventory_FPS] ADD  CONSTRAINT [DF_Inventory_FPS_IsEquipped]  DEFAULT ((0)) FOR [IsEquipped]
GO
/****** Object:  Default [DF__Items_Att__SpecI__3A228BCB]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__SpecI__3A228BCB]  DEFAULT ((0)) FOR [SpecID]
GO
/****** Object:  Default [DF__Items_Att__Categ__3B16B004]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Categ__3B16B004]  DEFAULT ((19)) FOR [Category]
GO
/****** Object:  Default [DF__Items_Att__Price__3C0AD43D]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__3C0AD43D]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Att__Price__3CFEF876]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__3CFEF876]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Att__Price__3DF31CAF]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__3DF31CAF]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Att__Price__3EE740E8]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__3EE740E8]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Att__GPric__3FDB6521]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__3FDB6521]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Att__GPric__40CF895A]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__40CF895A]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Att__GPric__41C3AD93]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__41C3AD93]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Att__GPric__42B7D1CC]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__42B7D1CC]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Att__IsNew__43ABF605]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__IsNew__43ABF605]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Att__Level__44A01A3E]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Level__44A01A3E]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Gea__FNAME__0539C240]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__FNAME__0539C240]  DEFAULT ('ITEM000') FOR [FNAME]
GO
/****** Object:  Default [DF_Items_Gear_Name]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Name]  DEFAULT (N'Name') FOR [Name]
GO
/****** Object:  Default [DF_Items_Gear_Description]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Description]  DEFAULT (N'Description') FOR [Description]
GO
/****** Object:  Default [DF__Items_Gea__Categ__062DE679]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Categ__062DE679]  DEFAULT ((0)) FOR [Category]
GO
/****** Object:  Default [DF_Items_Gear_Weight]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Weight]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF_Items_Gear_Armor]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Armor]  DEFAULT ((0)) FOR [DamagePerc]
GO
/****** Object:  Default [DF_Items_Gear_Speed]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Speed]  DEFAULT ((0)) FOR [DamageMax]
GO
/****** Object:  Default [DF_Items_Gear_Bulkiness]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Bulkiness]  DEFAULT ((0)) FOR [Bulkiness]
GO
/****** Object:  Default [DF_Items_Gear_Inaccuracy]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Inaccuracy]  DEFAULT ((0)) FOR [Inaccuracy]
GO
/****** Object:  Default [DF_Items_Gear_Stealth]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Stealth]  DEFAULT ((0)) FOR [Stealth]
GO
/****** Object:  Default [DF_Items_Gear_CustomFunction]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_CustomFunction]  DEFAULT ((0)) FOR [CustomFunction]
GO
/****** Object:  Default [DF_Items_Gear_ProtectionCHEM]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_ProtectionCHEM]  DEFAULT ('00000') FOR [Protection]
GO
/****** Object:  Default [DF_Items_Gear_Price1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Price1]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF_Items_Gear_Price7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Price7]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF_Items_Gear_Price30]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_Price30]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF_Items_Gear_PriceP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_PriceP]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF_Items_Gear_IsNew]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_IsNew]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF_Items_Gear_ProtectionLevel]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_ProtectionLevel]  DEFAULT ((1)) FOR [ProtectionLevel]
GO
/****** Object:  Default [DF_Items_Gear_LevelRequired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF_Items_Gear_LevelRequired]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Gea__GPric__070CFC19]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__070CFC19]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Gea__GPric__08012052]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__08012052]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Gea__GPric__08F5448B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__08F5448B]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Gea__GPric__09E968C4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__09E968C4]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF_Items_Generic_FNAME]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_FNAME]  DEFAULT ('Item_Generic') FOR [FNAME]
GO
/****** Object:  Default [DF_Items_Generic_Name]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Name]  DEFAULT (N'Name') FOR [Name]
GO
/****** Object:  Default [DF_Items_Generic_Description]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Description]  DEFAULT (N'Description') FOR [Description]
GO
/****** Object:  Default [DF_Items_Generic_Price1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Price1]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF_Items_Generic_Price7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Price7]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF_Items_Generic_Price30]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Price30]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF_Items_Generic_PriceP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_PriceP]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF_Items_Generic_IsNew]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_IsNew]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF_Items_Generic_LevelRequired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_LevelRequired]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Gen__GPric__0ADD8CFD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__0ADD8CFD]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Gen__GPric__0BD1B136]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__0BD1B136]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Gen__GPric__0CC5D56F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__0CC5D56F]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Gen__GPric__0DB9F9A8]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__0DB9F9A8]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Gen__IsSta__42ECDBF6]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__IsSta__42ECDBF6]  DEFAULT ((0)) FOR [IsStackable]
GO
/****** Object:  Default [DF__Items_Loo__GDIfH__02D256E1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_LootData] ADD  CONSTRAINT [DF__Items_Loo__GDIfH__02D256E1]  DEFAULT ((0)) FOR [GDIfHave]
GO
/****** Object:  Default [DF__Items_Pac__FNAME__23A93AC7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__FNAME__23A93AC7]  DEFAULT ('') FOR [FNAME]
GO
/****** Object:  Default [DF__Items_Pack__Name__249D5F00]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pack__Name__249D5F00]  DEFAULT (N'') FOR [Name]
GO
/****** Object:  Default [DF__Items_Pac__Descr__25918339]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Descr__25918339]  DEFAULT (N'') FOR [Description]
GO
/****** Object:  Default [DF__Items_Pac__Categ__2685A772]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Categ__2685A772]  DEFAULT ((9)) FOR [Category]
GO
/****** Object:  Default [DF__Items_Pac__Price__2779CBAB]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Price__2779CBAB]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Pac__Price__286DEFE4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Price__286DEFE4]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Pac__Price__2962141D]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Price__2962141D]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Pac__Price__2A563856]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Price__2A563856]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Pac__IsNew__2B4A5C8F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__IsNew__2B4A5C8F]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Pac__Level__2C3E80C8]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Level__2C3E80C8]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Pac__GPric__2D32A501]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__GPric__2D32A501]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Pac__GPric__2E26C93A]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__GPric__2E26C93A]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Pac__GPric__2F1AED73]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__GPric__2F1AED73]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Pac__GPric__300F11AC]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__GPric__300F11AC]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Pac__IsEna__310335E5]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__IsEna__310335E5]  DEFAULT ((1)) FOR [IsEnabled]
GO
/****** Object:  Default [DF__Items_Pac__AddGP__31F75A1E]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__AddGP__31F75A1E]  DEFAULT ((0)) FOR [AddGP]
GO
/****** Object:  Default [DF__Items_Pac__AddSP__32EB7E57]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__AddSP__32EB7E57]  DEFAULT ((0)) FOR [AddSP]
GO
/****** Object:  Default [DF__Items_Pac__Item1__33DFA290]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item1__33DFA290]  DEFAULT ((0)) FOR [Item1_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item1__34D3C6C9]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item1__34D3C6C9]  DEFAULT ((0)) FOR [Item1_Exp]
GO
/****** Object:  Default [DF__Items_Pac__Item2__35C7EB02]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item2__35C7EB02]  DEFAULT ((0)) FOR [Item2_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item2__36BC0F3B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item2__36BC0F3B]  DEFAULT ((0)) FOR [Item2_Exp]
GO
/****** Object:  Default [DF__Items_Pac__Item3__37B03374]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item3__37B03374]  DEFAULT ((0)) FOR [Item3_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item3__38A457AD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item3__38A457AD]  DEFAULT ((0)) FOR [Item3_Exp]
GO
/****** Object:  Default [DF__Items_Pac__Item4__39987BE6]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item4__39987BE6]  DEFAULT ((0)) FOR [Item4_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item4__3A8CA01F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item4__3A8CA01F]  DEFAULT ((0)) FOR [Item4_Exp]
GO
/****** Object:  Default [DF__Items_Pac__Item5__3B80C458]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item5__3B80C458]  DEFAULT ((0)) FOR [Item5_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item5__3C74E891]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item5__3C74E891]  DEFAULT ((0)) FOR [Item5_Exp]
GO
/****** Object:  Default [DF__Items_Pac__Item6__3D690CCA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item6__3D690CCA]  DEFAULT ((0)) FOR [Item6_ID]
GO
/****** Object:  Default [DF__Items_Pac__Item6__3E5D3103]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Packages] ADD  CONSTRAINT [DF__Items_Pac__Item6__3E5D3103]  DEFAULT ((0)) FOR [Item6_Exp]
GO
/****** Object:  Default [DF_Items_UpgradeData_FNAME]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_FNAME]  DEFAULT ('UP') FOR [FNAME]
GO
/****** Object:  Default [DF_Items_UpgradeData_Price1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_Price1]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF_Items_UpgradeData_Price7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_Price7]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF_Items_UpgradeData_Price30]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_Price30]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF_Items_UpgradeData_PriceP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_PriceP]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF_Items_UpgradeData_LevelRequired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_LevelRequired]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF_Items_UpgradeData_GPrice1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_GPrice1]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF_Items_UpgradeData_GPrice7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_GPrice7]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF_Items_UpgradeData_GPrice30]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_GPrice30]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF_Items_UpgradeData_GPriceP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_UpgradeData] ADD  CONSTRAINT [DF_Items_UpgradeData_GPriceP]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Wea__FNAME__2F2FFC0C]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FNAME__2F2FFC0C]  DEFAULT ('ITEM000') FOR [FNAME]
GO
/****** Object:  Default [DF__Items_Wea__Categ__30242045]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Categ__30242045]  DEFAULT ((0)) FOR [Category]
GO
/****** Object:  Default [DF_Items_Weapons_Name]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Name]  DEFAULT (N'Name') FOR [Name]
GO
/****** Object:  Default [DF_Items_Weapons_Description]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Description]  DEFAULT (N'Description') FOR [Description]
GO
/****** Object:  Default [DF_Items_Weapons_Offset]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Offset]  DEFAULT ('0 0 0') FOR [MuzzleOffset]
GO
/****** Object:  Default [DF_Items_Weapons_MuzzleParticle]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_MuzzleParticle]  DEFAULT ('default') FOR [MuzzleParticle]
GO
/****** Object:  Default [DF_Items_Weapons_Animation]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Animation]  DEFAULT ('assault') FOR [Animation]
GO
/****** Object:  Default [DF_Items_Weapons_BulletID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_BulletID]  DEFAULT ((5.45)) FOR [BulletID]
GO
/****** Object:  Default [DF_Items_Weapons_Sound_Shot]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Sound_Shot]  DEFAULT ('Sounds/Weapons/AK74_7_62_Shot') FOR [Sound_Shot]
GO
/****** Object:  Default [DF_Items_Weapons_Sound_Reload]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Sound_Reload]  DEFAULT ('Sounds/Weapons/AK74_Reload') FOR [Sound_Reload]
GO
/****** Object:  Default [DF_Items_Weapons_Damage]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Damage]  DEFAULT ((20)) FOR [Damage]
GO
/****** Object:  Default [DF_Items_Weapons_isImmediate]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_isImmediate]  DEFAULT ((1)) FOR [isImmediate]
GO
/****** Object:  Default [DF_Items_Weapons_Mass]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Mass]  DEFAULT ((0.1)) FOR [Mass]
GO
/****** Object:  Default [DF_Items_Weapons_Speed]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Speed]  DEFAULT ((300)) FOR [Speed]
GO
/****** Object:  Default [DF_Items_Weapons_DamageDecay]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_DamageDecay]  DEFAULT ((0)) FOR [DamageDecay]
GO
/****** Object:  Default [DF_Items_Weapons_Area]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Area]  DEFAULT ((0)) FOR [Area]
GO
/****** Object:  Default [DF_Items_Weapons_Delay]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Delay]  DEFAULT ((0)) FOR [Delay]
GO
/****** Object:  Default [DF_Items_Weapons_Timeout]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Timeout]  DEFAULT ((0)) FOR [Timeout]
GO
/****** Object:  Default [DF_Items_Weapons_NumClips]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_NumClips]  DEFAULT ((10)) FOR [NumClips]
GO
/****** Object:  Default [DF_Items_Weapons_Clipsize]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Clipsize]  DEFAULT ((30)) FOR [Clipsize]
GO
/****** Object:  Default [DF_Items_Weapons_Reloadtime]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Reloadtime]  DEFAULT ((2.5)) FOR [ReloadTime]
GO
/****** Object:  Default [DF_Items_Weapons_ActiveReloadTick]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_ActiveReloadTick]  DEFAULT ((1.2)) FOR [ActiveReloadTick]
GO
/****** Object:  Default [DF_Items_Weapons_RateOfFire]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_RateOfFire]  DEFAULT ((600)) FOR [RateOfFire]
GO
/****** Object:  Default [DF_Items_Weapons_Spread]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Spread]  DEFAULT ((0.08)) FOR [Spread]
GO
/****** Object:  Default [DF_Items_Weapons_Recoil]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Recoil]  DEFAULT ((1)) FOR [Recoil]
GO
/****** Object:  Default [DF_Items_Weapons_NumGrenades]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_NumGrenades]  DEFAULT ((0)) FOR [NumGrenades]
GO
/****** Object:  Default [DF_Items_Weapons_GrenadeName]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_GrenadeName]  DEFAULT ('asr_grenade') FOR [GrenadeName]
GO
/****** Object:  Default [DF_Items_Weapons_Firemode]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Firemode]  DEFAULT ((101)) FOR [Firemode]
GO
/****** Object:  Default [DF_Items_Weapons_DetectionRaius]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_DetectionRaius]  DEFAULT ((30)) FOR [DetectionRadius]
GO
/****** Object:  Default [DF_Items_Weapons_ScopeType]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_ScopeType]  DEFAULT ('default') FOR [ScopeType]
GO
/****** Object:  Default [DF_Items_Weapons_ScopeZoom]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_ScopeZoom]  DEFAULT ((0)) FOR [ScopeZoom]
GO
/****** Object:  Default [DF_Items_Weapons_Price1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Price1]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF_Items_Weapons_Price7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Price7]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF_Items_Weapons_Price30]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Price30]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF_Items_Weapons_PriceP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_PriceP]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF_Items_Weapons_IsNew]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_IsNew]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF_Items_Weapons_LevelRequired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_LevelRequired]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Wea__GPric__0EAE1DE1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__0EAE1DE1]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Wea__GPric__0FA2421A]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__0FA2421A]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Wea__GPric__10966653]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__10966653]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Wea__GPric__118A8A8C]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__118A8A8C]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Wea__Shots__5BB889C0]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Shots__5BB889C0]  DEFAULT ((0)) FOR [ShotsFired]
GO
/****** Object:  Default [DF__Items_Wea__Shots__5CACADF9]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Shots__5CACADF9]  DEFAULT ((0)) FOR [ShotsHits]
GO
/****** Object:  Default [DF__Items_Wea__Kills__5DA0D232]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__5DA0D232]  DEFAULT ((0)) FOR [KillsCQ]
GO
/****** Object:  Default [DF__Items_Wea__Kills__5E94F66B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__5E94F66B]  DEFAULT ((0)) FOR [KillsDM]
GO
/****** Object:  Default [DF__Items_Wea__Kills__5F891AA4]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__5F891AA4]  DEFAULT ((0)) FOR [KillsSB]
GO
/****** Object:  Default [DF__Items_Wea__IsUpg__7854C86E]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__IsUpg__7854C86E]  DEFAULT ((1)) FOR [IsUpgradeable]
GO
/****** Object:  Default [DF__Items_Wea__IsFPS__270FB757]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__IsFPS__270FB757]  DEFAULT ((0)) FOR [IsFPS]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2803DB90]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2803DB90]  DEFAULT ((0)) FOR [FPSSpec0]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__28F7FFC9]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__28F7FFC9]  DEFAULT ((0)) FOR [FPSSpec1]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__29EC2402]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__29EC2402]  DEFAULT ((0)) FOR [FPSSpec2]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2AE0483B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2AE0483B]  DEFAULT ((0)) FOR [FPSSpec3]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2BD46C74]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2BD46C74]  DEFAULT ((0)) FOR [FPSSpec4]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2CC890AD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2CC890AD]  DEFAULT ((0)) FOR [FPSSpec5]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2DBCB4E6]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2DBCB4E6]  DEFAULT ((0)) FOR [FPSSpec6]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2EB0D91F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2EB0D91F]  DEFAULT ((0)) FOR [FPSSpec7]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__2FA4FD58]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__2FA4FD58]  DEFAULT ((0)) FOR [FPSSpec8]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__30992191]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__30992191]  DEFAULT ((0)) FOR [FPSAttach0]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__318D45CA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__318D45CA]  DEFAULT ((0)) FOR [FPSAttach1]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__32816A03]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__32816A03]  DEFAULT ((0)) FOR [FPSAttach2]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__33758E3C]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__33758E3C]  DEFAULT ((0)) FOR [FPSAttach3]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__3469B275]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__3469B275]  DEFAULT ((0)) FOR [FPSAttach4]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__355DD6AE]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__355DD6AE]  DEFAULT ((0)) FOR [FPSAttach5]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__3651FAE7]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__3651FAE7]  DEFAULT ((0)) FOR [FPSAttach6]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__37461F20]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__37461F20]  DEFAULT ((0)) FOR [FPSAttach7]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__383A4359]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__383A4359]  DEFAULT ((0)) FOR [FPSAttach8]
GO
/****** Object:  Default [DF__Items_Wea__AnimP__5011CCEA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__AnimP__5011CCEA]  DEFAULT ('') FOR [AnimPrefix]
GO
/****** Object:  Default [DF__LoginID__Account__02084FDA]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Account__02084FDA]  DEFAULT ((100)) FOR [AccountStatus]
GO
/****** Object:  Default [DF__LoginID__GamePoi__02FC7413]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__GamePoi__02FC7413]  DEFAULT ((0)) FOR [GamePoints]
GO
/****** Object:  Default [DF_LoginID_HonorPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_HonorPoints]  DEFAULT ((0)) FOR [HonorPoints]
GO
/****** Object:  Default [DF_LoginID_SkillPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_SkillPoints]  DEFAULT ((0)) FOR [SkillPoints]
GO
/****** Object:  Default [DF_LoginID_Gamertag]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_Gamertag]  DEFAULT (N'gamertag') FOR [Gamertag]
GO
/****** Object:  Default [DF_LoginID_dateregistered]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_dateregistered]  DEFAULT ('1/1/1973 12:00') FOR [dateregistered]
GO
/****** Object:  Default [DF_LoginID_lastlogindate]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_lastlogindate]  DEFAULT ('1/1/1973 12:00') FOR [lastlogindate]
GO
/****** Object:  Default [DF_LoginID_lastloginIP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_lastloginIP]  DEFAULT ('0.0.0.0') FOR [lastloginIP]
GO
/****** Object:  Default [DF_LoginID_lastgamedate]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_lastgamedate]  DEFAULT ('1/1/1973 12:00') FOR [lastgamedate]
GO
/****** Object:  Default [DF_LoginID_ReferralID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_ReferralID]  DEFAULT ((23742)) FOR [ReferralID]
GO
/****** Object:  Default [DF_LoginID_lastjoineddate]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_lastjoineddate]  DEFAULT (((1970)-(1))-(1)) FOR [lastjoineddate]
GO
/****** Object:  Default [DF_LoginID_MD5Password]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_MD5Password]  DEFAULT ('') FOR [MD5Password]
GO
/****** Object:  Default [DF__LoginID__ClanID__7AA72534]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__ClanID__7AA72534]  DEFAULT ((0)) FOR [ClanID]
GO
/****** Object:  Default [DF_LoginID_GameDollars]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF_LoginID_GameDollars]  DEFAULT ((0)) FOR [GameDollars]
GO
/****** Object:  Default [DF__LoginID__Faction__5634BA94]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Faction__5634BA94]  DEFAULT ((0)) FOR [Faction1Score]
GO
/****** Object:  Default [DF__LoginID__Faction__5728DECD]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Faction__5728DECD]  DEFAULT ((0)) FOR [Faction2Score]
GO
/****** Object:  Default [DF__LoginID__Faction__581D0306]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Faction__581D0306]  DEFAULT ((0)) FOR [Faction3Score]
GO
/****** Object:  Default [DF__LoginID__Faction__5911273F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Faction__5911273F]  DEFAULT ((0)) FOR [Faction4Score]
GO
/****** Object:  Default [DF__LoginID__Faction__5A054B78]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__Faction__5A054B78]  DEFAULT ((0)) FOR [Faction5Score]
GO
/****** Object:  Default [DF__LoginID__ClanRan__67E9567B]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__ClanRan__67E9567B]  DEFAULT ((99)) FOR [ClanRank]
GO
/****** Object:  Default [DF__LoginID__IsFPSEn__16A44564]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__IsFPSEn__16A44564]  DEFAULT ((0)) FOR [IsFPSEnabled]
GO
/****** Object:  Default [DF__LoginID__ClanCon__741A2336]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__ClanCon__741A2336]  DEFAULT ((0)) FOR [ClanContributedXP]
GO
/****** Object:  Default [DF__LoginID__ClanCon__750E476F]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__ClanCon__750E476F]  DEFAULT ((0)) FOR [ClanContributedGP]
GO
/****** Object:  Default [DF__LoginID__IsDevel__08211BE3]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginID] ADD  CONSTRAINT [DF__LoginID__IsDevel__08211BE3]  DEFAULT ((0)) FOR [IsDeveloper]
GO
/****** Object:  Default [DF_Logins_CustomerID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_CustomerID]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_Logins_LoginTime]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_LoginTime]  DEFAULT (((12)/(1))/(1973)) FOR [LoginTime]
GO
/****** Object:  Default [DF_Logins_IP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_IP]  DEFAULT ('1.1.1.1') FOR [IP]
GO
/****** Object:  Default [DF_Logins_Source]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_Source]  DEFAULT ((0)) FOR [LoginSource]
GO
/****** Object:  Default [DF_LoginSessions_SessionID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginSessions] ADD  CONSTRAINT [DF_LoginSessions_SessionID]  DEFAULT ((0)) FOR [SessionID]
GO
/****** Object:  Default [DF__LoginSess__GameS__15261146]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[LoginSessions] ADD  CONSTRAINT [DF__LoginSess__GameS__15261146]  DEFAULT ((0)) FOR [GameSessionID]
GO
/****** Object:  Default [DF_MasterServerInfo_ServerID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF_MasterServerInfo_ServerID]  DEFAULT ((0)) FOR [ServerID]
GO
/****** Object:  Default [DF_MasterServerInfo_LastUpdated]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF_MasterServerInfo_LastUpdated]  DEFAULT (((1)/(1))/(1970)) FOR [LastUpdated]
GO
/****** Object:  Default [DF_MasterServerInfo_CreateGameKey]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF_MasterServerInfo_CreateGameKey]  DEFAULT ((0)) FOR [CreateGameKey]
GO
/****** Object:  Default [DF_MasterServerInfo_IP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF_MasterServerInfo_IP]  DEFAULT ('0.0.0.0') FOR [IP]
GO
/****** Object:  Default [DF_Profile_Chars_HonorPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF_Profile_Chars_HonorPoints]  DEFAULT ((0)) FOR [HonorPoints]
GO
/****** Object:  Default [DF_Profile_Chars_TimePlayed]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF_Profile_Chars_TimePlayed]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF__Profile_C__Skill__4B180DA3]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF__Profile_C__Skill__4B180DA3]  DEFAULT ('') FOR [Skills]
GO
/****** Object:  Default [DF__Profile_C__Spend__4EE89E87]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF__Profile_C__Spend__4EE89E87]  DEFAULT ((0)) FOR [SpendSP1]
GO
/****** Object:  Default [DF__Profile_C__Spend__4FDCC2C0]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF__Profile_C__Spend__4FDCC2C0]  DEFAULT ((0)) FOR [SpendSP2]
GO
/****** Object:  Default [DF__Profile_C__Spend__50D0E6F9]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Profile_Chars] ADD  CONSTRAINT [DF__Profile_C__Spend__50D0E6F9]  DEFAULT ((0)) FOR [SpendSP3]
GO
/****** Object:  Default [DF_ProfileData_Skills]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ProfileData] ADD  CONSTRAINT [DF_ProfileData_Skills]  DEFAULT ('0000000000') FOR [Skills]
GO
/****** Object:  Default [DF_ProfileData_Achievements]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ProfileData] ADD  CONSTRAINT [DF_ProfileData_Achievements]  DEFAULT ((0)) FOR [Achievements]
GO
/****** Object:  Default [DF_ProfileData_Abilities]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[ProfileData] ADD  CONSTRAINT [DF_ProfileData_Abilities]  DEFAULT ((0)) FOR [Abilities]
GO
/****** Object:  Default [DF_SecurityLog_IP]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF_SecurityLog_IP]  DEFAULT ('0.0.0.0') FOR [IP]
GO
/****** Object:  Default [DF_SecurityLog_UserID]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF_SecurityLog_UserID]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF_SecurityLog_EventData]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF_SecurityLog_EventData]  DEFAULT ('') FOR [EventData]
GO
/****** Object:  Default [DF_Stats_Kills]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Kills]  DEFAULT ((0)) FOR [Kills]
GO
/****** Object:  Default [DF_Stats_Deaths]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Deaths]  DEFAULT ((0)) FOR [Deaths]
GO
/****** Object:  Default [DF_Stats_ShotsFired]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_ShotsFired]  DEFAULT ((0)) FOR [ShotsFired]
GO
/****** Object:  Default [DF_Stats_ShotsHits]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_ShotsHits]  DEFAULT ((0)) FOR [ShotsHits]
GO
/****** Object:  Default [DF_Stats_Headshots]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Headshots]  DEFAULT ((0)) FOR [Headshots]
GO
/****** Object:  Default [DF_Stats_AssistKills]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_AssistKills]  DEFAULT ((0)) FOR [AssistKills]
GO
/****** Object:  Default [DF_Stats_Wins]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Wins]  DEFAULT ((0)) FOR [Wins]
GO
/****** Object:  Default [DF_Stats_Losses]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Losses]  DEFAULT ((0)) FOR [Losses]
GO
/****** Object:  Default [DF_Stats_CaptureNeutralPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_CaptureNeutralPoints]  DEFAULT ((0)) FOR [CaptureNeutralPoints]
GO
/****** Object:  Default [DF_Stats_CaptureEnemyPoints]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_CaptureEnemyPoints]  DEFAULT ((0)) FOR [CaptureEnemyPoints]
GO
/****** Object:  Default [DF_Stats_TimePlayed]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_TimePlayed]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF_Stats_CheatAttempts]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_CheatAttempts]  DEFAULT ((0)) FOR [CheatAttempts]
GO
/****** Object:  Default [DF_VitalStatsV2_DAU1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[VitalStatsV2] ADD  CONSTRAINT [DF_VitalStatsV2_DAU1]  DEFAULT ((0)) FOR [DAU1]
GO
/****** Object:  Default [DF_VitalStatsV2_MAU1]    Script Date: 09/05/2014 18:17:01 ******/
ALTER TABLE [dbo].[VitalStatsV2] ADD  CONSTRAINT [DF_VitalStatsV2_MAU1]  DEFAULT ((0)) FOR [MAU1]
GO
