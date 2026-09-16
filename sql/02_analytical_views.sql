USE [USCandyDistributor]
GO

/****** Object:  View [dbo].[vw_DimFactory]    Script Date: 9/16/2026 5:48:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_DimFactory] AS
SELECT
    Factory,
    Latitude,
    Longitude
FROM dbo.stg_Factories;
GO
-- ----------------------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  View [dbo].[vw_DimGeography]    Script Date: 9/16/2026 5:49:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[vw_DimGeography] AS
SELECT DISTINCT
    s.Postal_Code,
    s.Country_Region,
    s.City,
    s.State_Province,
    s.Region,
    TRY_CONVERT(float, z.lat) AS Latitude,
    TRY_CONVERT(float, z.lng) AS Longitude

FROM dbo.stg_Sales AS s

LEFT JOIN dbo.stg_uszips AS z
    ON s.Postal_Code = z.zip;
GO
-- ----------------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  View [dbo].[vw_DimProduct]    Script Date: 9/16/2026 5:55:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_DimProduct] AS
SELECT
    Product_ID,
    Product_Name,
    Division,
    Factory,
    CAST(Unit_Price AS Decimal(12,2)) AS Unit_Price,
    CAST(Unit_Cost AS Decimal (12,2)) AS Unit_Cost

FROM dbo.stg_Products;

GO
-- ---------------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  View [dbo].[vw_DimTargets]    Script Date: 9/16/2026 5:55:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_DimTargets] AS
SELECT
    Division,
    Target
FROM dbo.stg_Targets;
GO
-- ------------------------------------------
USE [USCandyDistributor]
GO

/****** Object:  View [dbo].[vw_FactSales]    Script Date: 9/16/2026 5:56:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_FactSales] AS
SELECT
    Row_ID,
    Order_ID,
    Order_Date,
    DATEADD(DAY, -2000, Ship_Date) AS Ship_Date,
    DATEDIFF(
        DAY,
        Order_Date,
        DATEADD(DAY, -2000, Ship_Date)
    ) AS Shipping_Days,

    Ship_Mode,
    Customer_ID,
    Country_Region,
    City,
    State_Province,
    Postal_Code,
    Region,
    Product_ID,

    CAST(Sales AS decimal(12,2)) AS Sales,
    CAST(Units AS int) AS Units,
    CAST(Gross_Profit AS decimal(12,2)) AS Gross_Profit,
    CAST(Cost AS decimal(12,2)) AS Cost

FROM dbo.stg_Sales;
GO
