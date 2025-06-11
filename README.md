# DB_Cafemanagementsystem
A relational database project for managing cafe operations with SQL Server
# ☕ Cafe Management System

A relational database system designed and implemented using **SQL Server** to manage cafe operations including orders, menu, staff, inventory, payments, and customer feedback. This project is part of the Semester Database Systems course.

---

## 👥 Group Members

| Name                     | Student ID |
|--------------------------|------------|
| Muhammad Ansab Saddique | 241827     |
| Sayed Shadan Raza        | 249111     |

---

## 📘 Project Description

The Cafe Management System simulates real-world data operations of a cafe chain. The system includes management of:
- Multiple cafe branches
- Menu categories and items
- Customer and staff records
- Orders and payments
- Inventory and supplier details
- Staff shifts and customer reviews

The database is normalized up to **Third Normal Form (3NF)** and includes complete SQL scripts for schema and data population.

---

## 🛠️ Setup Instructions

### 1. Import the Database
- Open **SQL Server Management Studio (SSMS)**
- Run the script `create_tables.sql` to generate all tables
- Run `insert_data.sql` to populate the tables with sample records

### 2. Run Sample Queries
Try executing some of the provided queries in `sample_queries.sql`, like:
```sql
-- View orders for a specific cafe
SELECT * FROM orders WHERE cafe_id = 1;

-- Total payments by method
SELECT method, SUM(amount) AS total FROM payments GROUP BY method;
