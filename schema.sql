-- Active: 1780283379047@@127.0.0.1@3306
-- Create the database container 
-- Drop the database if it already exists to start completely fresh
DROP DATABASE IF EXISTS unifil_bus_lines;

-- Create the database container
CREATE DATABASE unifil_bus_lines;

-- Tell MySQL to use this database for the next commands
USE unifil_bus_lines;

-- Table to store physical bus vehicles properties
CREATE TABLE buses (
    id_bus INT AUTO_INCREMENT,
    license_plate VARCHAR(10) NOT NULL,
    color VARCHAR(20),
    total_capacity INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    PRIMARY KEY (id_bus),
    CONSTRAINT uk_license_plate UNIQUE (license_plate)
);

-- Table to manage physical seats for each bus
CREATE TABLE seats (
    id_seat INT AUTO_INCREMENT,
    id_bus INT NOT NULL,
    seat_number INT NOT NULL,
    PRIMARY KEY (id_seat),
    CONSTRAINT fk_seats_buses FOREIGN KEY (id_bus) REFERENCES buses(id_bus)
);

-- Table to manage trips, schedules, and destinations
CREATE TABLE trips (
    id_trip INT AUTO_INCREMENT,
    id_bus INT NOT NULL,
    origin_city VARCHAR(50) NOT NULL,
    destination_city VARCHAR(50) NOT NULL,
    departure_time DATETIME NOT NULL,
    price DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (id_trip),
    CONSTRAINT fk_trips_buses FOREIGN KEY (id_bus) REFERENCES buses(id_bus)
);

-- Table to store client information
CREATE TABLE clients (
    id_client INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    PRIMARY KEY (id_client),
    CONSTRAINT uk_client_cpf UNIQUE (CPF)
);

-- Table to manage tickets sales and prevent double-booking
CREATE TABLE tickets (
    id_ticket INT AUTO_INCREMENT,
    id_trip INT NOT NULL,
    id_seat INT NOT NULL,
    id_client INT NOT NULL,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR (20) DEFAULT 'Confirmed',
    PRIMARY KEY (id_ticket),
    CONSTRAINT fk_tickets_trips FOREIGN KEY (id_trip) REFERENCES trips(id_trip),
    CONSTRAINT fk_tickets_seats FOREIGN KEY (id_seat) REFERENCES seats(id_seat),
    CONSTRAINT uk_trip_seat UNIQUE (id_trip, id_seat)
);