SELECT name
FROM (SELECT name, id
      FROM person
      WHERE (address = 'Moscow' OR address = 'Samara')
        AND gender = 'male') AS table_person
         JOIN person_order ON person_id = table_person.id
         JOIN menu ON menu_id = menu.id
WHERE (pizza_name = 'pepperoni pizza'
    OR pizza_name = 'mushroom pizza')
ORDER BY name DESC;