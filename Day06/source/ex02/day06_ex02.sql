SELECT person.name,
       pizza_name,
       price,
       (price * (100 - discount) / 100) AS discount_price,
       pizzeria.name                    AS pizzeria_name
FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN person ON person.id = person_order.person_id
         JOIN person_discounts
              ON person_discounts.person_id = person.id AND person_discounts.pizzeria_id = menu.pizzeria_id
         JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
ORDER BY name, pizza_name;
