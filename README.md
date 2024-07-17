# Hospital Database System Project
This is a MySQL-based hospital management database featuring an EER diagram that models relationships among patients, physicians, and rooms. The system supports complex SQL queries, automated triggers, and transactional support, ensuring efficient operations and robust data management in healthcare settings.

## Project Files Overview

### Schema Documentation for Hospital Management Database
Provides an overview of tables and relationships in the hospital management database, explaining the structure and key associations.

### Hospital Project Entity-Relationship Diagram
Includes an Entity-Relationship Diagram illustrating the connections between entities such as patients, physicians, and rooms.

### Sample SQL Commands folder
Contains example SQL files for routine database operations and advanced queries for the hospital database system.

### hospital-data
This file contains a series of SQL insert statements to populate the hospital management system database. It also includes an update statement that modifies specific room numbers. Here's what each section accomplishes:

- **Physicians:** Adds details for five physicians, specifying their ID, name, contact information, specialty, and certification number.
- **Instructions:** Inserts details for common medical procedures, including their codes, descriptions, and fees.
- **Nurses:** Lists five nurses with their respective IDs, addresses, names, contact numbers, and certification numbers.
- **Rooms:** Provides details on hospital room numbers, their capacities, and associated fees, along with an update statement adjusting a room number.
- **Patients:** Records information for five patients, including their ID, name, contact details, assigned nurse, prescribed medication, room assignment, and stay duration.
- **Health Records:** Inserts medical history for each patient, detailing conditions treated, recovery status, and treatment descriptions.
- **Invoices:** Creates billing records linked to each patient for medical procedures and room services.
- **Payments:** Details payments made by patients, including payment ID, amount, and date.
- **Invoice Payments:** Links invoices and payments for financial tracking.
- **Monitored:** Records which physicians monitored specific patients and for how long.
- **Orders:** Documents medical orders given to patients by their physicians, specifying the order date and associated instruction codes.
- **Executed:** Tracks which nurse executed specific medical instructions on particular dates.

### hospital-queries
This file contains a collection of SQL queries demonstrating different functionalities, including:

- **Aggregation Queries:** Calculate averages, counts, and sums to provide insights into fees, patient counts by nurse, and revenue by physician.
- **Join Queries:** Combine data from multiple tables to show comprehensive views of patient details, payments, and invoice information.
- **Nested Queries:** Utilize subqueries to filter data based on specific conditions like physician engagements and nurse certifications.
- **Transaction Queries:** Show examples of transactional SQL statements that update multiple records atomically to maintain database integrity.
- **Trigger Queries:** Define SQL triggers to automatically update room capacities and patient statuses upon certain database actions.
- **View Queries:** Illustrate the creation of SQL views that simplify repeated queries and provide easy access to commonly required data.
- **General Queries:** Various queries to retrieve and analyze specific data points across the database.

### hospital-schema
This file outlines the SQL commands for creating the hospital database and its tables, including:

- **Database and Table Creation:** Commands to drop existing database, create a new database, and define all necessary tables such as `PHYSICIANS`, `NURSES`, `ROOMS`, `PATIENTS`, `HEALTH_RECORDS`, `INVOICES`, `PAYMENTS`, `MONITORED`, `ORDERS`, `EXECUTED`, and relational constraints.
- **Foreign Key Constraints:** Each table creation command includes foreign key constraints to enforce data integrity and define relationships between tables.

## Getting Started
To get started with this project:
1. Load the `hospital-schema` file into your MySQL database to set up the schema.
2. Use the `hospital-data` file to populate the database with initial data.
3. Execute queries from the `hospital-queries` file to interact with the data and observe outputs.
