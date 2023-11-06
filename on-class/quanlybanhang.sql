CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer (
    cID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cName VARCHAR(255),
    cPhone VARCHAR(15)
);
 
CREATE TABLE Orders (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    FOREIGN KEY (cID)
        REFERENCES Customer (cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(255),
    pPrice FLOAT
);


CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    Quantity INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES Orders (oID),
    FOREIGN KEY (pID)
        REFERENCES Product (pID)
);

-- thêm dữ liệu vào mảng
INSERT INTO Customer (cName, cPhone)
VALUES
    ('Customer 1', '123456789'),
    ('Customer 2', '987654321');
    
    
INSERT INTO Orders (cID, oDate)
VALUES
    (1, '2023-11-01'),
    (2, '2023-11-02');
    
INSERT INTO Product (pName, pPrice)
VALUES
    ('Product A', 10.0),
    ('Product B', 20.0);
    
INSERT INTO OrderDetail (oID, pID, Quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 1, 3),
    (2, 2, 2);
-- thực hiện các câu lệnh
SELECT Orders.oID, oDate, SUM(Quantity * pPrice) AS oPrice
FROM Orders 
JOIN OrderDetail  ON Orders.oID = OrderDetail.oID
JOIN Product ON  OrderDetail.oID = Product.pID
GROUP BY oID, oDate;
-- hiển thị kh mua sp 
select c.cName, p.pName, ord.quantity  from Customer c
 join  Orders o on  c.cID = o.cID
join OrderDetail ord on o.oID  = ord.oID
join Product p on p.pID= ord.pID;
-- hiển thị khách hàng ko mua sản phẩm nào
select c.cName from Customer c left join Orders o on c.cID = o.cID
where  o.cID is null;
--
SELECT 
    o.oID, o.oDate, SUM(od.Quantity * p.pPrice) AS oPrice
FROM
    Orders o
        JOIN
    OrderDetail od ON o.oID = od.oID
        JOIN
    Product p ON od.pID = p.pID
GROUP BY o.oID , o.oDate;