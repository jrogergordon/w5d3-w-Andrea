PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body VARCHAR(255),
    users_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,
    body VARCHAR(255),
    replies_id INTEGER NOT NULL,

    FOREIGN KEY (replies_id) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);   


INSERT INTO
  users (fname, lname)
VALUES
    ('John', 'Mike');


INSERT INTO
    questions (title, body, users_id)    
VALUES
    ('Questions', 'Do you have a question?', 1);

INSERT INTO
    question_follows (users_id, questions_id)
VALUES
    (1, 1);

INSERT INTO 
    replies (questions_id, users_id, body, replies_id)
VALUES
    (1, 1, 'hello', 1);


INSERT INTO
    question_likes(users_id, questions_id) 
VALUES
    (1, 1);

