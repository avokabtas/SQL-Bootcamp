CREATE
    OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy',
                                                           pprice numeric DEFAULT 500,
                                                           pdate date DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                pizzeria_name varchar
            )
AS
$person_visits_and_eats_on_date$
BEGIN
    RETURN QUERY (SELECT DISTINCT pizzeria.name
                  FROM person
                           JOIN person_order ON person.id = person_order.person_id
                           JOIN person_visits ON person.id = person_visits.person_id
                           JOIN menu ON menu.id = person_order.menu_id
                           JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
                  WHERE person.name IN (pperson)
                    AND menu.price < pprice
                    AND person_order.order_date IN (pdate)
                    AND person_order.order_date = person_visits.visit_date);
END;
$person_visits_and_eats_on_date$
    LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Peter', pprice := 1300, pdate := '2022-01-05');


-- DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(character varying,numeric,date);
