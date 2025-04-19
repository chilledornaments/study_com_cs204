-- The top month of borrows in 2017

USE MyLibrary;

-- Get all borrows in 2017, Group by the month
-- order by month desc limit 1
-- The data set actually has a tie, not sure how to handle that
SELECT DATE_FORMAT(Borrower.BorrowDate, '%m') as month, COUNT(*) as borrows FROM Borrower
WHERE BorrowDate >= '2017-01-01' AND BorrowDate < '2018-01-01'
GROUP BY month
ORDER BY borrows DESC
LIMIT 1
;
