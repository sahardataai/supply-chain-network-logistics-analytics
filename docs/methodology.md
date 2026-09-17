# Methodology

## Data Preparation

The project uses the Maven Analytics US Candy Distributor dataset.

Raw source tables were loaded into SQL Server staging tables and transformed into analytical views before being connected to Power BI.

Key transformations included:

- Standardizing data types for sales, units, gross profit and cost.
- Creating clean product, factory, geography and sales views.
- Building a dedicated Date dimension for time-intelligence analysis.
- Correcting the source `Ship_Date`, which contained a systematic +2,000-day offset.
- Calculating `Shipping_Days` as the difference between Order Date and corrected Ship Date.

## Supply-Distance Analysis

Customer and factory latitude/longitude coordinates were used to calculate approximate straight-line distance using the Haversine formula.

A customer-location × factory distance table was created in Power Query and linked to sales transactions through a lane key.

Distance bands used in the analysis:

- < 500 km
- 500–1,500 km
- 1,500–3,000 km
- 3,000+ km

## Network Interpretation

Each product in the dataset is manufactured by only one factory.

Because alternative manufacturing capability is not available in the source data, proximity to another factory does not mean that an order could realistically be reassigned there.

Distance is therefore interpreted as **network design exposure**, rather than a routing-choice or nearest-factory optimization opportunity.

## Shipping Performance

`Shipping_Days` measures the time between Order Date and Ship Date.

The dataset does not contain:

- Delivery Date
- SLA targets
- On-time delivery status
- Carrier delay reasons

For this reason, the dashboard avoids labeling shipments as "late" or calculating OTIF/on-time delivery metrics.

Shipping analysis focuses instead on:

- Average Shipping Days
- P90 Shipping Days
- Ship Mode performance
- Factory × Ship Mode performance
- Factory-market distance and shipping-time relationships
- Lead-time consistency across comparable lanes

## Product Profitability

Product performance is evaluated using:

- Sales
- Units Sold
- Gross Profit
- Gross Margin %
- Pareto concentration
- Product volume ranking

The profitability matrix combines relative product volume with actual gross margin to identify higher-value, lower-priority and margin-review products.

## Targets

The source target table contains Division and Target values but no explicit year or month.

Because the applicable period cannot be established reliably, target-versus-actual analysis was not included in the final dashboard.
