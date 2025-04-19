-- First and last names of clients that borrowed books in March 2018
USE MyLibrary;

SELECT client.ClientFirstName, client.ClientLastName FROM Client as client
JOIN Borrower as borrower on client.ClientID = borrower.ClientID and DATE_FORMAT(borrower.BorrowDate, "%Y-%m") = '2018-03';

