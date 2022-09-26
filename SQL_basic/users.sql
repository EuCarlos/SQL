-- sqlite
-- data_modeling/users
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
 	name VARCHAR,
  	email VARCHAR,
  	password VARCHAR,
  	avatar VARCHAR NULL,
  	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notes (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    user_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE tags (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    note_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (note_id) REFERENCES notes (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE links (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    note_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (note_id) REFERENCES notes (id) ON DELETE CASCADE
);

-- notes controller
-- -- add new user
INSERT INTO users (name, email, password) VALUES ('Carlos', 'contact@carlos.dev', 'admin123')

-- -- add new notes
INSERT INTO notes (description, title, user_id) VALUES ('Texto de preenchimento', 'titulo qualquer', 1);

SELECT * FROM notes
WHERE id = 1
LIMIT 1;

-- -- add new link
INSERT INTO links (note_id, url) VALUES ('1', 'https://carlosalves.now.sh/');

SELECT * FROM links
WHERE note_id = 1
ORDER BY created_at ASC;

-- -- add new tag
INSERT INTO tags (name, note_id, user_id) VALUES ('portfolio', '1', '1');

SELECT * FROM tags
WHERE note_id = 1
ORDER BY name ASC;

-- -- find notes
SELECT
  notes.id,
  notes.title,
  notes.user_id
FROM tags
INNER JOIN notes ON notes.id = tags.note_id
WHERE notes.user_id = 1
  AND notes.title LIKE '%titulo'
  AND name IN ('portfolio')
GROUP BY notes.id
ORDER BY notes.title ASC;

-- -- -- OR
SELECT * FROM notes
WHERE user_id = 1
  AND title LIKE '%titulo%'
ORDER BY title ASC;


-- tags controller
-- -- show tags user
SELECT * FROM tags
WHERE user_id = 1
GROUP BY name;
