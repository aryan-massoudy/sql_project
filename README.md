# sql_project
SQL project to implement basic concepts of relational DBs using MSSQL


This code is for managing a project database in SQL Server. It performs several tasks, including creating and modifying database structures, inserting data, and handling specific operations like calculating employee work hours. Here's a breakdown:

1. Create Database and Tables
Database: A database named ProjektDB is created.
Tables:
Projekte: Stores project details (name, start and end dates, budget).
Mitarbeiter: Stores employee details (first name, last name, department, and hourly rate).
Aufgaben: Stores tasks associated with projects and employees (task name, description, start and end dates, status, project, and employee links).
Status: Normalizes the task status field by creating a separate table for task statuses.
AufgabenStunden: Tracks work sessions for employees on tasks (start and end times).
2. Insert Data
Projects: Five example projects with details like start date, end date, and budget are inserted.
Employees: Ten employees with names and departments are added, along with an hourly rate.
Tasks: Ten tasks, linked to projects and employees, are added.
Work Sessions: Work session data for tasks performed by employees over July and August is inserted.
3. Enhance Normalization
A Status table is created to store unique task statuses. The StatusID column is added to Aufgaben, replacing the Status text field.
4. Modify Employee Table
Added a column Stundensatz (hourly rate) and set it to 25 for all employees.
Deleted two employees and updated one employee's name.
Increased all employees' hourly rates by 10%.
5. Create View
A view MitarbeiterArbeitsZeiten calculates:
Total work hours per month and year.
Total payment based on hourly rate.
Flags employees with work hours exceeding 35 per week as having "overtime".
6. Constraints and Defaults
A default constraint for the Startdatum column in the Aufgaben table is added to use the current date when no value is provided.
7. User and Permissions
A database user ProjektAdmin is created with the password Test1234! and given db_owner privileges.
8. Other Enhancements
A query for viewing and sorting employee work and payment data.
Added scripts to handle business logic like calculating overtime and linking task statuses.
This code is well-structured for creating, populating, and managing a database for a project and employee management system while adhering to normalization principles.
