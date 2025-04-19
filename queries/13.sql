-- First and last names of authors that wrote books in more than one genre

USE MyLibrary;

-- Book gives us AuthorID and Genre so join together
-- Get count of different genres using COUNT(DISTINCT)
SELECT Author.AuthorFirstName, Author.AuthorLastName, COUNT(DISTINCT Book.Genre) as books_per_genre FROM Book
JOIN Author
    ON Book.AuthorID = Author.AuthorID
GROUP BY Author.AuthorFirstName, Author.AuthorLastName
HAVING books_per_genre > 1
;
