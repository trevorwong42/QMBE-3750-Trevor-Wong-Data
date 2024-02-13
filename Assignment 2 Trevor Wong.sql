USE BITS;

#BITS 1
SELECT ClientNum, ClientName
FROM Client;

#BITS 2
SELECT *
FROM Tasks;

USE colonial;

#colonial 3
SELECT TripName
FROM Trip
WHERE Type = 'Hiking' AND Distance > 6;

#colonial 4
SELECT TripName
FROM Trip
WHERE Type = 'Paddling' OR State = 'VT';

USE sports;

#sports 3
SELECT LastName, FirstName
FROM therapist
WHERE city = 'Palm Rivers';

#sports 4
SELECT LastName, FirstName
FROM therapist
WHERE city != 'Palm Rivers';

#sports 5
SELECT PatientNum, FirstName, LastName
FROM patient
WHERE balance >= 3000;

#sports 11
SELECT PatientNum, LastName
FROM patient
WHERE city IN ('Palm Rivers', 'WaterVille', 'Munster');

#sports 21
SELECT PatientNum, LastName
FROM patient
WHERE city = 'Palm Rivers' OR city = 'WaterVille' OR city = 'Munster';

#sport 22
SELECT TherapyCode
FROM therapies
WHERE description LIKE '%training%';

#Good job Trevor, this is good. 