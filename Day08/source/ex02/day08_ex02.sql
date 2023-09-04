-- Session №1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Начинаем транзакцию
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверили рейтинг
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Задаем рейтинг 4 Пицце Хат

-- Session №2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Начинаем транзакцию
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверили рейтинг
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Задаем рейтинг 3.6 Пицце Хат

-- Session №1
COMMIT; -- Опубликовать свои изменения

-- Session №2
COMMIT; -- Опубликовать свои изменения

-- Session №1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг

-- Session №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверяем рейтинг