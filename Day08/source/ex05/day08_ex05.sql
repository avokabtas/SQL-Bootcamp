-- Session №1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Начинаем транзакцию

-- Session №2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Начинаем транзакцию

-- Session №1
SELECT SUM(rating) FROM pizzeria; -- Проверяем сумму рейтингов всех пиццерий

-- Session №2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; -- Задаем рейтинг 1 Пицце Хат
COMMIT; -- Опубликовать свои изменения

-- Session №1
SELECT SUM(rating) FROM pizzeria; -- Проверяем сумму рейтингов всех пиццерий
COMMIT; -- Опубликовать свои изменения

-- Session №1
SELECT SUM(rating) FROM pizzeria; -- Проверяем сумму рейтингов всех пиццерий

-- Session №2
SELECT SUM(rating) FROM pizzeria; -- Проверяем сумму рейтингов всех пиццерий