/***CREATING ALL TABLES*/
CREATE TABLE Users (
  UserId   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  FirstName    VARCHAR(40)                    NULL,
  LastName     VARCHAR(40)                    NULL,
  Phone        VARCHAR(20)                    NULL,
  Email        VARCHAR(100)                   NULL,
  CreationDate DATETIME                       NULL
)
  ENGINE = INNODB;

/* INSERT DATA */
INSERT INTO Users (FirstName, LastName, Phone, Email, CreationDate)
VALUES ('Olan', 'Samritjiarapon', '082-4870707', 'olan@olanlab.com', '2017-11-11 11:11:11'),
  ('John', 'Doe', '123-4567890', 'john.doe@example.com', '2020-01-01 10:00:00'),
  ('Jane', 'Smith', '987-6543210', 'jane.smith@example.com', '2021-05-15 14:30:00'),
  ('Alice', 'Johnson', '555-1234567', 'alice.johnson@example.com', '2019-08-20 08:45:00'),
  ('Bob', 'Brown', '444-9876543', 'bob.brown@example.com', '2022-03-10 16:20:00');

/******************************************************************/

DROP PROCEDURE IF EXISTS sp_GetUsers;
DELIMITER //
CREATE PROCEDURE sp_GetUsers()
  BEGIN
    SELECT * FROM Users;
  END //
DELIMITER ;
/**Drop StoreProcedure**/
CALL sp_GetUsers();
/******************************************************************/