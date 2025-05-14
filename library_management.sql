
-- Create the Authors table (one author can write many books)
CREATE TABLE Authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key
    firstName VARCHAR(100) NOT NULL,          -- Author's first name (NOT NULL)
    lastName VARCHAR(100) NOT NULL,           -- Author's last name (NOT NULL)
    UNIQUE(firstName, lastName)               -- Unique constraint to avoid duplicate authors
);

-- Create the Books table (one book can have multiple authors)
CREATE TABLE Books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,    -- Primary key
    title VARCHAR(255) NOT NULL,               -- Book title (NOT NULL)
    genre VARCHAR(100),                        -- Book genre
    publicationYear INT,                       -- Year the book was published
    UNIQUE(title)                              -- Ensuring no duplicate book titles
);

-- Create a Junction table for Many-to-Many Relationship (Books and Authors)
CREATE TABLE BookAuthors (
    bookID INT,                                -- Foreign key referencing Books
    authorID INT,                              -- Foreign key referencing Authors
    PRIMARY KEY (bookID, authorID),            -- Composite primary key
    FOREIGN KEY (bookID) REFERENCES Books(bookID) ON DELETE CASCADE,
    FOREIGN KEY (authorID) REFERENCES Authors(authorID) ON DELETE CASCADE
);

-- Create the Members table (Members of the library)
CREATE TABLE Members (
    memberID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key
    firstName VARCHAR(100) NOT NULL,            -- Member's first name (NOT NULL)
    lastName VARCHAR(100) NOT NULL,             -- Member's last name (NOT NULL)
    email VARCHAR(150) UNIQUE NOT NULL,         -- Email should be unique and not NULL
    phoneNumber VARCHAR(15),                    -- Member's contact number
    joinDate DATE NOT NULL                     -- Date the member joined the library
);

-- Create the Transactions table (Each transaction corresponds to a book borrowed by a member)
CREATE TABLE Transactions (
    transactionID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key
    bookID INT,                                     -- Foreign key referencing Books
    memberID INT,                                   -- Foreign key referencing Members
    borrowDate DATE NOT NULL,                       -- Date the book was borrowed
    returnDate DATE,                                -- Date the book was returned
    status ENUM('borrowed', 'returned') DEFAULT 'borrowed', -- Transaction status (borrowed/returned)
    FOREIGN KEY (bookID) REFERENCES Books(bookID) ON DELETE CASCADE,
    FOREIGN KEY (memberID) REFERENCES Members(memberID) ON DELETE CASCADE
);

-- Example data insertion for demonstration (optional, can be removed for the final version)
INSERT INTO Authors (firstName, lastName) VALUES ('John', 'Smith'), ('Jane', 'Doe');
INSERT INTO Books (title, genre, publicationYear) VALUES ('The Great Adventure', 'Adventure', 2021), ('Learn SQL', 'Educational', 2020);
INSERT INTO Members (firstName, lastName, email, phoneNumber, joinDate) VALUES ('Alice', 'Johnson', 'alice@example.com', '1234567890', '2021-06-15'), ('Bob', 'Miller', 'bob@example.com', '0987654321', '2022-03-10');
INSERT INTO Transactions (bookID, memberID, borrowDate, status) VALUES (1, 1, '2021-07-01', 'borrowed');
INSERT INTO BookAuthors (bookID, authorID) VALUES (1, 1), (2, 2);  -- Linking books with authors