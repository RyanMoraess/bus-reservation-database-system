USE unifil_bus_lines;

-- 1. Inserting initial Buses
INSERT INTO buses (license_plate, color, total_capacity, status) VALUES
('ABC-1234', 'White/Blue', 42, 'Active'),
('XYZ-5678', 'Green', 42, 'Active');

-- 2. Inserting physical Seats for the first bus (id_bus = 1)
INSERT INTO seats (id_bus, seat_number) VALUES
(1, 1),
(1, 2),
(1, 3);

-- 3. Inserting Clients
INSERT INTO clients (full_name, cpf, email, phone) VALUES
('Gustavo Morales', '123.456.789-00', 'gustavo@email.com', '(43) 99999-1111'),
('Mary Jane', '987.654.321-11', 'mary@email.com', '(43) 99999-2222');

-- 4. Creating a Trip / Schedule (Using bus 1)
INSERT INTO trips (id_bus, origin_city, destination_city, departure_time, price) VALUES
(1, 'Londrina', 'Curitiba', '2026-06-15 23:00:00', 149.90);

-- 5. Selling tickets (Booking seats)
INSERT INTO tickets (id_trip, id_seat, id_client, status) VALUES
(1, 1, 1, 'Confirmed'), -- Gustavo Morales takes Seat 1 on Trip 1
(1, 2, 2, 'Confirmed'); -- Mary Jane takes Seat 2 on Trip 1

-- TEST: Trying to book the exact same seat for a different client
USE unifil_bus_lines;
INSERT INTO tickets (id_trip, id_seat, id_client, status) VALUES
(1, 1, 2, 'Confirmed');