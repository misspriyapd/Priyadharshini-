CREATE DATABASE HospitalDB;
USE HospitalDB;



CREATE TABLE Patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10),
    contact VARCHAR(50)
);

CREATE TABLE Doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    specialization VARCHAR(50) NOT NULL
);

CREATE TABLE Appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);


INSERT INTO Patients (name, age, gender, contact) VALUES
('John Doe', 30, 'Male', 'john@example.com'),
('Jane Smith', 25, 'Female', 'jane@example.com'),
('Robert Brown', 40, 'Male', 'robert@example.com');

INSERT INTO Doctors (name, specialization) VALUES
('Dr. Alice Green', 'Cardiology'),
('Dr. Mark Wilson', 'Neurology'),
('Dr. Susan White', 'Pediatrics');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-03-01', 'Scheduled'),
(2, 2, '2025-03-02', 'Completed'),
(3, 3, '2025-03-03', 'Cancelled'),
(1, 3, '2025-03-04', 'Scheduled');


-- List all patients
SELECT * FROM Patients;

-- List all doctors
SELECT * FROM Doctors;

-- Show appointments with patient and doctor names
SELECT Appointments.id, Patients.name AS patient_name, Doctors.name AS doctor_name, 
       Appointments.appointment_date, Appointments.status
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
JOIN Doctors ON Appointments.doctor_id = Doctors.id;

-- Count appointments per doctor
SELECT Doctors.name AS doctor_name, COUNT(Appointments.id) AS appointment_count
FROM Appointments
JOIN Doctors ON Appointments.doctor_id = Doctors.id
GROUP BY Doctors.name;

