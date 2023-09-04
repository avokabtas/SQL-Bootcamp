-- Session №1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Начинаем транзакцию

-- Session №2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Начинаем транзакцию

-- Session №1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг

-- Session №2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Задаем рейтинг 3.0 Пицце Хат
COMMIT; -- Опубликовать свои изменения

-- Session №1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг
COMMIT; -- Опубликовать свои изменения

-- Session №1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг

-- Session №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг
