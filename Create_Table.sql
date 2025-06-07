

-- CREATE DATABASE MedicalCenter;
-- USE MedicalCenter;

-- Drop Database MedicalCenter;
----------------------------------------------------------------------------------------------------

-- Patient Tables
CREATE TABLE Patients
(
    PatientID INT NOT NULL IDENTITY(1,1),
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    PRIMARY KEY (PatientID)
);

CREATE TABLE PatientContact
(
    PatientID INT NOT NULL IDENTITY(1,1),
    PrimaryNumber VARCHAR(15) NOT NULL,
    EmergencyNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    PRIMARY KEY (PatientID)
);

CREATE TABLE PatientAddress
(
    PatientID INT NOT NULL IDENTITY(1,1),
    HouseNumber VARCHAR(4) NOT NULL,
    Street VARCHAR(20) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZipCode  VARCHAR(6) NOT NULL,
    PRIMARY KEY (PatientID)
);

CREATE TABLE Insurances
(
    InsuranceID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    Company VARCHAR(30) NOT NULL,
    CoverageType VARCHAR(20) NOT NULL,
    PRIMARY KEY (InsuranceID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Billings
(
    BillingID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    InsuranceID INT NOT NULL,
    TotalBill MONEY NOT NULL,
    InsuranceCoverage MONEY NOT NULL,
    PaidByPatient MONEY NOT NULL,
    PRIMARY KEY (BillingID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurances(InsuranceID)
);

----------------------------------------------------------------------------------------------------

-- Physician Tables
CREATE TABLE Physicians
(
    PhysicianID INT NOT NULL IDENTITY(1,1),
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    PRIMARY KEY (PhysicianID)
);

CREATE TABLE PhysicianContact
(
    PhysicianID INT NOT NULL IDENTITY(1,1),
    PrimaryNumber VARCHAR(15) NOT NULL,
    EmergencyNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    PRIMARY KEY (PhysicianID)
);

CREATE TABLE PhysicianLicense
(
    PhysicianID INT NOT NULL IDENTITY(1,1),
    LicenseNumber VARCHAR(7) NOT NULL,
    PRIMARY KEY (PhysicianID)
);

CREATE TABLE Specialities
(
    SpecialityID INT NOT NULL IDENTITY(1,1),
    Speciality VARCHAR(20) NOT NULL,
    PRIMARY KEY (SpecialityID)
);

CREATE TABLE PhysicianSpeciality
(
    PhysicianID INT NOT NULL IDENTITY(1,1),
    SpecialityID INT NOT NULL,
    PRIMARY KEY (PhysicianID),
    FOREIGN KEY (SpecialityID) REFERENCES Specialities(SpecialityID)
);

----------------------------------------------------------------------------------------------------

-- Nurses Tables
CREATE TABLE Nurses
(
    NurseID INT NOT NULL IDENTITY(1,1),
    DepartmentName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    HireDate DATE NOT NULL,
    DOB DATE NOT NULL,
    PRIMARY KEY (NurseID)
);

CREATE TABLE NurseContact
(
    NurseID INT NOT NULL IDENTITY(1,1),
    PrimaryNumber VARCHAR(15) NOT NULL,
    EmergencyNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    PRIMARY KEY (NurseID)
);

----------------------------------------------------------------------------------------------------

-- Activity Tables
CREATE TABLE Appointments
(
    AppointmentID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Reason VARCHAR(50) NOT NULL,
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID)
);

CREATE TABLE Rooms
(
    RoomID INT NOT NULL IDENTITY(1,1),
    RoomNumber INT NOT NULL,
    PRIMARY KEY (RoomID)
);

CREATE TABLE Admissions
(
    AdmissionID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    RoomID INT NOT NULL,
    AdmissionDate DATE NOT NULL,
    DischargeDate DATE ,
    Diagnosis VARCHAR(50) NOT NULL,
    PRIMARY KEY (AdmissionID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Procedures
(
    ProcedureID INT NOT NULL IDENTITY(1,1),
    ProcedureName VARCHAR(20) NOT NULL,
    PRIMARY KEY (ProcedureID)
);

CREATE TABLE ProcedureDetails
(
    DetailID INT NOT NULL IDENTITY(1,1),
    ProcedureID INT NOT NULL,
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    ProcedureDate DATE NOT NULL,
    ProcedureNotes VARCHAR(50) NOT NULL,
    PRIMARY KEY (DetailID),
    FOREIGN KEY (ProcedureID) REFERENCES Procedures(ProcedureID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID),
);

CREATE TABLE Medicines
(
    MedicineID INT NOT NULL IDENTITY(1,1),
    MedicineName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(30) NOT NULL,
    PRIMARY KEY (MedicineID)
);

CREATE TABLE Medications
(
    MedicationID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    MedicineID INT NOT NULL,
    Dosage VARCHAR(15) NOT NULL,
    Frequency VARCHAR(15) NOT NULL,
    PRIMARY KEY (MedicationID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE Notes
(
    NoteID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    NurseID INT NOT NULL,
    NoteDetails VARCHAR(50) NOT NULL,
    PRIMARY KEY (NoteID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID),
    FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID)
);

CREATE TABLE LabResults
(
    LabResultID INT NOT NULL IDENTITY(1,1),
    PatientID INT NOT NULL,
    PhysicianID INT NOT NULL,
    TestName VARCHAR(30) NOT NULL,
    TestDate DATE NOT NULL,
    TestResults VARCHAR(20) NOT NULL,
    PRIMARY KEY (LabResultID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID)
);

----------------------------------------------------------------------------------------------------

-- Linking Tables
CREATE TABLE PatientMedication
(
    PatientID INT NOT NULL,
    MedicineID INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

----------------------------------------------------------------------------------------------------
