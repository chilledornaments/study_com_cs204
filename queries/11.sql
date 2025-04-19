-- Average number of borrows by age

USE MyLibrary;

-- this is similar to the occupation question (#8), so I'm going to reuse that logic

-- Group people by age
CREATE TEMPORARY TABLE total_by_age SELECT YEAR(CURDATE()) - Client.ClientDOB as age, COUNT(Client.ClientID) as clients_of_this_age FROM Client GROUP BY age;

-- Group borrows by age
CREATE TEMPORARY TABLE borrows_by_age SELECT YEAR(CURDATE()) - Client.ClientDOB as age, COUNT(BorrowID) as borrows FROM Borrower
JOIN Client ON
    Borrower.ClientID = Client.ClientID
GROUP BY age
;


SELECT (borrows_by_age.borrows/total_by_age.clients_of_this_age) as avg, total_by_age.age FROM borrows_by_age
JOIN total_by_age
    ON total_by_age.age = borrows_by_age.age
GROUP BY total_by_age.age, avg
ORDER BY avg DESC;

-- cleanup
DROP TEMPORARY TABLE total_by_age;
DROP TEMPORARY TABLE borrows_by_age;
