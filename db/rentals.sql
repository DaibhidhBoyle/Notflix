DROP TABLE rentals;
DROP TABLE movies;
DROP TABLE customers;

CREATE TABLE users (
  id SERIAL 8 primary key,
  user_name VARCHAR(255),
  wallet INT 4,
);

CREATE TABLE content (
  id SERIAL 8 primary key,
  title VARCHAR(255),
  type VARCHAR(255),
  cost INT 4,
);

CREATE TABLE rentals (
  id SERIAL 8 primary key,
  user_id INT 8 REFERENCES customers(id) ON DELETE CASCADE,
  content_id INT 8 REFERENCES content(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
)
