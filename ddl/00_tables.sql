-- Create a DB specifically for our tables
-- If we need to shard this database in the future, it'll be easier this way
CREATE DATABASE MyLibrary;

-- Use our new DB
USE MyLibrary;

-- This depends on no other table
 -- Without an author, books don't exist
-- Without books, no borrows or clients,
-- so create this table first, logically
CREATE TABLE Author (
    AuthorID int PRIMARY KEY AUTO_INCREMENT UNIQUE,
    AuthorFirstName varchar(100),
    AuthorLastName varchar(100),
    AuthorNationality varchar(100)
);

-- Client depends on no other tables, so create before others that depend on it
CREATE TABLE Client (
    ClientID int PRIMARY KEY AUTO_INCREMENT UNIQUE,
    ClientFirstName varchar(100),
    ClientLastName varchar(100),
    ClientDOB YEAR,
    Occupation varchar(100)
);

CREATE TABLE Book (
    BookID int PRIMARY KEY AUTO_INCREMENT UNIQUE,
    BookTitle varchar(255),
    AuthorID int,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    Genre varchar(100)
);

CREATE TABLE Borrower (
  BorrowID int PRIMARY KEY AUTO_INCREMENT UNIQUE,
  ClientID int,
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
  BookID int,
  FOREIGN KEY (BookID) REFERENCES Book(BookID),
  BorrowDate DATE
);

-- Create indexes on primary keys because we're going to end up doing a lot of JOINs on those
CREATE INDEX client_pk ON Client (ClientID);
CREATE INDEX book_pk ON Book (BookID);
CREATE INDEX author_pk ON Author (AuthorID);
CREATE INDEX borrow_pk ON Borrower (BorrowID);
