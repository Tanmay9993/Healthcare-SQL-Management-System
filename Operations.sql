

-- Views
-- 1
CREATE VIEW PatientProcedureDetails AS
SELECT p.PatientID, p.FirstName as PatientName, pr.ProcedureName, ph.FirstName as PhysicianName, pp.ProcedureDate
FROM Patients p
JOIN ProcedureDetails pp ON p.PatientID = pp.PatientID
JOIN Procedures pr ON pp.ProcedureID = pr.ProcedureID
JOIN Physicians ph ON ph.PhysicianID = pp.PhysicianID;
GO

SELECT * FROM PatientProcedureDetails;
GO


-- 2
CREATE VIEW MedicinesByPhysicians AS
SELECT p.FirstName, m.MedicineID, m.MedicineName, pm.Dosage
FROM Physicians p
JOIN Medications pm ON p.PhysicianID = pm.PhysicianID
JOIN Medicines m ON pm.MedicineID = m.MedicineID;
GO

SELECT * FROM MedicinesByPhysicians;
GO


-- 3
CREATE VIEW FullCoverageForMales AS
SELECT p.PatientID, p.FirstName, i.Company, b.TotalBill,b.InsuranceCoverage, b.PaidByPatient
FROM Billings b
JOIN Patients p ON b.PatientID = p.PatientID
JOIN Insurances i ON b.InsuranceID = i.InsuranceID
WHERE p.Gender = 'M' and b.TotalBill = b.InsuranceCoverage;
GO

SELECT * FROM FullCoverageForMales;
GO


-- 4
CREATE VIEW NurseContactToPatient AS
SELECT n.NurseID, n.FirstName as NurseName, n.DepartmentName, p.FirstName as PatientName
FROM Nurses n
JOIN Notes nc ON n.NurseID = nc.NurseID
JOIN Patients p ON p.PatientID = nc.PatientID;
GO

SELECT * FROM NurseContactToPatient;
GO




-- Procedures
-- 1
CREATE PROCEDURE InsertPatientDetails
(
    @FirstName VARCHAR(20),@LastName VARCHAR(20),@DateOfBirth DATE,@Gender VARCHAR(1),
    @PNumber VARCHAR(15),@ENumber VARCHAR(15),@Email VARCHAR(30),
    @HouseNum VARCHAR(4),@Street VARCHAR(20),@City VARCHAR(20),@State VARCHAR(20),@ZipCode VARCHAR(6)
)
AS
BEGIN
    INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender)
    VALUES (@FirstName, @LastName, @DateOfBirth, @Gender)
    INSERT INTO PatientContact(PrimaryNumber, EmergencyNumber, Email)
    VALUES (@PNumber, @ENumber, @Email)
    INSERT INTO PatientAddress (HouseNumber, Street, City, State, ZipCode)
    VALUES (@HouseNum, @Street, @City, @State, @ZipCode)
END
GO

EXEC InsertPatientDetails
    @FirstName = 'John', @LastName = 'Jill', @DateOfBirth = '1990-12-12', @Gender = 'M',
    @PNumber = '773-456-7898', @ENumber = '985-654-3217', @Email = 'john.jill@example.com',
    @HouseNum = '993', @Street = 'Main Street', @City = 'New York', @State = 'NY', @ZipCode = '15645';
GO

SELECT TOP 1 * FROM Patients ORDER BY PatientID DESC 
SELECT TOP 1 * FROM PatientContact ORDER BY PatientID DESC;
SELECT TOP 1 * FROM PatientAddress ORDER BY PatientID DESC;
GO

-- 2
CREATE PROCEDURE UpdatePhysicianContact
(
    @PhysicianID INT,
    @PNumber VARCHAR(15),
    @ENumber VARCHAR(15),
    @Email VARCHAR(30)
)
AS
BEGIN
    UPDATE PhysicianContact
    SET PrimaryNumber = @PNumber,
        EmergencyNumber = @ENumber,
        Email = @Email
    WHERE PhysicianID = @PhysicianID
END
GO

EXEC UpdatePhysicianContact
    @PhysicianID = 4, @PNumber = '918-087-0222', @ENumber = '936-456-7899', @Email = 'sophia.anderson.new@example.com';
GO

SELECT * FROM PhysicianContact;
GO

-- 3
CREATE PROCEDURE DeleteSpeciality
(
    @SpecialityID INT
)
AS
BEGIN
    DELETE FROM Specialities
    WHERE SpecialityID = @SpecialityID
END
GO

EXEC DeleteSpeciality
    @SpecialityID = 8;

SELECT * FROM Specialities;
GO

-- 4
CREATE PROCEDURE GetMedicineGivenDetails
(
    @MedicineID INT
)
AS
BEGIN
    SELECT m.MedicineID, m.MedicineName, me.Dosage, me.Frequency
    FROM Medicines m
    JOIN Medications me ON m.MedicineID = me.MedicineID
    WHERE m.MedicineID = @MedicineID
END
GO

EXEC GetMedicineGivenDetails
    @MedicineID = 5;

EXEC GetMedicineGivenDetails
    @MedicineID = 2;
GO


-- Functions
-- 1
CREATE FUNCTION GetTotalFemalePatients()
RETURNS INT
AS
BEGIN
    DECLARE @TotalPatients INT;
    SELECT @TotalPatients = COUNT(*) FROM Patients WHERE Gender = 'F';
    RETURN @TotalPatients;
END
GO

SELECT dbo.GetTotalFemalePatients() AS TotalFemalePatients;
GO


-- 2
CREATE FUNCTION GetMedicineDosage(@MedicineID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Dosage VARCHAR(50);
    SELECT @Dosage = Dosage FROM Medications WHERE MedicineID = @MedicineID;
    RETURN @Dosage;
END
GO

SELECT dbo.GetMedicineDosage(4) AS MedicineDosage;
GO


-- 3
CREATE FUNCTION GetPatientAge(@PatientID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SELECT @Age = DATEDIFF(YEAR, DateOfBirth, GETDATE()) FROM Patients WHERE PatientID = @PatientID;
    RETURN @Age;
END
GO

SELECT dbo.GetPatientAge(6) AS PatientAge;
GO


-- 4
CREATE FUNCTION GetPhysicianDetail(@PhysicianID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT CONCAT(p.FirstName, ' ', p.LastName) AS FullName, DOB, s.Speciality 
    FROM Physicians p
    JOIN PhysicianSpeciality ps ON ps.PhysicianID = p.PhysicianID
    JOIN Specialities s ON s.SpecialityID = ps.SpecialityID
    WHERE p.PhysicianID = @PhysicianID
);
GO

SELECT FullName, DOB, Speciality
FROM dbo.GetPhysicianDetail(3);
GO


-- Triggers
-- 1
CREATE TRIGGER PreventPhysicianDeletion
ON Physicians
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d INNER JOIN Appointments a ON d.PhysicianID = a.PhysicianID)
    BEGIN
        RAISERROR ('Cannot delete physicians with associated appointments', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM Physicians
        WHERE PhysicianID IN (SELECT PhysicianID FROM deleted)
    END
END

DELETE FROM Physicians WHERE PhysicianID = 5;
GO

-- 2
CREATE TRIGGER PreventRoomDeletion
ON Rooms
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d INNER JOIN Admissions a ON d.RoomID = a.RoomID)
    BEGIN
        RAISERROR ('Cannot delete rooms with associated admissions', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM Rooms
        WHERE RoomID IN (SELECT RoomID FROM deleted)
    END
END

DELETE FROM Rooms WHERE RoomID = 10;
GO

-- 3
CREATE TRIGGER PreventNurseDeletion
ON Nurses
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d INNER JOIN Notes n ON d.NurseID = n.NurseID)
    BEGIN
        RAISERROR ('Cannot delete nurses with associated notes', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM Nurses
        WHERE NurseID IN (SELECT NurseID FROM deleted)
    END
END

DELETE FROM Nurses WHERE NurseID = 2;
GO

-- 4
CREATE TRIGGER PreventMedicineDeletion
ON Medicines
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d INNER JOIN Medications m ON d.MedicineID = m.MedicineID)
    BEGIN
        RAISERROR ('Cannot delete medicines with associated medications', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM Medicines
        WHERE MedicineID IN (SELECT MedicineID FROM deleted)
    END
END

DELETE FROM Medicines WHERE MedicineID = 10;


-- Transactions
-- 1

BEGIN TRANSACTION

SET IDENTITY_INSERT Patients OFF
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender)
VALUES ('Ron', 'Doe', '1991-11-01', 'M')

COMMIT TRANSACTION

SELECT * FROM Patients;
GO


-- 2

BEGIN TRANSACTION

DECLARE @NurseID INT

SELECT @NurseID = NurseID FROM Nurses WHERE FirstName = 'Sophia'

DELETE FROM NurseContact WHERE NurseID = @NurseID
DELETE FROM Nurses WHERE NurseID = @NurseID

COMMIT TRANSACTION

SELECT * FROM Nurses;
SELECT * FROM NurseContact;


-- 3

BEGIN TRANSACTION
DECLARE @PhysicianID INT
SELECT @PhysicianID = PhysicianID FROM Physicians WHERE FirstName = 'John' AND LastName = 'Smith'
UPDATE PhysicianContact
SET PrimaryNumber = '315-287-9900', EmergencyNumber = '912-456-0087', Email = 'john.smith.new@example.com'
WHERE PhysicianID = @PhysicianID
COMMIT TRANSACTION

SELECT * FROM PhysicianContact;


-- 4
BEGIN TRANSACTION
DECLARE @NewMedicineName VARCHAR(30)
SET @NewMedicineName = 'NewLosartan' 
UPDATE Medicines
SET MedicineName = @NewMedicineName
WHERE MedicineName = 'Losartan';
COMMIT TRANSACTION

SELECT * FROM Medicines;


-- Scripts
-- 1
CREATE LOGIN ReadOnlyUser WITH PASSWORD = 'ReadOnlyPassword450';
CREATE USER ReadOnlyUser FOR LOGIN ReadOnlyUser;

EXEC sp_addrolemember 'db_datareader', 'ReadOnlyUser';


-- 2
CREATE LOGIN ReadWriteUser WITH PASSWORD = 'ReadWritePassword972';
CREATE USER ReadWriteUser FOR LOGIN ReadWriteUser;

EXEC sp_addrolemember 'db_datawriter', 'ReadWriteUser';


-- 3
CREATE LOGIN AdminUser WITH PASSWORD = 'AdminPassword123';
CREATE USER AdminUser FOR LOGIN AdminUser;

EXEC sp_addrolemember 'db_owner', 'AdminUser';


-- 4
CREATE LOGIN AccessAdminUser WITH PASSWORD = 'AccessAdminPassword369';
CREATE USER AccessAdminUser FOR LOGIN AccessAdminUser;

EXEC sp_addrolemember 'db_accessadmin', 'AccessAdminUser';



-- Visualization
-- Count of medicines prescribed
SELECT m.MedicineName, COUNT(*) AS NumberOfTimesPrescribed
FROM Medications AS md
JOIN Medicines AS m ON md.MedicineID = m.MedicineID
GROUP BY m.MedicineName
ORDER BY NumberOfTimesPrescribed DESC;


-- Contribution of manufacturers in medicine
SELECT m.Manufacturer, COUNT(*) AS Contributon
FROM Medications AS md
JOIN Medicines AS m ON md.MedicineID = m.MedicineID
GROUP BY m.Manufacturer
ORDER BY Contributon DESC;


-- Money convered by insurance companies
SELECT i.Company, SUM(b.InsuranceCoverage) AS TotalCoverage
FROM Billings AS b
JOIN Insurances as i ON i.InsuranceID = b.InsuranceID
GROUP BY i.Company
ORDER BY SUM(b.InsuranceCoverage) DESC;


-- Count of Gender
SELECT Gender, COUNT(Gender) AS GenderCount, AVG(DATEDIFF(YEAR, DateOfBirth, GETDATE())) AS AverageAge
FROM Patients
GROUP BY Gender;

