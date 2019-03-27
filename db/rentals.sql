DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL8 primary key,
  user_name VARCHAR(255) UNIQUE,
  wallet INT4
);

CREATE TABLE content (
  id SERIAL8 primary key,
  title VARCHAR(255),
  type VARCHAR(255),
  cost INT4
);

CREATE TABLE rentals (
  id SERIAL8 primary key,
  user_id INT8 REFERENCES users(id) ON DELETE CASCADE,
  content_id INT8 REFERENCES content(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE
);
