

-- Fixed Tables

INSERT INTO Rooms --
(RoomNumber)
VALUES
(101),(102),(103),(104),(105),
(201),(202),(203),(204),(205);

INSERT INTO Procedures --
(ProcedureName)
VALUES
('Surgery'),('Blood-Work'),('Stitching'),('Chemotherapy'),
('X-Ray'),('CT-Scan'),('MRI'),('C-Section');

INSERT INTO Medicines -- 
(MedicineName,Manufacturer)
VALUES
('Paracetamol',  'Johnson & Johnson'),
('Ibuprofen',    'Pfizer'),
('Aspirin',      'Johnson & Johnson'),
('Amoxicillin',  'Novartis'),
('Atorvastatin', 'Pfizer'),
('Metformin',    'AstraZeneca'),
('Omeprazole',   'AstraZeneca'),
('Simvastatin',  'Merck'),
('Levothyroxine','Pfizer'),
('Losartan',     'Merck');

INSERT INTO Specialities -- 
(Speciality)
VALUES
('Cardiology'),('Dermatology'),('Orthopedics'),
('Gastroenterology'),('Pediatrics'),('Neurology'),
('Ophthalmology'),('Oncology'),('Nephrology');


-- Patient Details

INSERT INTO Patients --
(FirstName, LastName, DateOfBirth, Gender)
VALUES
('Emma', 'Johnson', '1995-06-15', 'F'),
('Olivia', 'Smith', '1992-11-27', 'F'),
('Noah', 'Williams', '1990-09-08', 'M'),
('Liam', 'Brown', '1991-04-03', 'M'),
('Ava', 'Jones', '1976-02-21', 'F'),
('Sophia', 'Davis', '1974-08-12', 'F'),
('Mason', 'Miller', '1978-12-05', 'M'),
('Ethan', 'Taylor', '1973-07-30', 'M'),
('Isabella', 'Anderson', '1958-10-17', 'F'),
('Charlotte', 'Thomas', '1962-03-25', 'F');

INSERT INTO PatientContact --
(PrimaryNumber, EmergencyNumber, Email)
VALUES
('123-457-8900', '987-154-3210', 'emma.johnson@example.com'),
('231-567-1901', '826-543-2102', 'olivia.smith@example.com'),
('325-678-5012', '765-432-1598', 'noah.williams@example.com'),
('456-729-0143', '614-311-0987', 'liam.brown@example.com'),
('557-890-1034', '543-210-9806', 'ava.jones@example.com'),
('678-901-2355', '432-109-8565', 'sophia.davis@example.com'),
('779-012-3456', '371-098-7654', 'mason.miller@example.com'),
('890-163-4667', '260-987-6533', 'ethan.taylor@example.com'),
('901-234-1178', '229-876-5332', 'isabella.anderson@example.com'),
('212-345-6189', '898-765-4221', 'charlotte.thomas@example.com');

INSERT INTO PatientAddress --
(HouseNumber, Street, City, State, ZipCode)
VALUES
('123', 'Main Street', 'New York City', 'NY', '10001'),
('456', 'Maple Avenue', 'Buffalo', 'NY', '14201'),
('321', 'Elm Street', 'Rochester', 'NY', '14601'),
('987', 'Birch Avenue', 'Syracuse', 'NY', '13201'),
('543', 'Willow Lane', 'Albany', 'NY', '12201'),
('246', 'Oak Street', 'New York City', 'NY', '10002'),
('789', 'Cedar Avenue', 'Buffalo', 'NY', '14202'),
('654', 'Elm Court', 'Rochester', 'NY', '14602'),
('321', 'Birch Road', 'Syracuse', 'NY', '13202'),
('876', 'Willow Lane', 'Albany', 'NY', '12202');


-- Nurse Details

INSERT INTO Nurses --
(DepartmentName, FirstName, LastName, HireDate, DOB)
VALUES
('Surgical-Assistant', 'Emily', 'Johnson', '2022-01-15', '1990-05-12'),
('Emergency', 'Michael', 'Smith', '2021-08-02', '1988-11-23'),
('Labor-Delivery', 'Sophia', 'Anderson', '2022-03-10', '1992-07-08'),
('Clinical-Nurse', 'James', 'Brown', '2021-05-29', '1991-02-17'),
('Labor-Delivery', 'Olivia', 'Taylor', '2022-06-18', '1993-09-06'),
('Emergency', 'Jacob', 'Martinez', '2023-02-08', '1994-04-29'),
('Surgical-Assistant', 'Isabella', 'Davis', '2022-11-14', '1990-12-03');

INSERT INTO NurseContact 
(PrimaryNumber, EmergencyNumber, Email)
VALUES
('987-654-3770', '113-456-3890', 'emily.johnson@example.com'),
('836-543-2109', '234-597-8801', 'michael.smith@example.com'),
('735-432-1098', '305-678-9002', 'sophia.anderson@example.com'),
('654-351-0587', '456-739-0103', 'james.brown@example.com'),
('543-210-9676', '527-890-1214', 'olivia.taylor@example.com'),
('462-169-8765', '618-901-2245', 'jacob.martinez@example.com'),
('361-098-6654', '719-012-3156', 'isabella.davis@example.com');

INSERT INTO Insurances 
(PatientID, Company, CoverageType)
VALUES
(1,'Blue Cross Blue Shield',   'Full'),
(2,'UnitedHealth Group',       'Full'),
(3,'Blue Cross Blue Shield',   'Full'),
(4,'Cigna',                    'Partial'),
(5,'UnitedHealth Group',       'Partial'),
(6,'Aetna',                    'Full'),
(7,'Aetna',                    'Full'),
(8,'Aetna',                    'Full'),
(9,'Cigna',                    'Partial'),
(10,'Cigna',                   'Partial');


-- Physician Details

INSERT INTO Physicians --
(FirstName, LastName, DOB)
VALUES
('John', 'Smith', '1980-06-15'),
('Emily', 'Johnson', '1985-09-23'),
('Michael', 'Brown', '1976-11-30'),
('Sophia', 'Anderson', '1990-04-05'),
('David', 'Williams', '1982-02-18'),
('Olivia', 'Taylor', '1988-07-12');

INSERT INTO PhysicianContact --
(PrimaryNumber, EmergencyNumber, Email)
VALUES
('315-287-6543', '912-456-7890', 'john.smith@example.com'),
('233-187-0123', '345-654-3210', 'emily.johnson@example.com'),
('564-937-6541', '247-234-5678', 'michael.brown@example.com'),
('918-087-0123', '936-456-7890', 'sophia.anderson@example.com'),
('123-644-3210', '432-886-6541', 'david.williams@example.com'),
('907-664-5688', '180-487-6543', 'olivia.taylor@example.com');

INSERT INTO PhysicianLicense -- 
(LicenseNumber)
VALUES
(9876543), (4567890), (9870123),
(6543210), (9876541), (2345678);

INSERT INTO PhysicianSpeciality --
(SpecialityID)
VALUES
(2),(1),(6),(5),(3),(7);


-- Activity Tables

INSERT INTO Appointments --
(PatientID, PhysicianID, AppointmentDate, AppointmentTime, Reason)
VALUES
(2,  5, '2023-05-15', '10:00:00', 'Routine check-up'),
(4,  2, '2023-05-16', '14:30:00', 'Follow-up for medication'),
(6,  1, '2023-05-17', '09:15:00', 'Initial consultation'),
(8,  5, '2023-05-19', '15:00:00', 'Annual physical'),
(10, 5, '2023-05-21', '12:00:00', 'Orthopedic evaluation');

INSERT INTO Admissions --
(PatientID, PhysicianID, RoomID, AdmissionDate, DischargeDate, Diagnosis)
VALUES
(1, 6, 1, '2023-05-10', '2023-05-15', 'Cataract'),
(3, 2, 10, '2023-05-12', NULL, 'Heart Blockages'),
(5, 5, 2, '2023-05-15', '2023-05-17', 'Fractured Arm'),
(7, 3, 4, '2023-05-18', NULL, 'Epilepsy'),
(9, 2, 6, '2023-05-20', '2023-05-23', 'Arrhythmias');

INSERT INTO ProcedureDetails --
(ProcedureID, PatientID, PhysicianID, ProcedureDate, ProcedureNotes)
VALUES
(1, 1, 6, '2023-05-12', 'Remove cataract using laser'),
(6, 3, 2, '2023-05-13', 'CT-Scan to check details'),
(5, 5, 5, '2023-05-16', 'X-Ray to see the fracture'),
(7, 7, 3, '2023-05-19', 'MRI scan of the brain'),
(7, 9, 2, '2023-05-22', 'MRI scan of the hearth');

INSERT INTO Notes --
(PatientID, PhysicianID, NurseID, NoteDetails)
VALUES
(1, 6, 1, 'Eye recovery is good'),
(3, 2, 2, 'Heart condition getting better'),
(5, 5, 2, 'Vital signs are normal'),
(7, 3, 4, 'Medications are not showing improvement'),
(9, 2, 6, 'Performed diagnostic tests. Results pending');

INSERT INTO Medications --
(PatientID, PhysicianID, MedicineID, Dosage, Frequency)
VALUES
(1, 6, 3, '3 Tabs'  , '3x - 3 Days'),
(1, 6, 5, '2 Tabs'  , '1x - 4 Days'),
(2, 5, 2, '20 ml'   , '2x - 2 Days'),
(3, 2, 8, '1 Tab'   , '1x - 6 Days'),
(3, 2, 6, '30 ml'   , '2x - 3 Days'),
(4, 2, 1, '4 Tabs'  , '2x - 3 Days'),
(5, 5, 2, '20 ml'   , '3x - 3 Days'),
(6, 1, 7, '10 ml'   , '1x - 5 Days'),
(7, 3, 4, '2 Tabs'  , '3x - 5 Days'),
(7, 3, 9, '5 ml'    , '2x - 7 Days'),
(7, 3, 10,'3 Tabs'  , '1x - 7 Days'),
(8, 5, 2, '15 ml'   , '3x - 3 Days'),
(9, 2, 1, '2 Tabs'  , '2x - 4 Days'),
(10,5, 5, '4 Tabs'  , '1x - 5 Days');

INSERT INTO PatientMedication --
(PatientID, MedicineID)
VALUES
(1,3), (1,5), (2,2), (3,8), (3,6), (4,1), (5,2),
(6,7), (7,4), (7,9), (7,10), (8,2), (9,1), (10,5);

INSERT INTO LabResults --
(PatientID, PhysicianID, TestName, TestDate, TestResults)
VALUES
(1, 6, 'Complete Blood Count', '2023-05-11', 'Normal'),
(3, 2, 'Lipid Profile', '2023-05-12', 'Cholesterol normal'),
(5, 5, 'Glucose Test', '2023-05-15', 'Normal blood sugar'),
(7, 3, 'Thyroid Function Test', '2023-05-18', 'Thyroid normal'),
(9, 2, 'Liver Function Test', '2023-05-19', 'Liver enzyme normal'),
(4, 2, 'Urinalysis', '2023-05-15', 'No abnormalities'),
(6, 1, 'Electrolyte Panel', '2023-05-16', 'Electrolyte normal');

INSERT INTO Billings --
(PatientID, InsuranceID, TotalBill, InsuranceCoverage, PaidByPatient)
VALUES
(1,  1, 500, 500, 0),
(2,  2, 1000, 1000, 0),
(3,  3, 750, 750, 0),
(4,  4, 1200, 1000, 200),
(5,  5, 900, 700, 200),
(6,  6, 650, 650, 0),
(7,  7, 800, 800, 0),
(8,  8, 1100, 1100, 0),
(9,  9, 950, 550, 400),
(10,10, 700, 500, 200);






SELECT * FROM PatientMedication;
