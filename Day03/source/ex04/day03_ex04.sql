WITH cte_female AS (SELECT pizzeria.name AS pizzeria_name, gender
                    FROM person_order
                             FULL JOIN person ON person.id = person_order.person_id
                             JOIN menu ON person_order.menu_id = menu.id
                             JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                    WHERE gender = 'female'),

     cte_male AS (SELECT pizzeria.name AS pizzeria_name, gender
                  FROM person_order
                           FULL JOIN person ON person.id = person_order.person_id
                           JOIN menu ON person_order.menu_id = menu.id
                           JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                  WHERE gender = 'male')

SELECT pizzeria_name
FROM cte_female
WHERE pizzeria_name NOT IN (SELECT pizzeria_name FROM cte_male)
UNION
SELECT pizzeria_name
FROM cte_male
WHERE pizzeria_name NOT IN (SELECT pizzeria_name FROM cte_female)
ORDER BY pizzeria_name;
