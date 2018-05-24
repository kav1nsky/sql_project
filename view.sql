create view CategoryView
  as
    select
      category_title,
      description,
      min_price,
      max_price
    from examhelp.category;

create view UserView
  as
    select
      email,
      password,
      tg_id,
      vk_id,
      user_group
    from examhelp.user;

create view TaskView
  as
    select
      description,
      status,
      price,
      posted_on,
      taken_on,
      closed_on,
      category,
      poster,
      solver
    from examhelp.task;

create view IssueView
  as
    select
      task,
      status,
      description
    from examhelp.issue;

create view ChatView
  as
    select
      solver,
      student
    from examhelp.chat;

create view MessageView
  as
    select
      chat,
      sender,
      text,
      method,
      task
    from examhelp.message;

create view MessageImageView
  as
    select
      photo_path,
      message
    from examhelp.message_image;

create view ReviewView
  as
    select
      rating,
      text,
      review_user,
      posted_on,
      posted_on
    from examhelp.review;

create view PaymentView
  as
    select
      amount,
      task,
      method,
      payed_on
    from examhelp.payment;


drop view if exists sums;

create view stats as
  select
    email,
    avg(price) as average_income,
    max(price) as max_income,
    min(price) as min_income
  from examhelp.task
    right join examhelp.user on user_id = solver and task.status = 'taken'
  group by user_id
  order by avg(price) desc;

select *
from stats;


create view favorite_categories as
  select
    email,
    category_title,
    count(category_id) as number
  from examhelp.category
    right join examhelp.task on task.category = category_id
    right join examhelp.user on user_id = solver and task.status = 'taken'
  where user_group = 'solver'
  group by user_id, category_id
  order by number desc;

select *
from favorite_categories;