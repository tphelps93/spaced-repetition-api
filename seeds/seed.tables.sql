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
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
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
  (1, 1, 'trainieren', 'practice', null),
  (2, 1, 'hallo', 'hello', null),
  (3, 1, 'maison', 'haus', null),
  (4, 1, 'Entwickler', 'developer', null),
  (5, 1, 'Übersetzen', 'translate', null),
  (6, 1, 'tolle', 'amazing', null),
  (7, 1, 'hund', 'dog', null),
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