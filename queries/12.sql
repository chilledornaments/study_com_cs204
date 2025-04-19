-- The oldest and the youngest clients of the library

USE MyLibrary;

SELECT  Client.ClientFirstName, Client.ClientLastName, Client.ClientDOB FROM Client
    -- The smallest number is the oldest person
    WHERE ClientDOB = (select MIN(Client.ClientDOB) from Client)
    -- Largest DOB is youngest person
    OR ClientDOB = (select MAX(Client.ClientDOB) from Client)

    GROUP BY Client.ClientFirstName, Client.ClientLastName, Client.ClientDOB
-- Oldest first
ORDER BY Client.ClientDOB
;


