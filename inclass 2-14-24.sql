USE bits;
CREATE VIEW Hardware AS 
SELECT taskid, description, price
FROM tasks
WHERE category IN ('ACC','HAM','PRI','UPG');

SELECT *
FROM hardware;

CREATE or REPLACE VIEW hardware AS
SELECT taskid, description, price
FROM tasks
WHERE category IN ('ACC','HAM','PRI','UPG');

DESCRIBE TABLE Hardware;
DESCRIBE TABLE client;
