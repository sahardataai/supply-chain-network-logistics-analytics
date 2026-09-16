-- ========================
-- CREATE DATE DIMENSION
-- ========================

USE USCandyDistributor;
GO

CREATE TABLE dbo.DimDate
(
    DateKey             int         NOT NULL PRIMARY KEY,
    [Date]              date        NOT NULL,
    Calendar_Year       int         NOT NULL,
    Calendar_Quarter    int         NOT NULL,
    Month_Number        int         NOT NULL,
    Month_Name          varchar(20) NOT NULL,
    Short_Month         varchar(3)  NOT NULL,
    Year_Month          varchar(7)  NOT NULL,
    Day_Number          int         NOT NULL
);
GO

DECLARE @StartDate date =
(
    SELECT MIN(Order_Date)
    FROM dbo.vw_FactSales
);

DECLARE @EndDate date =
(
    SELECT MAX(Order_Date)
    FROM dbo.vw_FactSales
);

WITH DateSeries AS
(
    SELECT @StartDate AS DateValue

    UNION ALL

    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSeries
    WHERE DateValue < @EndDate
)

INSERT INTO dbo.DimDate
(
    DateKey,
    [Date],
    Calendar_Year,
    Calendar_Quarter,
    Month_Number,
    Month_Name,
    Short_Month,
    Year_Month,
    Day_Number
)

SELECT
    CONVERT(int, CONVERT(char(8), DateValue, 112)) AS DateKey,
    DateValue,
    YEAR(DateValue),
    DATEPART(QUARTER, DateValue),
    MONTH(DateValue),
    DATENAME(MONTH, DateValue),
    LEFT(DATENAME(MONTH, DateValue), 3),
    CONVERT(char(7), DateValue, 120),
    DAY(DateValue)
FROM DateSeries

OPTION (MAXRECURSION 0);

SELECT
    COUNT(*) AS TotalDates,
    MIN([Date]) AS FirstDate,
    MAX([Date]) AS LastDate
FROM dbo.DimDate;

SELECT *
FROM dbo.DimDate;
