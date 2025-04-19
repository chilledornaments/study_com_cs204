--  First names, last names, ages and occupations of all clients

USE MyLibrary;

-- ClientDOB is YYYY, so we can subtract it from the current year to get the client's age(ish)
SELECT ClientFirstName, ClientLastName, (YEAR(CURDATE()) - ClientDOB) as age, Occupation from Client;
