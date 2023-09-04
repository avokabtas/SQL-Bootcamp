WITH cte_table AS ((SELECT pizzeria.name AS name, menu.pizzeria_id AS pizzeria_id
                    FROM person_order
                             JOIN menu ON person_order.menu_id = menu.id
                             JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
                   UNION ALL
                   (SELECT pizzeria.name AS name, pizzeria_id AS pizzeria_id
                    FROM person_visits
                             JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id))
SELECT name, COUNT(pizzeria_id) AS total_count
FROM cte_table
GROUP BY name
ORDER BY total_count DESC, name ASC;
