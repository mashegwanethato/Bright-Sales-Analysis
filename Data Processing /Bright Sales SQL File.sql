---------------------------------------------------------------------------
-- Exploratory Data Analysis
SELECT *
FROM casestudy4.salescasestudy.salesanalysis;

SELECT DAYNAME(TO_DATE(Date, 'DD/MM/YYYY')) AS Name_Of_Day
FROM casestudy4.salescasestudy.salesanalysis;
----------------------------------------------------------------------------
SELECT date,
       -- Getting the Day Name
       DAYNAME(TO_DATE(Date, 'DD/MM/YYYY')) AS Name_Of_Day,
       -- Getting the Month Name
       MONTHNAME(TO_DATE(Date, 'DD/MM/YYYY')) AS Name_Of_Month,
       -- Rounding off the results to 2 decimal places for the Sales, Cost of sales and Quantity sold columns
       ROUND(sales, 2) AS sales,
       ROUND(cost_of_sales, 2) AS cost_of_sales,
       ROUND(quantity_sold, 2) AS quantity_sold,
       --Calculating the Average Units Sold and rounding off the results to 2 decimal places
       ROUND(AVG(quantity_sold), 2) AS Average_Units_Sold,
       -- Calculating Total Revenue and rounding off the results to 2 decimal places
       ROUND(quantity_sold * sales , 2) AS Total_Revenue,
       ROUND (((sales - cost_of_sales) / sales) * 100 , 2) AS Profit_Margin,
       -- Classifying the revenue
       CASE
            WHEN total_revenue < 50000000 THEN 'Low Revenue'
            WHEN total_revenue BETWEEN 50000000 AND 100000000 THEN 'Medium Revenue'
            WHEN total_revenue > 100000000 THEN 'High Revenue'
        END AS Revenue_Classification,

       CASE
            WHEN profit_margin < 0 THEN 'Negative Profit'
            WHEN profit_margin BETWEEN 0.1 AND 5.99 THEN 'Relatively Good Profit'
            WHEN profit_margin >= 6 THEN 'Great Profit'
        END AS Profit_Classification
FROM casestudy4.salescasestudy.salesanalysis
GROUP BY ALL;
