INSERT INTO examhelp.category (category_id, category_title, description, min_price, max_price, parent_category)
    SELECT 1, 'Математика', 'Все виды работ по элементарной и высшей математике', cast(NULL AS FLOAT),cast(NULL AS FLOAT),  cast(NULL AS INT) UNION ALL
    SELECT 2, 'Химия', 'Школьная и вузовская химия', cast(NULL AS FLOAT),cast(NULL AS FLOAT), cast(NULL AS INT);


INSERT INTO examhelp.category (category_id, category_title, description, min_price, max_price, parent_category)
    SELECT 3, 'Школьная математика', 'Математика за 7-11 классы', 100.0, 5000.0, 33 UNION ALL
    SELECT 4, 'Домашние задания по высшей математике', 'Матан, линал, аналит, статистика и т.д', 100.0, 20000.0, 33 UNION ALL
    SELECT 5, 'Экзмены по высшей математике 1-2 курс', 'Матан, линал, аналит, статистика и т.д', 3000.0, 20000.0, 33 UNION ALL
    SELECT 6, 'Курсовые по высшей математике 3+ курс', 'Функан, диффуры, дискран и т.д', 5000.0, 40000.0, 33 UNION ALL
    SELECT 7, 'Школьная химия', 'Химия за 8-11 класс', 100.0 , 8000.0, 34 UNION ALL
    SELECT 8, 'Лабы по химии', 'Вузовские лабораторные работы', 700.0 , 10000.0, 34;


INSERT INTO examhelp.user (user_id, email, password, tg_id, vk_id, user_group, current_task)
    SELECT 1, 'artemiolaaa@gmail.com', 'b8fb30ed086157b83c1b7f6ad206be9c2117f305', '212863417', cast(NULL AS VARCHAR(20)), 'admin', cast(NULL AS INT) UNION ALL
    SELECT 2, 'edgar@mail.ru', 'f6834d99b9ea8aae121013a67612ff3e09b98dee', '511825457', cast(NULL AS VARCHAR(20)), 'solver', cast(NULL AS INT) UNION ALL
    SELECT 3, 'ponomarev@leha.ru', '56c8e878b916dd8298af3c8b97eda90fbfcea19a', '189416221', cast(NULL AS VARCHAR(20)), 'student', cast(NULL AS INT) UNION ALL
    SELECT 4, 'mark.shehter@mail.ru', '89f43d1844f96003dece2522ab8349af64c8c4ce', cast(NULL AS VARCHAR(20)), cast(NULL AS VARCHAR(20)), 'solver', cast(NULL AS INT) UNION ALL
    SELECT 5, 'bogdany4@mail.ru', 'd7f67e22d5cf7b34ed30c25445ff4c3c1e50b4c3', cast(NULL AS VARCHAR(20)), cast(NULL AS VARCHAR(20)), 'student', cast(NULL AS INT);


INSERT INTO examhelp.task (task_id, description, status, price, posted_on, taken_on, closed_on, category, poster, solver)
--     SELECT 1, 'Решить письменный экзамен', 'taken', 5000.0, TO_TIMESTAMP('18/05/2018 03:40:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('18/05/2018 05:12:00', 'DD/MM/YYYY HH24:MI:SS') , cast(null as timestamp), 5, 5, 4 UNION ALL
--     SELECT 2, 'Решить домашку', 'taken', 300.0, TO_TIMESTAMP('18/05/2018 05:40:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('18/05/2018 11:40:00', 'DD/MM/YYYY HH24:MI:SS') , cast(null as timestamp), 5, 5, 4 UNION ALL
--     SELECT 3, 'Составить уравнение реакции', 'open', 500.0, TO_TIMESTAMP('18/05/2018 05:40:00', 'DD/MM/YYYY HH24:MI:SS'),  cast(null as timestamp) , cast(null as timestamp), 7, 5, NULL UNION ALL ;
--     SELECT 4, 'Посчитать производные', 'open', 600.0, TO_TIMESTAMP('15/05/2018 01:00:00', 'DD/MM/YYYY HH24:MI:SS'),  cast(null as timestamp) , cast(null as timestamp), 4, 3, 2 UNION ALL
--     SELECT 5, 'Посчитать интегралы', 'open', 900.0, TO_TIMESTAMP('12/05/2018 03:30:00', 'DD/MM/YYYY HH24:MI:SS'),  cast(null as timestamp) , cast(null as timestamp), 4, 3, 2;
       SELECT 6, 'Решить олимпиаду по математике', 'open', 3000.0, TO_TIMESTAMP('18/05/2018 16:20:00', 'DD/MM/YYYY HH24:MI:SS'),  cast(null as timestamp) , cast(null as timestamp), 3, 3, 4;

INSERT INTO examhelp.issue (issue_id, task, status, description)
    SELECT 1, 1, 'not resolved', 'Слишком долго';
--     SELECT 2, 2, 'resolved', 'Солвер не отвечает';


INSERT INTO examhelp.chat (chat_id, solver, student)
    SELECT 1, 2, 3 UNION ALL
    SELECT 2, 4, 3;


INSERT INTO examhelp.message(message_id, chat, sender, text, method, task, sent_on)
    SELECT 1, 2, 3, 'Нужно посчитать интеграл от sin x', 'telegram', 5, CURRENT_TIMESTAMP UNION ALL
    SELECT 2, 2, 4, 'Ок, сейчас сделаем', 'telegram', 5, CURRENT_TIMESTAMP UNION ALL
    SELECT 3, 2, 3, 'жду....', 'telegram', 5, CURRENT_TIMESTAMP UNION ALL
    SELECT 4, 2, 4, '-cos x + C', 'telegram', 5, CURRENT_TIMESTAMP UNION ALL
    SELECT 5, 2, 3, 'Спасибо) только очень долго', 'telegram', 5, CURRENT_TIMESTAMP;