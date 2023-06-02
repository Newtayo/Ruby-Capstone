CREATE TABLE books (
   id SERIAL PRIMARY KEY,
  publisher VARCHAR(255),
  cover_state VARCHAR,
  label_id INT NULL REFERENCES label(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);