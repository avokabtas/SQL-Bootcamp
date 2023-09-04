WITH cte_female AS (SELECT pizzeria.name AS pizzeria_name, gender
                    FROM person_visits
                             FULL JOIN person ON person.id = person_visits.person_id
                             JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                    WHERE gender = 'female'),

     cte_male AS (SELECT pizzeria.name AS pizzeria_name, gender
                  FROM person_visits
                           FULL JOIN person ON person.id = person_visits.person_id
                           JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                  WHERE gender = 'male')

(SELECT pizzeria_name
FROM cte_female
EXCEPT ALL
SELECT pizzeria_name
FROM cte_male)
UNION
(SELECT pizzeria_name
 FROM cte_male
 EXCEPT ALL
 SELECT pizzeria_name
 FROM cte_female)
ORDER BY pizzeria_name;