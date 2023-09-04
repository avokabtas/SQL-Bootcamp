INSERT INTO person_order
SELECT (SELECT MAX(id) FROM person_order) + person.id,
       person.id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25'
FROM person;