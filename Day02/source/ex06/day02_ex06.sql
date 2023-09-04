SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person
         JOIN person_order ON person.id = person_order.person_id
         JOIN menu ON menu.id = person_order.menu_id
         JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Denis'
   OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;

