USE bits;
SELECT w.ordernum, w.orderdate, c.clientnum, c.clientname,
o.taskid,t.description, t.category, t.price
FROM workorders w, client c, tasks t, orderline o
WHERE c.clientnum = w.clientnum
AND w.ordernum = o.ordernum
AND o.taskid = t.taskid
ORDER BY w.ordernum;


#CTE common table expression
SELECT *
FROM client;

    
    
    
    
    
    
WITH client_balances AS (
SELECT clientnum, AVG(balance) AS average_balance
FROM client c
GROUP BY clientnum)
SELECT w.clientnum, w.orderdate, c.average_balance
FROM workorders w
JOIN client_balances c
ON w.clientnum = c.clientnum;