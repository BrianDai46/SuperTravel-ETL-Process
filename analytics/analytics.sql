SELECT d.City, COUNT(dt.Destination_ID) AS TotalVisits
FROM Destinations d
JOIN Destination_Trips dt ON d.Destination_ID = dt.Destination_ID
GROUP BY d.City
ORDER BY TotalVisits DESC;


SELECT d.City, AVG(tr.Traveler_age) AS AverageAge, tr.Traveler_gender, tr.Traveler_nationality
FROM Travelers tr
JOIN Traveler_Trips tt ON tr.Traveler_ID = tt.Traveler_ID
JOIN Destination_Trips dt ON tt.Trip_ID = dt.Trip_ID
JOIN Destinations d ON dt.Destination_ID = d.Destination_ID
GROUP BY d.City, tr.Traveler_gender, tr.Traveler_nationality;


SELECT EXTRACT(MONTH FROM t.Start_date) AS Month, COUNT(*) AS TotalBookings
FROM Trips t
GROUP BY Month
ORDER BY TotalBookings DESC;


SELECT f.Airline, AVG(t.Cost) AS Average_Flight_Cost
FROM Flights f
JOIN Transportation_Trips tt ON f.Transportation_ID = tt.Transportation_ID
JOIN Transportations t ON tt.Transportation_ID = t.Transportation_ID
GROUP BY f.Airline;
