-- First and last names of clients that borrowed books in March 2018
USE MyLibrary;

--
SELECT client.ClientFirstName, client.ClientLastName FROM Client as client
JOIN Borrower AS borrower
    -- JOIN client and borrower, but only where the BorrowDate is in March 2018
    ON client.ClientID = borrower.ClientID AND DATE_FORMAT(borrower.BorrowDate, "%Y-%m") = '2018-03';

