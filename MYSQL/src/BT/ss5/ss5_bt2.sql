DROP DATABASE ss5_bt2;
CREATE DATABASE ss5_bt2;
USE ss5_bt2;
-- create cus table
CREATE TABLE ss5_customer
(
    cID   INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cName varchar(100) NOT NULL,
    cAge  INT
);

INSERT INTO ss5_customer(cName, cAge)
VALUES ('Minh Quan', 10),
       ('Ngoc Oanh', 20),
       ('Hong Ha', 50);
-- create order table
CREATE TABLE ss5_order
(
    oID         INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cID         INT,
    oDate       DATETIME,
    oTotalPrice FLOAT
);
ALTER TABLE ss5_order
    ADD CONSTRAINT FOREIGN KEY fk_cID (cID) REFERENCES ss5_customer (cID);
INSERT INTO ss5_order(odate, ototalprice, cid)
VALUES ('2006-3-21', null, 1),
       ('2006-3-23', null, 2),
       ('2006-3-16', null, 1);
-- create tb products
CREATE TABLE ss5_products
(
    pID    INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pName  varchar(100) NOT NULL,
    pPrice FLOAT CHECK ( pPrice > 0 )
);
INSERT INTO ss5_products(pName, pPrice)
VALUES ('May Giat', 3),
       ('Tu lanh', 5),
       ('Dieu hoa', 7),
       ('Quat', 1),
       ('Bep dien', 2);
-- od table
CREATE TABLE ss5_order_detail
(
    odQuantity INT,
    oID        INT,
    pID        INT,
    FOREIGN KEY oID (oID) REFERENCES ss5_order (oID),
    FOREIGN KEY pID (pID) REFERENCES ss5_products (pID)
);
ALTER TABLE ss5_order_detail
    ADD CONSTRAINT PRIMARY KEY pk_c_p_id (oID, pID);
INSERT INTO ss5_order_detail(odQuantity, oID, pID)
VALUES (3, 1, 1),
       (7, 1, 3),
       (2, 1, 4),
       (1, 2, 1),
       (8, 3, 1),
       (4, 2, 5),
       (3, 2, 3);
CREATE VIEW ss5_bt2_orderView AS
SELECT *
FROM ss5_order;

SELECT *
FROM ss5_bt2_orderView
ORDER BY oDate DESC;

DELIMITER && CREATE PROCEDURE get_max_price(OUT max DOUBLE)
BEGIN
    SELECT MAX(pPrice) INTO max from ss5_products;
end && DELIMITER ;

CALL get_max_price(@maxPrice);
SELECT pName,pPrice from ss5_products where pPrice = @maxPrice;

SELECT c.cName, pName FROM ss5_customer as c JOIN ss5_order s5o on c.cID = s5o.cID JOIN ss5_order_detail s5od on s5o.oID = s5od.oID JOIN ss5_products s5p on s5p.pID = s5od.pID;

SELECT cName FROM ss5_customer WHERE cID NOT IN (SELECT DISTINCT cid FROM ss5_order);
SELECT o.oID,o.oDate,odQuantity,pName,pPrice FROM ss5_order as o JOIN ss5_order_detail s5od on o.oID = s5od.oID JOIN ss5_products s5p on s5p.pID = s5od.pID;
SELECT o.oID,o.oDate,SUM(od.odQuantity * p.pPrice) as total FROM ss5_order AS o JOIN ss5_order_detail od on o.oID = od.oID JOIN ss5_products p on od.pID = p.pID GROUP BY o.oID;