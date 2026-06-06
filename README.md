# Bus Reservation Database System

Relational database design and implementation for an intercity bus reservation platform (Viação Unifil).

## Project Overview
This project consists of a relational database developed to manage the core operations of a intercity bus company. It handles fleets, physical seats, clients registration, trip scheduling, and ticket sales.

## Tech Stack & Environment
* **Language:** SQL (Structured Query Language)
* **RDBMS:** MySQL 8.0
* **Server Enviroment:** WampServer
* **IDE:** Visual Studio Code

## Database Architrcture (Schema)
The database structure is composed of 5 main entities integrated via Foreign Keys:
1. `buses`: Stores active vehicles and total capacities.
2. `seats`: Maps physical seats available per bus.
3. `clients`: Stores customer registration details (with unique CPF validation).
4. `trips`: Stores schedules, routes, and pricing.
5. `tickets`: Handles the reservation logic and ticket issuance.

### Core Business Rule: Double-Booking Prevention
Data integrity is strictly enforced at the persistence layer. A composite unique constraint (`uk_trip_seat`) prevents the same physical seat on a specific trip from being sold more than once, returning a controlled `Duplicate entry` error if violated.

## How to Run
1. Execute `schema.sql` to create the database structure.
2. Execute `insert.sql` to populate initial test data.
3. Execute `queries.sql` to run financial and operational reports.