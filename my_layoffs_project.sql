-- Exploratory Data Analysis on layoffs_raw2 table
-- Dataset columns used: company, industry, location, country, date, total_laid_off, funds_raised_millions


-- 1) Companies with the highest total layoffs
-- Groups rows by company
-- Adds total layoffs per company
-- Sorts from highest to lowest


SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_raw2
GROUP BY company
ORDER BY total_laid_off DESC;


-- 2) Industries with the most layoffs
-- Groups data by industry
-- Shows total layoffs per industry
-- Highest impact industries appear first

SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_raw2
GROUP BY industry
ORDER BY total_laid_off DESC;


-- 3) Total funds raised by location
-- Groups startups by location
-- Adds total funding raised per location
-- Sorted from lowest to highest

SELECT 
    location,
    SUM(funds_raised_millions) AS total_sum_raised
FROM layoffs_raw2
GROUP BY location
ORDER BY total_sum_raised ASC;


-- 4) Countries with the most layoffs
-- Aggregates layoffs per country
-- Ranks countries by total layoffs

SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_raw2
GROUP BY country
ORDER BY total_laid_off DESC;


-- 5) Full table preview
-- Shows all columns and rows

SELECT *
FROM layoffs_raw2;


-- 6) Year with the most layoffs
-- Extracts year from date column
-- Groups by year
-- Shows total layoffs per year

SELECT YEAR(`date`) AS year, SUM(total_laid_off) AS total_laid_off
FROM layoffs_raw2
GROUP BY year
ORDER BY year DESC;


-- 7) Monthly layoffs trend
-- Converts date into YYYY-MM format
-- Groups by month
-- Shows layoffs trend over time

SELECT 
    DATE_FORMAT(`date`, '%Y-%m') AS `month`,
    SUM(total_laid_off) AS total_off
FROM layoffs_raw2
WHERE `date` IS NOT NULL
GROUP BY `month`
ORDER BY `month` ASC;


-- 8) Rolling total of layoffs
-- First query aggregates monthly totals
-- Second query applies running total using window function

WITH Rolling_Total AS (
    SELECT 
        DATE_FORMAT(`date`, '%Y-%m') AS `month`, 
        SUM(total_laid_off) AS total_off
    FROM layoffs_raw2
    WHERE `date` IS NOT NULL
    GROUP BY `month`
)
SELECT 
    `month`, 
    total_off,
    SUM(total_off) OVER (ORDER BY `month`) AS rolling_total
FROM Rolling_Total;


-- 9) Layoffs by country and year
-- Breaks down layoffs per country each year
-- Useful for trend comparison

SELECT 
    country,
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_raw2
GROUP BY country, year
ORDER BY country ASC;


-- 10) Ranking countries by layoffs per year
-- First CTE aggregates data by country and year
-- Second CTE ranks countries per year using DENSE_RANK

WITH country_year (country, years, total_laid_off) AS (
    SELECT 
        country,
        YEAR(`date`) AS years,
        SUM(total_laid_off)
    FROM layoffs_raw2
    GROUP BY country, years
),
country_year_rank AS (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY years 
               ORDER BY total_laid_off DESC
           ) AS total_ranking
    FROM country_year
    WHERE years IS NOT NULL
)

SELECT *
FROM country_year_rank;s