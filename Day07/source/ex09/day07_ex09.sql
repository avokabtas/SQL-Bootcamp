WITH cte_table AS (SELECT address,
                          ROUND(MAX(age)::numeric - (MIN(age)::numeric / MAX(age::numeric)), 2) AS formula,
                          ROUND(AVG(age)::numeric, 2)                                           AS average
                   FROM person
                   GROUP BY person.address)
SELECT *, formula > average AS comparison
FROM cte_table
ORDER BY address;
