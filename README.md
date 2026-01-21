# Layoffs_Project_Analysis

## Background
This project explores a global layoffs dataset using SQL. The goal is to understand patterns in layoffs across companies, industries, countries, and time. The dataset contains information such as company names, industries, locations, total layoffs, funding raised, and dates.

I answered real business questions like:
```
• Which companies laid off the most employees?
• Which industries were hit hardest?
• Which countries recorded the highest layoffs?
• How did layoffs change over time?
• Which countries ranked highest in layoffs each year?
```
## Project Structure
```
Layoffs_SQL_Analysis
│
├─ data
│ └─ layoffs.csv
│
├─ sql
│ └─ my_layoffs_project.sql
│
└─ README.md
```
## Analysis
These are the key analyses performed in the project.

Company analysis
I calculated total layoffs per company and ranked companies from highest to lowest. This highlights organizations most affected by workforce reductions.

Industry analysis
I grouped data by industry and summed total layoffs. This helps identify sectors that experienced the most disruption.

Location and country analysis
I aggregated layoffs by country and also analyzed funding raised by location. This gives a geographic view of both layoffs and investment patterns.

Time-based analysis
I extracted years and months from the date column to analyze layoffs over time.
I identified which years had the highest layoffs and built a monthly trend showing how layoffs evolved.

Rolling total analysis
I used window functions to calculate a running total of layoffs over time. This shows how layoffs accumulated month after month.

Ranking analysis
I used CTEs and DENSE_RANK to rank countries by total layoffs for each year. This shows which countries were most impacted in different periods.

## Project Overview
This project analyzes a global layoffs dataset using SQL. I explored patterns in layoffs across companies, industries, locations, countries, and time. I wrote queries to answer real questions like which companies laid off the most staff, which industries were most affected, how layoffs changed over time, and which countries ranked highest each year.
The project shows strong use of aggregation, grouping, date functions, CTEs, and window functions for real data analysis.

I demonstrated skills in:
```
• Writing structured SQL queries
• Using GROUP BY and ORDER BY for summaries
• Using date functions to analyze trends
• Using CTEs for cleaner logic
• Using window functions for rolling totals and rankings
• Writing readable, well-commented SQL scripts
```

## Tools Used
```
• MySQL
• MySQL Workbench
```

## Key Insight 
```
• A small number of companies account for a large share of total layoffs, showing layoffs are highly concentrated rather than evenly spread.

• Certain industries experienced far higher layoffs than others, showing sector-specific impact instead of a general downturn across all industries.

• Some countries consistently recorded higher layoffs than others, suggesting regional differences in company stability and market pressure.

• Layoffs increased sharply during specific periods, showing that layoffs tend to spike during global economic stress rather than rising steadily.

• The rolling total analysis shows layoffs accumulate quickly once a downturn begins, which highlights how fast workforce reductions can scale.

• Yearly ranking of countries shows that the most affected country changes over time, meaning impact shifts across regions instead of staying fixed.
```

## Executive Summary

This project performs an exploratory analysis of a global layoffs dataset using SQL. By aggregating data across companies, industries, countries, and time, it identifies which organizations and sectors were most affected, how layoffs evolved monthly and yearly, and the regional distribution of workforce reductions. Rolling totals and ranking analyses highlight trends over time and reveal countries most impacted each year. The project demonstrates the use of advanced SQL techniques including CTEs, window functions, grouping, and date manipulation to extract actionable insights from raw data.
