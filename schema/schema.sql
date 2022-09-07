CREATE DATABASE catalog_db;

\c catalog_db;

CREATE TABLE authors (
    id  INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE genres (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);


CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE sources (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    source_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES genres (id),
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES authors (id),
    CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES labels (id),
    CONSTRAINT source_fk FOREIGN KEY (source_id) REFERENCES sources (id)
);

CREATE TABLE movies (
    id INT,
    name VARCHAR(100),
    silent BOOLEAN,
    CONSTRAINT item_fk FOREIGN KEY (id) REFERENCES items (id)
);

CREATE TABLE  music_albums(
  id INT,
  publish_date DATE,
  on_spotify BOOLEAN,
  CONSTRAINT item_fk FOREIGN KEY (id) REFERENCES items (id)
);
