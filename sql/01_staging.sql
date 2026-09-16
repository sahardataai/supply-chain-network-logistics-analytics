-- Staging layer for the Maven Analytics US Candy Distributor dataset.
-- Raw source data is not redistributed in this repository.

USE [USCandyDistributor]
GO

/****** Object:  Table [dbo].[stg_Factories]    Script Date: 9/16/2026 6:09:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_Factories](
	[Factory] [nvarchar](50) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL
) ON [PRIMARY]
GO
-- -----------------------------------
USE [USCandyDistributor]
GO

/****** Object:  Table [dbo].[stg_Products]    Script Date: 9/16/2026 6:10:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_Products](
	[Division] [nvarchar](50) NOT NULL,
	[Product_Name] [nvarchar](50) NOT NULL,
	[Factory] [nvarchar](50) NOT NULL,
	[Product_ID] [nvarchar](50) NOT NULL,
	[Unit_Price] [float] NOT NULL,
	[Unit_Cost] [float] NOT NULL
) ON [PRIMARY]
GO
-- -------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  Table [dbo].[stg_Sales]    Script Date: 9/16/2026 6:10:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_Sales](
	[Row_ID] [smallint] NOT NULL,
	[Order_ID] [nvarchar](50) NOT NULL,
	[Order_Date] [date] NOT NULL,
	[Ship_Date] [date] NOT NULL,
	[Ship_Mode] [nvarchar](50) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Country_Region] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State_Province] [nvarchar](50) NOT NULL,
	[Postal_Code] [nvarchar](50) NOT NULL,
	[Division] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[Product_ID] [nvarchar](50) NOT NULL,
	[Product_Name] [nvarchar](50) NOT NULL,
	[Sales] [float] NOT NULL,
	[Units] [float] NOT NULL,
	[Gross_Profit] [float] NOT NULL,
	[Cost] [float] NOT NULL
) ON [PRIMARY]
GO
-- ------------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  Table [dbo].[stg_Targets]    Script Date: 9/16/2026 6:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_Targets](
	[Division] [nvarchar](50) NOT NULL,
	[Target] [smallint] NOT NULL
) ON [PRIMARY]
GO
-- -----------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  Table [dbo].[stg_uszips]    Script Date: 9/16/2026 6:11:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_uszips](
	[zip] [nvarchar](50) NOT NULL,
	[lat] [nvarchar](50) NOT NULL,
	[lng] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state_id] [nvarchar](50) NOT NULL,
	[state_name] [nvarchar](50) NOT NULL,
	[zcta] [nvarchar](50) NOT NULL,
	[parent_zcta] [nvarchar](10) NULL,
	[population] [int] NULL,
	[density] [float] NULL,
	[county_fips] [nvarchar](10) NOT NULL,
	[county_name] [nvarchar](50) NOT NULL,
	[county_weights] [nvarchar](max) NOT NULL,
	[county_names_all] [nvarchar](max) NOT NULL,
	[county_fips_all] [nvarchar](max) NOT NULL,
	[imprecise] [nvarchar](50) NOT NULL,
	[military] [nvarchar](50) NOT NULL,
	[timezone] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
