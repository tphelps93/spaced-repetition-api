BEGIN;

TRUNCATE "word",
"language",
"user";

INSERT INTO
  "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'tphelps93',
    'Taylor Phelps',
    -- password = "Riftpass321!"
    '$2a$12$zt2GKNBErCBAojcp8Lb4Pe7vwhSdHFG7FUQHxLFdN/uE/LXQpaXfC'
  );

INSERT INTO
  "language" ("id", "name", "user_id")
VALUES
  (1, 'German', 1);

INSERT INTO
  "word" (
    "id",
    "language_id",
    "original",
    "translation",
    "next"
  )
VALUES
  (1, 1, 'trainieren', 'practice', 2),
  (2, 1, 'hallo', 'hello', 3),
  (3, 1, 'haus', 'house', 4),
  (4, 1, 'Entwickler', 'developer', 5),
  (5, 1, 'Ubersetzen', 'translate', 6),
  (6, 1, 'tolle', 'amazing', 7),
  (7, 1, 'hund', 'dog', 8),
  (8, 1, 'katze', 'cat', null);

UPDATE
  "language"
SET
  head = 1
WHERE
  id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT
  setval(
    'word_id_seq',
    (
      SELECT
        MAX(id)
      from
        "word"
    )
  );

SELECT
  setval(
    'language_id_seq',
    (
      SELECT
        MAX(id)
      from
        "language"
    )
  );

SELECT
  setval(
    'user_id_seq',
    (
      SELECT
        MAX(id)
      from
        "user"
    )
  );

COMMIT;