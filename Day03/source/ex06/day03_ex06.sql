SELECT pizza_name, pizzeria_name_1, pizzeria_name_2, menu_1.price
FROM (SELECT pizzeria.id AS pizzeria_id_1, pizzeria.name AS pizzeria_name_1, menu.pizza_name AS pizza_name, price
      FROM menu
               JOIN pizzeria ON pizzeria.id = menu.pizzeria_id) AS menu_1
         JOIN
     (SELECT pizzeria.id AS pizzeria_id_2, pizzeria.name AS pizzeria_name_2, menu.pizza_name AS pizza_name_2, price
      FROM menu
               JOIN pizzeria ON pizzeria.id = menu.pizzeria_id) AS menu_2
     ON menu_1.price = menu_2.price AND menu_1.pizza_name = menu_2.pizza_name_2
WHERE pizzeria_id_1 > pizzeria_id_2;

