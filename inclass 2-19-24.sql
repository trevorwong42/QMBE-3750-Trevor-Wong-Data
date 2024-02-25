USE bits_copy;


SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION ADDNUM(a INT, B INT) RETURNS int
BEGIN
RETURN a + b;
END $$

SELECT ADDNUM(10, 12);


DELIMITER //

CREATE FUNCTION average_balance() RETURNS INT
BEGIN
DECLARE result INT;
SET result = (SELECT AVG('balance') FROM bits.client);
RETURN result;
END //

DELIMITER ;
SELECT bits.average_balance();



#^^^^^^^^^^^^^^^^^^^^^^^'USELESS'

SHOW FUNCTION STATUS;