-- The book that was most borrowed during the years 2015-2017

USE MyLibrary;


-- Need to find the most borrowed book in a time period
-- I assume the question wants the book title, not just the book ID,
-- So we join Borrow to Book on the BookID
SELECT COUNT(Borrower.BorrowID) borrow_count, Book.BookTitle FROM Borrower
JOIN Book ON Borrower.BookID = Book.BookID
WHERE Borrower.BorrowDate >= '2015-01-01' AND Borrower.BorrowDate < '2017-01-01'
-- We group by Borrower.BookID to get a count of borrows per book
-- Then sort results in descending order and take the first result
GROUP BY Borrower.BookID
ORDER BY borrow_count DESC
LIMIT 1;
