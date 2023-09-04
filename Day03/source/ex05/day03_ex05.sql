WITH cte_visit AS (SELECT pizzeria.name AS pizzeria_name
                   FROM person_visits
                            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                            JOIN person ON person_visits.person_id = person.id
                   WHERE person.name = 'Andrey'),

     cte_order AS (SELECT pizzeria.name AS pizzeria_name
                   FROM person_order
                            JOIN menu ON person_order.menu_id = menu.id
                            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                            JOIN person ON person_order.person_id = person.id
                   WHERE person.name = 'Andrey')

SELECT pizzeria_name
FROM cte_visit
EXCEPT
SELECT pizzeria_name
FROM cte_order
ORDER BY pizzeria_name;
