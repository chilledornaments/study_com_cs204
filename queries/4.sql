-- Nationalities of the least 5 authors that clients borrowed during the years 2015-2017

-- This is similar to the last question. Basically: who were the least 5 borrowed authors in 2015-2017. From that set, extract nationalities

USE MyLibrary;

-- We can chain tables like so:
-- Borrower.BookID -> Book.BookID -> Author.AuthorID
SELECT Author.AuthorNationality FROM Borrower
JOIN
    Book ON Borrower.BookID = Book.BookID
JOIN
    Author ON Book.AuthorID = Author.AuthorID

-- Only books 2015 to 2017
WHERE Borrower.BorrowDate >= '2015-01-01' AND Borrower.BorrowDate < '2018-01-01'
-- One author may have written multiple books. Group on AuthorID to aggregate borrows by author
GROUP BY Book.AuthorID
-- Ascending count so least borrowed are first
ORDER BY COUNT(BorrowID)
-- Grab first five
LIMIT 5
;



-- Sanity Check: Author 20, Helena Adams (Canada)
-- 3 Books (23, 26, 28)
-- 17 borrows
select COUNT(*) from Borrower WHERE BookID IN (23, 26, 28) AND Borrower.BorrowDate >= '2015-01-01' AND Borrower.BorrowDate < '2018-01-01';

-- Author 6, Dylan Garcia (Spain)
-- 1 book (6)
-- 3 borrows
select COUNT(*) from Borrower WHERE BookID IN (6) AND Borrower.BorrowDate >= '2015-01-01' AND Borrower.BorrowDate < '2018-01-01';

