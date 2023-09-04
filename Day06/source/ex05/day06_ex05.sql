COMMENT ON TABLE person_discounts IS 'Это таблица индивидуальных скидок клиентов для пиццерий';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный идентификатор клиента из таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный идентификатор пиццерии из таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Индивидуальная скидка клиента';
