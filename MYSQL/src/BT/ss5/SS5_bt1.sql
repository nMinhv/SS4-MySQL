CREATE DATABASE demo_ss5_bt1;
USE demo_ss5_bt1;
CREATE TABLE Products
(
    ID             INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_code   VARCHAR(5)  NOT NULL,
    product_name   varchar(50) NOT NULL,
    product_price  FLOAT CHECK ( product_price > 0 ),
    product_amount INT DEFAULT 0,
    product_des    TEXT,
    product_status BIT DEFAULT 0
);
INSERT INTO Products
VALUES (1, 'p_n_1', 'product 1', 10, 2, 'none', 0),
       (2, 'p_n_2', 'product 2', 12, 3, 'none', 0),
       (3, 'p_n_3', 'product 3', 16, 5, 'none', 0),
       (4, 'p_n_4', 'product 4', 14, 1, 'none', 0),
       (5, 'p_n_5', 'product 5', 11, 4, 'none', 0),
       (6, 'p_n_6', 'product 6', 17, 3, 'none', 0);

CREATE UNIQUE INDEX index_p_code ON Products (product_code);
CREATE INDEX composite_index_p ON Products (product_name, product_price);
EXPLAIN Products;
INSERT INTO Products value (7, 'p_n_7', 'product 7', 17, 3, 'none', 1);

CREATE VIEW p_view AS
SELECT product_code, product_name, product_price, (IF(product_status = 1, 'sale', 'not sale')) AS status
FROM Products;

ALTER VIEW p_view AS
    SELECT product_name, product_price, (IF(product_status = 1, 'sale', 'not sale')) AS status
    FROM Products;
DROP VIEW p_view;

SELECT *
FROM p_view;

DELIMITER &&
CREATE PROCEDURE store_procedure()
BEGIN
    SELECT * FROM Products;
END && DELIMITER ;

DELIMITER &&
CREATE PROCEDURE add_store_procedure(IN pC VARCHAR(5), IN pN varchar(50), IN pP FLOAT, IN pA INT, IN pD TEXT, IN pS BIT)
BEGIN
    INSERT INTO Products (product_code, product_name, product_price, product_amount, product_des, product_status)
    VALUES (pC, pN, pP, pA, pD, pS);
END && DELIMITER ;
DELIMITER &&
CREATE PROCEDURE edit_store_procedure(IN pI INT, IN pN varchar(50), IN pP FLOAT, IN pA INT,
                                      IN pD TEXT, IN pS BIT)
BEGIN
    UPDATE Products
    SET product_name   = pN,
        product_price  = pP,
        product_amount = pA,
        product_des    = pD,
        product_status = pS
    WHERE ID = pI;
END && DELIMITER ;
DELIMITER &&
CREATE PROCEDURE delete_store_procedure(IN pID INT)
BEGIN
    DELETE FROM Products WHERE ID = pID;
END && DELIMITER ;
CALL store_procedure();
CALL add_store_procedure('p_n_8', 'product 8', 2, 2, 'none', 1);
CALL edit_store_procedure(8, 'product 9', 3, 3, 'noice', 0);