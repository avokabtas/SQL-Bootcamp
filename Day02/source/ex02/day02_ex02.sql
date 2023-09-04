SELECT COALESCE(person_name, '-') AS person_name, visit_date, COALESCE(pizzeria_name, '-') AS pizzeria_name
FROM ((SELECT person.name AS person_name, visit_date, pizzeria.name AS pizzeria_name
       FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS table_person_visits
                FULL JOIN person ON table_person_visits.person_id = person.id
                FULL JOIN pizzeria ON table_person_visits.pizzeria_id = pizzeria.id)) AS table_all_join
ORDER BY person_name, visit_date, pizzeria_name;
