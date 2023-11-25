CREATE DATABASE test_db;
USE test_db;

/***CREATING ALL TABLES*/
CREATE TABLE USER (
  UserId   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  FirstName    VARCHAR(40)                    NULL,
  LastName     VARCHAR(40)                    NULL,
  Phone        VARCHAR(20)                    NULL,
  Email        VARCHAR(100)                   NULL,
  CreationDate DATETIME                       NULL
)
  ENGINE = INNODB;

/* INSERT DATA */
INSERT INTO USER (FirstName, LastName, Phone, Email, CreationDate)
VALUES ('Olan', 'Samritjiarapon', '082-4870707', 'olan@olanlab.com', '2017-11-11 11:11:11');

DROP PROCEDURE IF EXISTS sp_GetUser;
DELIMITER //
CREATE PROCEDURE sp_GetUser()
  BEGIN
    SELECT * FROM USER;
  END //
DELIMITER ;
/**Drop StoreProcedure**/
CALL sp_GetUser();
/******************************************************************/