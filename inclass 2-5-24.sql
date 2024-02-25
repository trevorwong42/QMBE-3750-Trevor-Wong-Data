USE bits_copy;

SHOW TABLES;

SELECT *
FROM tasks;

CREATE TABLE catergory_drm AS
SELECT *
FROM tasks
WHERE category = 'DRM';


ALTER TABLE catergory_drm
ADD COLUMN email VARCHAR(255);

SELECT *
FROM catergory_drm;


ALTER TABLE catergory_drm
MODIFY COLUMN email VARCHAR(320); -- SQL

ALTER TABLE catergory_drm
DROP COLUMN email;

CREATE TABLE task_number AS
SELECT taskid, COUNT(*) AS task_count
FROM tasks
GROUP BY taskid;

CREATE TABLE average_credit AS
SELECT state, AVG(CreditLimit) AS average
FROM client
GROUP BY state;

SELECT *
FROM average_credit;


UPDATE catergory_drm
SET email = 'new.email@example.com'
WHERE TaskID = 'DA11';

DELETE FROM catergory_drm
WHERE Task_ID = 'DA11';