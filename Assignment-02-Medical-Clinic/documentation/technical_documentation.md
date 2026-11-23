TECHNICAL DOCUMENTATION

Project: Medical Clinic Database

1. Project Overview

The Medical Clinic Database is a relational database designed to manage the daily operations of a medical clinic.

The system stores information about doctors, patients, medical offices, appointments, diagnoses, medical tests, and prescriptions.

The main purpose of this project is to organize medical information and establish relationships between different entities using MySQL.

2. Project Objectives

The main objectives of the database are:

Store information about doctors and their specializations.
Store patient personal information.
Manage medical clinic offices and their locations.
Allow doctors to work in multiple offices.
Schedule and manage patient appointments.
Store doctor and patient phone numbers.
Record patient diagnoses.
Manage medical tests.
Store prescription information.
Maintain relationships between all database tables.

3. Functional Requirements

The system must allow clinic staff to:

Add, update, and view doctor information.
Register and manage patients.
Add and manage clinic offices.
Assign doctors to multiple offices.
Schedule patient appointments with doctors.
View appointment dates and statuses.
Store and manage doctor phone numbers.
Store and manage patient phone numbers.
Record patient diagnoses.
Schedule medical tests.
Create and manage prescriptions.
4. Non-Functional Requirements
The database must use MySQL.
Each main entity must have a Primary Key.
Foreign Keys must maintain relationships between tables.
Unique constraints must prevent duplicate values where required.
Referential integrity must be maintained.
The database must support multiple doctors and patients.
The database structure should be easy to maintain and extend.

5. Database Tables Description

The database contains 10 tables.

5.1. Offices

Stores information about medical clinic offices.

Columns:

id (BIGINT, Primary Key, Auto Increment)
state (VARCHAR(100))
city (VARCHAR(100))
address (VARCHAR(100))
phone (BIGINT)

5.2. Doctors

Stores information about doctors working in the clinic.

Columns:

id (BIGINT, Primary Key, Auto Increment)
first_name (VARCHAR(100), NOT NULL)
last_name (VARCHAR(100), NOT NULL)
address (VARCHAR(100))
specialization (VARCHAR(100))

5.3. Patients

Stores personal information about registered patients.

Columns:

id (BIGINT, Primary Key, Auto Increment)
first_name (VARCHAR(100), NOT NULL)
last_name (VARCHAR(100), NOT NULL)
address (VARCHAR(100))
date_of_birth (DATE)
health_record_number (BIGINT, UNIQUE)

5.4. Doctor_offices

Connects doctors and medical offices through a Many-to-Many relationship.

Columns:

doctor_id (BIGINT, Primary Key, Foreign Key)
office_id (BIGINT, Primary Key, Foreign Key)

The combination of doctor_id and office_id forms a composite Primary Key.

5.5. Appointments

Stores information about patient appointments.

Columns:

id (BIGINT, Primary Key, Auto Increment)
patient_id (BIGINT, Foreign Key)
doctor_id (BIGINT, Foreign Key)
office_id (BIGINT, Foreign Key)
appointment_datetime (DATETIME, NOT NULL)
status (VARCHAR(100))

5.6. Doctor_phones

Stores phone numbers belonging to doctors.

Columns:

id (BIGINT, Primary Key, Auto Increment)
doctor_id (BIGINT, Foreign Key)
phone_number (BIGINT, NOT NULL)

The combination of doctor_id and phone_number must be unique.

5.7. Patient_phones

Stores phone numbers belonging to patients.

Columns:

id (BIGINT, Primary Key, Auto Increment)
patient_id (BIGINT, Foreign Key)
phone_number (BIGINT, NOT NULL)

The combination of patient_id and phone_number must be unique.

5.8. Diagnoses

Stores patient diagnosis information.

Columns:

id (BIGINT, Primary Key, Auto Increment)
patient_id (BIGINT, Foreign Key)
doctor_id (BIGINT, Foreign Key)
diagnosis_name (VARCHAR(100), NOT NULL)
diagnosed_at (DATETIME, NOT NULL)

5.9. Medical_tests

Stores information about medical tests scheduled for patients.

Columns:

id (BIGINT, Primary Key, Auto Increment)
patient_id (BIGINT, Foreign Key)
doctor_id (BIGINT, Foreign Key)
test_type (VARCHAR(100), NOT NULL)
scheduled_at (DATETIME, NOT NULL)
status (VARCHAR(100))

5.10. Prescriptions

Stores information about medications prescribed to patients.

Columns:

id (BIGINT, Primary Key, Auto Increment)
patient_id (BIGINT, Foreign Key)
doctor_id (BIGINT, Foreign Key)
medication_name (VARCHAR(100), NOT NULL)
dosage (VARCHAR(100))
prescribed_at (DATETIME, NOT NULL)
status (VARCHAR(100))

6. Database Relationships

The database contains the following relationships:

Doctors → Doctor_offices: One-to-Many (1:N).
Offices → Doctor_offices: One-to-Many (1:N).
Doctors ↔ Offices: Many-to-Many (M:N), implemented through Doctor_offices.
Patients → Appointments: One-to-Many (1:N).
Doctors → Appointments: One-to-Many (1:N).
Offices → Appointments: One-to-Many (1:N).
Doctors → Doctor_phones: One-to-Many (1:N).
Patients → Patient_phones: One-to-Many (1:N).
Patients → Diagnoses: One-to-Many (1:N).
Doctors → Diagnoses: One-to-Many (1:N).
Patients → Medical_tests: One-to-Many (1:N).
Doctors → Medical_tests: One-to-Many (1:N).
Patients → Prescriptions: One-to-Many (1:N).
Doctors → Prescriptions: One-to-Many (1:N).

7. Primary Keys and Foreign Keys

Primary Keys uniquely identify records in each table.

Foreign Keys establish relationships between tables and maintain referential integrity.

Foreign Key references:

Doctor_offices.doctor_id → Doctors.id
Doctor_offices.office_id → Offices.id
Appointments.patient_id → Patients.id
Appointments.doctor_id → Doctors.id
Appointments.office_id → Offices.id
Doctor_phones.doctor_id → Doctors.id
Patient_phones.patient_id → Patients.id
Diagnoses.patient_id → Patients.id
Diagnoses.doctor_id → Doctors.id
Medical_tests.patient_id → Patients.id
Medical_tests.doctor_id → Doctors.id
Prescriptions.patient_id → Patients.id
Prescriptions.doctor_id → Doctors.id

8. Database Constraints

The database uses several constraints to maintain data consistency.

PRIMARY KEY

Every table has a unique identifier.
Doctor_offices uses a composite Primary Key consisting of doctor_id and office_id.

FOREIGN KEY

Connects related tables.
Prevents references to non-existing records.

UNIQUE

Patients.health_record_number must be unique.
Doctor_phones prevents duplicate phone numbers for the same doctor.
Patient_phones prevents duplicate phone numbers for the same patient.

NOT NULL

Required fields cannot contain NULL values.

ON DELETE and ON UPDATE

CASCADE: Changes or deletions in parent
