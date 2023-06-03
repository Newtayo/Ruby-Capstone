CREATE TABLE  music_albums (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  genre_id INTEGER REFERENCES genres(id),
  author TEXT,
  source TEXT,
  on_spotify BOOLEAN,
);


CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
