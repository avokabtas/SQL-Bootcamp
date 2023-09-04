WITH cte_table AS (SELECT person.name, pizza_name
                   FROM person
                            JOIN person_order ON person_order.person_id = person.id
                            JOIN menu ON menu.id = person_order.menu_id
                   WHERE person.gender = 'female')
SELECT cte_table.name
FROM cte_table
WHERE cte_table.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT cte_table.name
FROM cte_table
WHERE cte_table.pizza_name = 'cheese pizza'
ORDER BY name;