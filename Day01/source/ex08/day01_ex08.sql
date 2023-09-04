SELECT order_date, CONCAT(table_person.name, ' (age:', table_person.age, ')') AS person_information
FROM person_order
         NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS table_person
ORDER BY order_date, person_information;
