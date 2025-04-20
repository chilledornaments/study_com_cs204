-- First and last names of the top 5 authors clients borrowed in 2017

-- Question is asking us to find who the top 5 most borrowed authors were in 2017
-- So we need to the most borrowed authors in the Borrower

USE MyLibrary;
-- Extract the author's name, plus the number of times someone has borrowed a book written by them
SELECT subquery.AuthorFirstName, subquery.AuthorLastName, count(Borrower.BorrowID) as total_borrows FROM Borrower
JOIN
-- The subquery gets us a map of BookID -> Author info
-- So we can JOIN on the borrowID to map a borrowed book to an author's first and last name
 (SELECT DISTINCT Book.BookID, Author.AuthorFirstName, Author.AuthorLastName FROM Book JOIN Author ON Book.AuthorID = Author.AuthorID) as subquery

 ON Borrower.BookID = subquery.BookID
-- We only care about books borrowed in 2017
WHERE DATE_FORMAT(Borrower.BorrowDate, '%Y') = 2017

GROUP BY subquery.AuthorFirstName, subquery.AuthorLastName
ORDER BY total_borrows DESC
LIMIT 5;

-- Sanity check Book 29 was written by Author 23 (Emily Murphy)
-- Author 23 has only written 1 book
-- This query has two results, so we should only have two
-- select * from Borrower where BookID = 29 and DATE_FORMAT(Borrower.BorrowDate, '%Y') = 2017
