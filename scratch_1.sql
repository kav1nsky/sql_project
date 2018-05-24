CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  category_title VARCHAR(50) NOT NULL,
  description TEXT,
  min_price FLOAT CHECK (min_price > 0),
  max_price FLOAT CHECK (min_price > 0),
  parent_category INT REFERENCES examhelp.category
);