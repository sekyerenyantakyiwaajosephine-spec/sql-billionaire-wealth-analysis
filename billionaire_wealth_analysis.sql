-- Q1: Retrieve the 20 richest billionaires
SELECT
    rank,
    name,
    country,
    industry,
    networth_billion AS net_worth_billion_usd
FROM Top200RichestPersonintheWorld
ORDER BY networth_billion DESC
LIMIT 20;
-- Q2: Identify the five youngest billionaires
SELECT
    name,
    age,
    country,
    industry,
    networth_billion AS net_worth_billion_usd
FROM Top200RichestPersonintheWorld
ORDER BY age ASC,networth_billion DESC
LIMIT 5;
-- Q3: Calculate the average age and average net worth
SELECT
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(networth_billion), 2) AS average_net_worth_billion_usd
FROM Top200RichestPersonintheWorld;
-- Q4: Identify the five most represented countries
SELECT
    country,
    COUNT(*) AS number_of_billionaires
FROM Top200RichestPersonintheWorld
GROUP BY country
ORDER BY number_of_billionaires DESC, country ASC
LIMIT 5;
-- Q5: Calculate the combined net worth of billionaires from each country
SELECT
    country,
    COUNT(*) AS number_of_billionaires,
    ROUND(SUM(networth_billion), 2) AS combined_net_worth_billion_usd
FROM Top200RichestPersonintheWorld
GROUP BY country
ORDER BY combined_net_worth_billion_usd DESC;
-- Q6: Identify the five industries with the highest number of billionaires
SELECT
    industry,
    COUNT(*) AS number_of_billionaires
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY number_of_billionaires DESC 
LIMIT 5;
-- Q7: Find countries with at least five billionaires
SELECT
    country,
    COUNT(*) AS number_of_billionaires
FROM Top200RichestPersonintheWorld
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY number_of_billionaires DESC;
-- Q8: Calculate the total wealth of billionaires younger than 50
SELECT
    COUNT(*) AS number_of_billionaires_under_50,
    ROUND(SUM(networth_billion), 2) AS total_net_worth_billion_usd
FROM Top200RichestPersonintheWorld
WHERE age < 50;
-- Q9: Identify billionaires whose net worth exceeds the overall average net worth
SELECT
    rank,
    name,
    country,
    industry,
    networth_billion AS networth_billion_usd
FROM Top200RichestPersonintheWorld
WHERE networth_billion > (
    SELECT AVG(networth_billion)
    FROM Top200RichestPersonintheWorld
)
ORDER BY networth_billion DESC;
-- Q10: Identify the industry with the highest average net worth
SELECT
    industry,
    COUNT(*) AS number_of_billionaires,
    ROUND(AVG(networth_billion), 2) AS average_net_worth_billion_usd
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY average_net_worth_billion_usd DESC;
-- Q11: Share of total wealth held by each industry
SELECT
    industry,
    COUNT(*) AS number_of_billionaires,
    ROUND(SUM(networth_billion), 2) AS industry_wealth_billion_usd,
    ROUND(
        SUM(networth_billion) * 100.0 /
        (SELECT SUM(networth_billion) FROM Top200RichestPersonintheWorld),
        2
    ) AS percentage_of_total_wealth
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY industry_wealth_billion_usd DESC;
-- Q12: Compare wealth across age groups
SELECT
    CASE
        WHEN age < 50 THEN 'Under 50'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80 and above'
    END AS age_group,
    COUNT(*) AS number_of_billionaires,
    ROUND(SUM(networth_billion), 2) AS total_net_worth_billion_usd,
    ROUND(AVG(networth_billion), 2) AS average_net_worth_billion_usd
FROM Top200RichestPersonintheWorld
GROUP BY age_group
ORDER BY
    CASE age_group
        WHEN 'Under 50' THEN 1
        WHEN '50-59' THEN 2
        WHEN '60-69' THEN 3
        WHEN '70-79' THEN 4
        ELSE 5
    END;
    -- Q13: Richest billionaire in each country
SELECT
    b.country,
    b.name,
    b.age,
    b.industry,
    b.networth_billion AS net_worth_billion_usd
FROM Top200RichestPersonintheWorld AS b
JOIN (
    SELECT country, MAX(networth_billion) AS max_net_worth
    FROM Top200RichestPersonintheWorld
    GROUP BY country
) AS top_per_country
    ON b.country = top_per_country.country
    AND b.networth_billion = top_per_country.max_net_worth
ORDER BY b.networth_billion DESC;
-- Q14: Wealth held by the top 10 compared with the other 190
SELECT
    wealth_group,
    COUNT(*) AS number_of_billionaires,
    ROUND(SUM(networth_billion), 2) AS total_net_worth_billion_usd,
    ROUND(
        SUM(networth_billion) * 100.0 /
        (SELECT SUM(networth_billion) FROM Top200RichestPersonintheWorld),
        2
    ) AS percentage_of_total_wealth
FROM (
    SELECT
        networth_billion,
        CASE
            WHEN rank <= 10 THEN 'Top 10'
            ELSE 'Other 190'
        END AS wealth_group
    FROM Top200RichestPersonintheWorld
)
GROUP BY wealth_group
ORDER BY total_net_worth_billion_usd ASC;
-- Q14: Wealth held by the top 10 compared with the other 190
SELECT
    wealth_group,
    COUNT(*) AS number_of_billionaires,
    ROUND(SUM(networth_billion), 2) AS total_net_worth_billion_usd,
    ROUND(
        SUM(networth_billion) * 100.0 /
        (SELECT SUM(networth_billion) FROM Top200RichestPersonintheWorld),
        2
    ) AS percentage_of_total_wealth
FROM (
    SELECT
        networth_billion,
        CASE
            WHEN rank <= 10 THEN 'Top 10'
            ELSE 'Other 190'
        END AS wealth_group
    FROM Top200RichestPersonintheWorld
)
GROUP BY wealth_group
ORDER BY total_net_worth_billion_usd ASC;
-- Q15: Identify the five oldest billionaires
SELECT
    name,
    age,
    country,
    industry,
    networth_billion AS net_worth_billion_usd
FROM Top200RichestPersonintheWorld
ORDER BY age DESC, networth_billion DESC
LIMIT 5;
