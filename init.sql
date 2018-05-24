CREATE SCHEMA examhelp;

CREATE TABLE examhelp.category (
  category_id SERIAL PRIMARY KEY,
  category_title VARCHAR(50) NOT NULL,
  description TEXT,
  min_price FLOAT CHECK (min_price > 0.0),
  max_price FLOAT CHECK (min_price > 0.0),
  parent_category INT REFERENCES examhelp.category
);

CREATE TABLE examhelp.user (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(128) NOT NULL,
  tg_id varchar(20),
  vk_id varchar(20),
  user_group VARCHAR(20) NOT NULL
);


CREATE TABLE examhelp.task (
  task_id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  status VARCHAR(20) NOT NULL,
  price FLOAT CHECK (price > 0.0),
  posted_on TIMESTAMP NOT NULL,
  taken_on TIMESTAMP,
  closed_on TIMESTAMP,
  category INT REFERENCES examhelp.category ON DELETE CASCADE,
  poster INT REFERENCES examhelp.user,
  solver INT REFERENCES examhelp.user
);

ALTER TABLE examhelp.user
    ADD current_task INT REFERENCES examhelp.task;

CREATE TABLE examhelp.issue (
  issue_id SERIAL PRIMARY KEY,
  task INT REFERENCES examhelp.task NOT NULL,
  status VARCHAR(30) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE examhelp.chat (
  chat_id SERIAL PRIMARY KEY,
  solver INT REFERENCES examhelp.user,
  student INT REFERENCES examhelp.user
);


CREATE TABLE examhelp.message (
  message_id SERIAL PRIMARY KEY,
  chat INT REFERENCES examhelp.chat,
  sender INT REFERENCES examhelp.user,
  text TEXT,
  METHOD varchar(20),
  task INT REFERENCES examhelp.task,
  sent_on TIMESTAMP
);

CREATE TABLE examhelp.message_image (
  message_image_id SERIAL PRIMARY KEY,
  photo_path VARCHAR(30) NOT NULL,
  message INT REFERENCES examhelp.message NOT NULL
);

CREATE TABLE examhelp.review (
  review_id SERIAL PRIMARY KEY,
  rating FLOAT,
  text TEXT,
  review_user INT REFERENCES examhelp.user NOT NULL,
  posted_on TIMESTAMP NOT NULL,
  task INT REFERENCES examhelp.task NOT NULL
);

CREATE TABLE examhelp.payment (
  payment_id SERIAL PRIMARY KEY,
  amount FLOAT NOT NULL,
  task INT REFERENCES examhelp.task,
  method VARCHAR(20),
  payed_on TIMESTAMP
);
