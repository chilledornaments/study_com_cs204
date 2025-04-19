-- Top borrowed genres for client born in years 1970-1980

-- For people born in range, what are the top 5 most borrowed genres?

USE MyLibrary;


-- Client.ClientDOB is a 4 digit year
-- A Borrower row has ClientID

-- Borrower has FK to Client, so use Client to get to Borrow.BookID
-- then use Borrow.BookID to get to Book.Genre
SELECT Book.Genre, COUNT(Borrower.BorrowID) as borrows FROM Client
JOIN Borrower ON Client.ClientID = Borrower.ClientID
JOIN Book ON Borrower.BookID = Book.BookID
WHERE Client.ClientDOB > 1969 AND Client.ClientDOB < 1981
GROUP BY Book.Genre
ORDER BY borrows DESC
LIMIT 5;
