-- Top 5 occupations that borrowed the most in 2016

USE MyLibrary;

-- Client gives us occupation and can be used to get at Borrow.BorrowID, which we can COUNT()
-- Then group by occupation after joining Client and Borrower on ClientID
SELECT Client.Occupation, COUNT(Borrower.BorrowID) as borrows FROM Client
JOIN
    Borrower ON Client.ClientID = Borrower.ClientID
WHERE Borrower.BorrowDate >= '2016-01-01' AND Borrower.BorrowDate < '2017-01-01'
GROUP BY Client.Occupation
ORDER BY borrows DESC
LIMIT 5;


