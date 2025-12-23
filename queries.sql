

-- Query 1: Retrieve booking information with Customer name and Vehicle name
SELECT 
    b.booking_id, 
    u.name AS customer_name, 
    v.name AS vehicle_name, 
    b.start_date, 
    b.end_date, 
    b.status
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id;

-- Query 2: Find all vehicles that have never been booked
SELECT * 
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bookings b 
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: Retrieve all available vehicles of a specific type (e.g., 'car')
SELECT * 
FROM Vehicles
WHERE status = 'available' AND type = 'car';

-- Query 4: Total bookings per vehicle (displaying only those with more than 2 bookings)
SELECT 
    v.name AS vehicle_name, 
    COUNT(b.booking_id) AS total_bookings
FROM Bookings b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;