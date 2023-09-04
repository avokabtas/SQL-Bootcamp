DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
    RETURNS SETOF person
AS
$persons$
SELECT *
FROM person
WHERE gender IN (pgender)
$persons$
    LANGUAGE SQL;

SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();
