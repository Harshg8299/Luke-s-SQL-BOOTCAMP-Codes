SELECT * 
FROM invoices_fact;

-- Operations(Arithematic ( + , - , * , / etc....))
SELECT 
	project_company,
    nerd_id,
    nerd_role,
    hours_rate AS rate_original,
    hours_rate - 5 AS rate_drop,
    hours_rate + 5 AS rate_hike,
    ((hours_rate + 5) * hours_spent) AS project_total
FROM
	invoices_fact
WHERE
	project_total > 10000;
-- project total (after hike) = rate_hike * hours_spent

SELECT
	activity_id,
    hours_spent,
    hours_spent % 8 AS extra_hours
FROM 
	invoices_fact
WHERE 
	(hours_spent BETWEEN 8 AND 16)
	AND
	extra_hours > 0
    
ORDER BY
	hours_spent;

/*PRACTICE PROBLEM 3
	Question: Calculate the current month's total earning's per project
    	      Calculate a scenario where the hourly rate increases by $5
	          Why?
                   See the difference if we raised the hourly rate
                   Frigure out what's reasonable raise*/

SELECT
	project_id,
	SUM(hours_spent * hours_rate) AS project_original_cost,
    SUM(hours_spent * (hours_rate + 5)) AS project_projected_cost
FROM 
	invoices_fact
GROUP BY
	project_id


