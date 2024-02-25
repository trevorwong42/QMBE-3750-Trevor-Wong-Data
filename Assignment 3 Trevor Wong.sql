#Review: 7, 9, 10
#BITS: 8, 10, 12
#Colonial: 9, 10
#Sports: 8, 14

#BITS
USE bits;
#8
SELECT COUNT(*)
FROM client
WHERE CreditLimit = 10000;

#10
SELECT clientname, CreditLimit - Balance
FROM Client;

#12
SELECT *
FROM tasks
ORDER BY category, price;

#Colonial
USE colonial;

#9
SELECT state, COUNT(*)
FROM trip
GROUP BY state;

#10
SELECT COUNT(*)
FROM reservation
Where TripID IN (
SELECT TripID
FROM Trip
WHERE Tripprice > 20 and Tripprice < 75
);

#sports
USE sports;
#8
SELECT TherapyCode, Description
FROM Therapies
WHERE UnitOfTime = 15
ORDER BY Description;

#14
SELECT AVG(LengthOfSession)
From Session
WHERE MONTH(SessionDate) = 10;