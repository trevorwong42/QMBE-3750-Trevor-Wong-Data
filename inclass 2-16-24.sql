use bits;

select*
FROM client;

SELECT *
FROM workorders;


select c1.clientname, c1.city, c2.clientname, c2.city
FROM client c1, client c2;

SELECT c1.clientname, c1.city, c2.clientname, c2.city
FROM client c1
JOIN client c2 ON c1. clientnum = c2. clientnum;

SELECT *
FROM bits.workorders JOIN bits_copy.client
ON bits.workorders.ClientNum = bits_copy.client.ClientNum;

SELECT *
FROM bits.workorders JOIN bits_copy.workorders
ON bits.workorders.ClientNum = bits_copy.workorders.ClientNum;

SELECT *
FROM bits.workorders a
join bits_copy.client b
on a.Clientnum = b.Clientnum;

SELECT *
from bits.workorders join bits_copy.workorders
using (clientnum);