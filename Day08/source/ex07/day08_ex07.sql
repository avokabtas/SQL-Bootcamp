-- Session №1
BEGIN; -- Начинаем транзакцию

-- Session №2
BEGIN; -- Начинаем транзакцию

-- Session №1
UPDATE pizzeria SET rating = 1 WHERE id = 1; -- Задаем новый рейтинг пиццерии с id 1

-- Session №2
UPDATE pizzeria SET rating = 2 WHERE id = 2; -- Задаем новый рейтинг пиццерии с id 2

-- Session №1
UPDATE pizzeria SET rating = 3 WHERE id = 2; -- Задаем новый рейтинг пиццерии с id 1

-- Session №2
UPDATE pizzeria SET rating = 4 WHERE id = 1; -- Задаем новый рейтинг пиццерии с id 2

-- Session №1
COMMIT; -- Опубликовать свои изменения

-- Session №2
COMMIT; -- Опубликовать свои изменения

-- Session №1 - применились изменения - рейтинги 1 и 3
-- Session №2 - выдал ошибку, изменения не применились