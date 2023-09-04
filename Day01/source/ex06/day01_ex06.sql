SELECT DISTINCT visit_date        AS action_date,
                table_person.name AS person_name
FROM person_visits AS table_person_visits
         INNER JOIN person AS table_person ON table_person.id = table_person_visits.person_id
         INNER JOIN person_order AS table_person_order ON table_person_order.person_id = table_person_visits.person_id
    AND table_person_order.order_date = table_person_visits.visit_date
ORDER BY action_date ASC, person_name DESC;
