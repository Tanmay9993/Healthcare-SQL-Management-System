# 🏥 Medical Center – SQL-Based Healthcare Management System

A comprehensive SQL database project designed to manage a wide range of medical operations for a healthcare institute. This project demonstrates the practical application of **T-SQL** in building a secure, structured, and efficient Healthcare Management System that supports clinical workflows, billing, and administrative decision-making.

---

## 📌 Project Overview

This project simulates the backend of a medical institute's operational system using **T-SQL**. It includes entities for patients, physicians, nurses, appointments, procedures, prescriptions, lab results, and billing.

🧠 **Core Objectives**:
- Organize and maintain accurate medical records
- Automate critical operations like scheduling, medication tracking, and billing
- Enforce business rules to ensure data integrity
- Enhance decision-making with calculated insights (e.g., age, patient stats)

---

## 🗂️ Database Components

### 📋 Tables

The schema includes tables for:
- **Patients, Physicians, Nurses**
- **Appointments, Admissions, Procedures**
- **Medications, Lab Results, Billing**
- **Notes, Rooms, Insurance, Specialties**

Each table was normalized to reduce redundancy and maintain consistency.

### 📐 ER Diagram

<img width="1179" alt="ERD" src="https://github.com/user-attachments/assets/9ac73c92-403a-463d-afc7-be2034306a4b" />


---

## ⚙️ Key SQL Features Implemented

### 🔁 Triggers
- Prevent deletion of physicians with scheduled appointments or rooms with active admissions.
- Enforce business logic like cascading updates and data validation.
- ✅ Ensures **automatic integrity checks** without manual intervention.

### 🛠️ Stored Procedures
- Insert complete patient profiles across multiple tables with a single call.
- Update physician contacts and delete entities following validation.
- ✅ Encapsulate **business logic** to ensure reusable and consistent operations.

### 🧮 Functions
- Calculate **current patient age** using DOB.
- Count **total female patients**.
- Return **physician-specialty** mappings.
- ✅ Provide **on-the-fly computations** for analytics and reporting.

### 🔄 Transactions
- Used in critical operations (e.g., admission, billing updates) to ensure **atomicity**.
- If one part fails, the entire transaction rolls back, preserving consistency.

### 🛡️ User Access Scripts
- Created roles like `ReadOnlyUser` and `AdminUser`.
- Controlled permission levels using **T-SQL scripts**.
- ✅ Enforce **role-based access** and protect sensitive medical records.


---

## 🧪 Project Phases

1. **Design Phase**: Schema design, normalization, ERD creation.
2. **Implementation Phase**: Table creation, constraints, procedures, triggers.
3. **Testing Phase**: Query validation, transaction tests, data integrity enforcement.

---

## ✅ Impact & Utility

By building this system, the project:
- Simulates a **real-world hospital backend** for managing complex operations.
- Shows how **T-SQL tools** (triggers, procedures, functions) improve reliability and automation.
- Enables **faster, accurate, and secure** access to critical medical information.
- Can be scaled and extended for use in **electronic health record (EHR)** systems.

---

## 🔧 Technologies Used

- Microsoft SQL Server / T-SQL
- Azure Data Studio / SSMS
- ER Diagram Tool (e.g., dbdiagram.io, Draw.io)

---
