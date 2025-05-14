# Library Management System

## Project Description
The **Library Management System** is a relational database management system designed to manage books, authors, members, and book transactions within a library. It allows the tracking of books and their authors, member information, and the borrowing/returning of books by library members.

The system includes well-structured relational tables with proper constraints (PK, FK, NOT NULL, UNIQUE) and various relationships such as one-to-many and many-to-many between entities.

## Features
- **Books**: Store information about the books in the library (title, genre, publication year).
- **Authors**: Store details about authors (first name, last name).
- **Members**: Store information about library members (name, email, phone number).
- **Transactions**: Track book borrowings and returns, associating books with members.

## Database Design

### Entities:
- **Books**: Contains details about books in the library.
- **Authors**: Contains information about authors who write books.
- **Members**: Contains information about library members.
- **Transactions**: Keeps track of which books are borrowed by which members and their due return dates.

### Relationships:
- **Many-to-Many**: A book can have multiple authors, and an author can write multiple books.
- **One-to-Many**: A member can borrow multiple books, but each transaction links one book to one member.
  
### Key Constraints:
- **Primary Key (PK)**: Ensures each record is unique.
- **Foreign Key (FK)**: Ensures referential integrity between related tables.
- **NOT NULL**: Ensures that essential data is provided.
- **UNIQUE**: Ensures that certain columns have unique values.

## How to Set Up the Project

### Requirements:
- MySQL or any compatible relational database management system.

### Steps to Import the Database:
1. Download the `library_management.sql` file from this repository.
2. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin).
3. Run the SQL script to create the database and tables.

```bash
mysql -u your_username -p < library_management.sql
