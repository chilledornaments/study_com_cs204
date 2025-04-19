-- Average number of borrowed books by job title

USE MyLibrary;

-- Get number of people in each occupation
CREATE TEMPORARY TABLE total_in_occupation SELECT Client.Occupation as client_occupation, COUNT(Client.ClientID) as clients_in_occupation FROM Client GROUP BY Client.Occupation;

-- Get number of borrows per occupation
CREATE TEMPORARY TABLE borrows_per_occupation SELECT Client.Occupation as client_occupation, COUNT(Borrower.BorrowID) as borrows FROM Client
-- JOIN gives us ability to get number of borrows
JOIN
    Borrower on Client.ClientID = Borrower.ClientID
GROUP BY Client.Occupation;

-- Divide number of borrows for a given occupation by the number people in an occupation to get the average borrows
-- per occupation
SELECT total_in_occupation.client_occupation, (bpo.borrows / total_in_occupation.clients_in_occupation) AS avg_per_occupation
FROM total_in_occupation
JOIN
    borrows_per_occupation bpo on total_in_occupation.client_occupation = bpo.client_occupation
-- present most to least
ORDER BY avg_per_occupation DESC;

-- cleanup
DROP TEMPORARY TABLE total_in_occupation;
DROP TEMPORARY TABLE borrows_per_occupation;
