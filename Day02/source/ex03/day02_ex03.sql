WITH cte_table AS (SELECT day::date AS missing_date
                   FROM generate_series(timestamp '2022-01-01', '2022-01-10', interval '1 day') AS day)
SELECT missing_date
FROM cte_table
         LEFT JOIN (SELECT person_id, visit_date
                    FROM person_visits
                    WHERE (person_id = 1 OR person_id = 2)) AS table_person_visits
                   ON missing_date = table_person_visits.visit_date
WHERE table_person_visits IS NULL
ORDER BY missing_date;
