USE unifil_bus_lines;

-- 1. Passenger list for Trip 1
SELECT 
    t.id_trip AS 'Trip',
    s.seat_number AS 'Seat',
    c.full_name AS 'Passenger',
    c.cpf AS 'CPF',
    t.status AS 'Status'
FROM tickets t
JOIN clients c ON t.id_client = c.id_client
JOIN seats s ON t.id_seat = s.id_seat
WHERE t.id_trip = 1
ORDER BY s.seat_number;

-- 2. Total revenue per trip
SELECT
    tr.id_trip AS 'Trip Code',
    tr.origin_city AS 'Origin',
    tr.destination_city AS 'Destination',
    COUNT(tk.id_tickets) AS 'Tickets sold',
    SUM(tr.price) AS 'Total revenue (R$)'
FROM trips t
LEFT JOIN tickets tk ON tr.id_trip = tk.id_trip AND tk.status = 'Confirmed'
GROUP BY tr.id_trip;