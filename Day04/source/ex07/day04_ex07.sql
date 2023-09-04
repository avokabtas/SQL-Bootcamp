INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria.id
         FROM pizzeria
                  JOIN menu ON pizzeria.id = menu.pizzeria_id
         WHERE price < 800
           AND pizzeria.id NOT IN (SELECT pizzeria.id
                                   FROM person_visits
                                            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                                            JOIN person ON person_visits.person_id = person.id
                                   WHERE person.name = 'Dmitriy')), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

DELETE FROM person_visits WHERE id = 20;