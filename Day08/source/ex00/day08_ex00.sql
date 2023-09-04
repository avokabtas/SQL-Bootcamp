-- Session #1
BEGIN; -- Начало транзакции
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- Задаем рейтинг 5 Пицце Хат
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверили наличие изменений

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверили отсутствие изменений

-- Session #1
COMMIT; -- Опубликовать свои изменения

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверили наличие изменений