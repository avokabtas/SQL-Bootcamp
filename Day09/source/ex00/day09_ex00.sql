CREATE TABLE person_audit
(
    created    timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event char(1)                  NOT NULL DEFAULT 'I',
    row_id     bigint                   NOT NULL,
    name       varchar                  NOT NULL,
    age        integer                  NOT NULL DEFAULT 10,
    gender     varchar                           DEFAULT 'female' NOT NULL,
    address    varchar
);

ALTER TABLE person_audit
    ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
    ADD CONSTRAINT ch_gender CHECK (gender IN ('female', 'male') );

CREATE
    OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$trg_person_insert_audit$
BEGIN
    INSERT INTO person_audit SELECT CURRENT_TIMESTAMP, 'I', new.id, new.name, new.age, new.gender, new.address;
    RETURN NULL;
END;
$trg_person_insert_audit$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
