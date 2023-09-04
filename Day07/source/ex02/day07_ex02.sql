(SELECT name, COUNT(order_date) AS count, 'order' AS action_type
 FROM person_order
          JOIN menu ON menu.id = person_order.menu_id
          JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 GROUP BY name, action_type
 ORDER BY action_type ASC, count DESC
 LIMIT 3)
UNION
(SELECT name, COUNT(visit_date) AS count, 'visit' AS action_type
 FROM person_visits
          JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
 GROUP BY name, action_type
 ORDER BY action_type ASC, count DESC
 LIMIT 3)
ORDER BY action_type ASC, count DESC;
