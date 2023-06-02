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

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_id INT REFERENCES items(id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INTEGER REFERENCES genres(id),
    label_id INTEGER REFERENCES labels(id),
    author_id INTEGER REFERENCES authors(id),
    source_id INTEGER REFERENCES sources(id),
    archived BOOLEAN,
    multiplayer VARCHAR(5),
    last_played_at DATE,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);