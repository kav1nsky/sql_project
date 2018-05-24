-- вывести количество взятых задач каждого солвера и средний чек по этим задачам
select
  email,
  count(task_id),
  avg(price)
from examhelp.task
right join examhelp.user on user_id = solver and status = 'taken'
group by user_id
order by count(*) desc;

-- вывести все категории и средний чек где есть открытые таски, которые запостили за опр. время
select category_title, avg(price)
from examhelp.task
join examhelp.category on category_id = category
where status = 'open' and posted_on between '2015-05-05 00:00:00' and '2020-05-05 23:59:59'
group by category_title
order by avg(price) desc;

-- все сообщения от солверов из телеграма
select
  text,
  message_id,
  email,
  sent_on
from examhelp.user
  left join examhelp.message on sender = user_id and method = 'telegram'
  where user_group = 'solver'
order by message_id;


-- все солверы на которых есть не рассмотренные жалобы
select
  email,
  user_group,
  issue.description, issue.status
from examhelp.issue
  right join examhelp.task on task_id = task
  right join examhelp.user on user_id = solver and issue.status = 'not resolved'
where user_group = 'solver';


select
  user_id,
  email,
  user_group,
  count(*)
from examhelp.message
  left join examhelp.user on sender = user_id
group by user_id
order by count(*) > 0 desc;
