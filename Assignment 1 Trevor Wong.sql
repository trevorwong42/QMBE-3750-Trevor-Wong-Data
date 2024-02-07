USE bits;


#Chapter 1 BITS
#BITS 1
SELECT ClientName
FROM bits.client
where creditLimit < 10000;

#Hershey, Jarrod
#Salazar, Jason
#Fishermans Spot Shop
#clientSeymour, Lindsey
#Bonnies Beautiful Boutique
#Yates, Nick
#Howler, Laura
#Goduto, Sean
#MarketPoint Sales

#BITS 3
SELECT OrderNum
FROM bits.WorkOrders
WHERE ClientNum = '322' AND OrderDate = '2018-09-10';

#67424
#67949
#not sure why there is also a row that says null

#BITS 4
SELECT WorkOrders.OrderDate, OrderLine.ScheduledDate
FROM bits.WorkOrders
JOIN bits.OrderLine ON WorkOrders.OrderNum = OrderLine.OrderNum
WHERE OrderLine.TaskID = 'SA44';

#2018-09-14 | 2018-09-24

#BITS 7
SELECT SUM(bits.Client.Balance)
FROM bits.Client
JOIN bits.Consultant ON bits.Client.ConsltNum = bits.Consultant.ConsltNum
WHERE bits.Consultant.LastName = 'Turner' AND bits.Consultant.FirstName = 'Christopher';

#18746.05

#BITS 11
# a phone number column


USE COLONIAL;
#COLONIAL 4
SELECT TripName
FROM Trip
WHERE Season = 'Late Spring';


#COLONIAL 5
SELECT TripName
FROM Trip
WHERE State = 'VT' OR MaxGrpSize > 10;


#COLONIAL 9
SELECT Trip.TripName
FROM Trip
JOIN TripGuides ON Trip.TripID = TripGuides.TripID
JOIN Guide ON TripGuides.GuideNum = Guide.GuideNum
WHERE Trip.Type = 'Biking' AND Guide.LastName = 'Boyers' AND Guide.FirstName = 'Rita';

#COLONIAL 13
SELECT
    Customer.FirstName,
    Customer.LastName,
    Trip.TripName,
    Trip.Type
FROM
    Customer
JOIN Reservation ON Customer.CustomerNum = Reservation.CustomerNum
JOIN Trip ON Reservation.TripID = Trip.TripID
WHERE
    Customer.CustomerNum IN (
        SELECT CustomerNum
        FROM Reservation
        GROUP BY CustomerNum
        HAVING COUNT(*) > 1
    );
    #
    
    
USE sports;
#SPORTS 4
SELECT Therapies.Description
FROM Therapies, Session, Therapist
WHERE Therapies.TherapyCode = Session.TherapyCode
  AND Session.TherapistID = Therapist.TherapistID
  AND Therapist.LastName = 'Wilder'
  AND Therapist.FirstName = 'Steven';

#SPORTS 6
SELECT Therapist.LastName, Therapist.FirstName
FROM Therapist, Session, Patient
WHERE Therapist.TherapistID = Session.TherapistID
  AND Session.PatientNum = Patient.PatientNum
  AND Patient.LastName = 'Odepaul'
  AND Patient.FirstName = 'Ben';

#SPORTS 8
SELECT Therapies.Description
FROM Therapies, Session, Patient
WHERE Therapies.TherapyCode = Session.TherapyCode
  AND Session.PatientNum = Patient.PatientNum
  AND Patient.LastName = 'Baptist'
  AND Patient.FirstName = 'Joseph';
  
#SPORTS 10
# You should add it in the THERAPIST table, you may also consider adding total hours worked and total pay

#REVIEW 7
# A primary key is what makes each row unique in a table from other rows. 
#Customer: CustomerNum
#Guide: GuideNum
#Reservation: ReservationID
#Trip: TripID
#Tripuides: both TripID and GuideNum 


#Graded HW. Please merge pull request. 



