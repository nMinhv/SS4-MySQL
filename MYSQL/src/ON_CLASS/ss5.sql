USE quanlybanhang;
DROP VIEW IF EXISTS view_orders;
CREATE VIEW view_orders AS
SELECT cName, COUNT(oder.oID) AS t_o
FROM orders AS oder
         LEFT JOIN customer ON oder.cID = customer.cID
GROUP BY cName;

SELECT *
FROM view_orders;
-- thu tuc lay ve danh sach
DELIMITER &&
CREATE PROCEDURE proc_getAll_o()
BEGIN
    SELECT * FROM orders;
END && DELIMITER ;
-- -------------------------------------

-- thu tuc co tham so dau vao
DELIMITER &&
CREATE PROCEDURE proc_insert_pro(IN procName VARCHAR(255), IN procPrice FLOAT)
BEGIN
    INSERT INTO product(pName, pPrice) VALUE (procName, procPrice);
end && DELIMITER ;
-- delete
DELIMITER &&
CREATE PROCEDURE proc_delete_pro(IN proId INT)
BEGIN
    DELETE FROM product WHERE pID = proId;
end && DELIMITER ;
-- edit
DELIMITER && CREATE PROCEDURE proc_Edit_pro(IN proId INT, IN proName VARCHAR(255), IN proPrice FLOAT)
BEGIN
    UPDATE product SET pName = proName, pPrice = proPrice WHERE pID = proId;
end && DELIMITER ;
-- get
DELIMITER && CREATE PROCEDURE proc_view_pro(IN no_page INT)
BEGIN
    DECLARE get_start, per_p INT;
    SET per_p = 2;
    SET get_start = (no_page - 1) * per_p;
    SELECT * FROM product LIMIT per_p OFFSET get_start;
end && DELIMITER ;

-- --------------- CALL---------------
CALL proc_getAll_o();
-- add
CALL proc_insert_pro('deo lao', 10);

-- delete
CALL proc_delete_pro(6);
-- edit
CALL proc_Edit_pro(7, 'dep to ong', 5);

CALL proc_view_pro(1);
