-- Create a VIEW and display the titles that were borrowed by at least 20% of clients

USE MyLibrary;

-- First, how many people is 20% of clients?
-- Then, we need to COUNT() borrows by BookID and filter for ones that have > N borrows
-- Then JOIN against Book table to get title

CREATE VIEW PopularTitles AS
SELECT B.BookTitle, COUNT(Borrower.BorrowID) as borrows
FROM Borrower
JOIN Book B on Borrower.BookID = B.BookID
GROUP BY B.BookID
-- Multiply total number of clients by .2 to determine what 20% of clients is
-- We could hardcode this, but what if you add a client?
-- Use HAVING because it allows using aggregate funcs
HAVING borrows > (SELECT (COUNT(*) * .2) as twenty_percent_of_clients FROM Client)
;
