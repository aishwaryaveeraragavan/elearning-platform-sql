# 🎓 E-Learning Platform Database (SQL)

A relational database system for an online learning platform that manages students, instructors, courses, enrollments, payments, and reviews, along with analytical queries that generate business insights.

## 📌 Overview

This project covers the full learning lifecycle: learners register, browse courses by category, enroll, make payments, track progress, and leave reviews. Instructors create and manage courses. The database is normalized (3NF) and enforces data integrity with primary keys, foreign keys, and constraints.

## ✨ Features

- Normalized schema with PK/FK constraints
- Student and instructor management
- Course catalog with categories
- Enrollment and payment tracking
- Ratings and reviews
- Views and stored procedures for reporting
- Analytical queries (top courses, revenue, completion rates)

## 🛠️ Tech Stack

- **Database:** [MySQL / PostgreSQL / SQL Server]
- **Tools:** [MySQL Workbench / pgAdmin / DBeaver]
- **Version control:** Git & GitHub

## 🗂️ Database Schema

| Table | Description |
|-------|-------------|
| `Students` | Learner details (name, email, join date) |
| `Instructors` | Instructor details and expertise |
| `Categories` | Course categories |
| `Courses` | Course info, price, instructor, category |
| `Enrollments` | Student-to-course mapping with enrollment date and status |
| `Payments` | Payment amount, method, and date |
| `Reviews` | Ratings and feedback for courses |

### ER Diagram

![ER Diagram](diagrams/er_diagram.png)

## 📁 Project Structure

```
elearning-platform-sql/
├── README.md
├── schema/
│   └── create_tables.sql
├── data/
│   └── insert_data.sql
├── queries/
│   ├── basic_queries.sql
│   └── analytics_queries.sql
├── views_procedures/
