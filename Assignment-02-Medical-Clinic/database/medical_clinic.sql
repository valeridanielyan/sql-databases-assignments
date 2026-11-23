
-- =========================================
-- PROJECT: Medical Clinic Database
-- DBMS: MySQL
-- =========================================

CREATE DATABASE IF NOT EXISTS medical_clinic_db;
USE medical_clinic_db;

-- 1. Offices
CREATE TABLE Offices (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    state VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(100),
    phone BIGINT
);

-- 2. Doctors
CREATE TABLE Doctors (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    specialization VARCHAR(100)
);

-- 3. Patients
CREATE TABLE Patients (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    date_of_birth DATE,
    health_record_number BIGINT UNIQUE
);

-- 4. Doctor_offices
CREATE TABLE Doctor_offices (
    doctor_id BIGINT NOT NULL,
    office_id BIGINT NOT NULL,
    PRIMARY KEY (doctor_id, office_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (office_id)
        REFERENCES Offices(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. Appointments
CREATE TABLE Appointments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    office_id BIGINT NOT NULL,
    appointment_datetime DATETIME NOT NULL,
    status VARCHAR(100),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (office_id)
        REFERENCES Offices(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 6. Doctor_phones
CREATE TABLE Doctor_phones (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    doctor_id BIGINT NOT NULL,
    phone_number BIGINT NOT NULL,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (doctor_id, phone_number)
);

-- 7. Patient_phones
CREATE TABLE Patient_phones (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    phone_number BIGINT NOT NULL,
    FOREIGN KEY (patient_id)
        REFERENCES Patients(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (patient_id, phone_number)
);

-- 8. Diagnoses
CREATE TABLE Diagnoses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    diagnosis_name VARCHAR(100) NOT NULL,
    diagnosed_at DATETIME NOT NULL,
    FOREIGN KEY (patient_id)
        REFERENCES Patients(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 9. Medical_tests
CREATE TABLE Medical_tests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    test_type VARCHAR(100) NOT NULL,
    scheduled_at DATETIME NOT NULL,
    status VARCHAR(100),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 10. Prescriptions
CREATE TABLE Prescriptions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(100),
    prescribed_at DATETIME NOT NULL,
    status VARCHAR(100),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
