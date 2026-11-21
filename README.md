# sql-billionaire-wealth-analysis

A SQL project that studies wealth among the world's 200 richest people. Built with SQLite.

## Business Scenario

I work as a Junior Data Analyst at a global financial research organisation. The team wants to understand how wealth is spread among the top 200 richest people in the world. My job is to answer key business questions using SQL.

## Dataset

The dataset is the Top 200 Richest People in the World list, based on Forbes.

The file is `Top_200_Richest_Person_in_the_World.csv`. It has 200 rows and 7 columns.

- `serial_number`: Row number
- `rank`: Global rank by net worth
- `name`: Name of the billionaire
- `age`: Age of the billionaire
- `country`: Country of the billionaire
- `networth_billion`: Net worth in billions of US dollars
- `industry`: Industry where the wealth comes from

## Tools

- SQLite (run in the browser with SQL Online)
- GitHub for documentation

## Data Checks

I checked the data before analysis.

- All 200 rows imported correctly.
- No missing values.
- No duplicate names.
- Column types were correct: integers for rank and age, decimals for net worth, text for the rest.

The imported table is named `Top200RichestPersonintheWorld`.

## SQL Skills Used

- SELECT, WHERE, ORDER BY, LIMIT
- Aggregate functions: COUNT, SUM, AVG, MAX
- GROUP BY and HAVING
- Subqueries
- CASE statements
- JOIN

## Business Questions and Findings

The full code for every question is in `billionaire_wealth_analysis.sql`.

### Q1. Who are the 20 richest billionaires?

Bernard Arnault and family lead with 233 billion dollars. Elon Musk is second with 195 billion. Jeff Bezos is third with 194 billion.

### Q2. Who are the five youngest billionaires?

Mark Mateschitz is the youngest at 31. Lukas Walton is next at 37. Mark Zuckerberg, Dustin Moskovitz and Pavel Durov are all 39.

### Q3. What are the average age and average net worth?

The average age is 69.38 years. The average net worth is 31.84 billion dollars.

### Q4. Which five countries have the most billionaires?

1. United States: 79
2. China: 17
3. India: 13
4. Germany: 11
5. Russia: 11

### Q5. What is the combined net worth by country?

The United States holds 3,130.9 billion dollars. That is about 49 percent of all the wealth in the dataset. France is second with 478.8 billion. India is third with 434.5 billion. China is fourth with 387.4 billion.

France has only 7 billionaires. Yet it ranks second in total wealth. This is because of the very large fortune of Bernard Arnault and family.

### Q6. Which five industries have the most billionaires?

1. Technology: 40
2. Finance and Investments: 32
3. Fashion and Retail: 30
4. Diversified: 15
5. Food and Beverage: 15

### Q7. Which countries have at least five billionaires?

Eight countries meet this rule: United States (79), China (17), India (13), Germany (11), Russia (11), France (7), Hong Kong (7) and Australia (5).

I used `HAVING` here because the filter works on grouped counts.

### Q8. What is the total wealth of billionaires younger than 50?

There are 16 billionaires under 50. Together they hold 508.3 billion dollars.

### Q9. Who has a net worth above the average?

53 of the 200 billionaires are above the average of 31.84 billion dollars. A few very large fortunes pull the average up.

### Q10. Which industry has the highest average net worth?

Telecom has the highest average at 102 billion dollars. But it has only one billionaire, so the average is just one person's wealth.

Technology is the more reliable answer. It has an average of 43.47 billion dollars across 40 billionaires.

## Extra Questions

### Q11. Which industries hold the largest share of total wealth?

The total wealth of all 200 billionaires is 6,368.5 billion dollars.

- Technology holds 27.3 percent.
- Fashion and Retail holds 18.3 percent.
- Finance and Investments holds 13.39 percent.

### Q12. How does wealth compare across age groups?

- Under 50: 16 billionaires, 508.3 billion dollars in total
- 50 to 59: 35 billionaires, 1,115.2 billion dollars
- 60 to 69: 42 billionaires, 1,527.9 billion dollars
- 70 to 79: 58 billionaires, 1,763.7 billion dollars
- 80 and above: 49 billionaires, 1,453.4 billion dollars

Most billionaires are over 60. The 60 to 69 group has the highest average net worth at 36.38 billion dollars.

### Q13. Who is the richest person in each country?

The query returns 36 rows for 35 countries. Switzerland has two people tied at 33.1 billion dollars: Gianluigi Aponte and Rafaela Aponte-Diamant. I kept both because a tie is a true result.

### Q14. How much wealth do the top 10 hold compared with the other 190?

The top 10 hold 1,552 billion dollars. That is 24.37 percent of all wealth. The other 190 hold 4,816.5 billion dollars, or 75.63 percent.

### Q15. Who are the five oldest billionaires?

1. Robert Kuok, 100, Malaysia
2. Lee Shau Kee, 96, Hong Kong
3. Goh Cheng Liang, 96, Singapore
4. Li Ka-shing, 95, Hong Kong
5. Lui Che Woo, 95, Hong Kong

## Key Insights

1. Wealth is highly concentrated. The top 10 people hold almost a quarter of all wealth.
2. The United States dominates. It has 79 of the 200 billionaires and about half of the total wealth.
3. Technology leads in both headcount and total wealth.
4. Most billionaires are older. The largest group is aged 70 to 79.
5. Averages can mislead. Telecom looks richest on average, but it has only one person.

## Notes on My Approach

- I added tie-breakers to sorting so results stay in a fixed order.
- I checked for ties before using `LIMIT`, so no result was cut off unfairly.
- I added headcounts beside averages to show how reliable each average is.

## How to Run This Project

1. Open SQL Online at https://sqliteonline.com and choose SQLite.
2. Import `Top_200_Richest_Person_in_the_World.csv` as a table.
3. Open `billionaire_wealth_analysis.sql` and run the queries one at a time.
4. If your table name is different, replace `Top200RichestPersonintheWorld` in the queries.

## Author

Josephine Nyantakyiwaa Sekyere

LinkedIn: https://www.linkedin.com/in/josephinenyantakyiwaasekyere
