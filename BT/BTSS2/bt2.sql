CREATE DATABASE bt2;
USE bt2;
CREATE TABLE IF NOT EXISTS customer(
    c_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    c_name VARCHAR(50) NOT NULL ,
    c_age INT
);
CREATE TABLE IF NOT EXISTS oder(
        o_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        c_id INT,
        o_date DATETIME,
        o_price FLOAT,
        FOREIGN KEY (c_id) REFERENCES customer(c_id)
);
CREATE TABLE IF NOT EXISTS products(
    p_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    p_name VARCHAR(30)NOT NULL ,
    p_price FLOAT CHECK ( p_price > 0 )
);
CREATE TABLE IF NOT EXISTS order_detail(
    o_id INT,
    p_id INT,
    o_quantity INT,
    PRIMARY KEY (o_id,p_id),
    FOREIGN KEY(o_id) REFERENCES oder(o_id),
    FOREIGN KEY(p_id) REFERENCES products(p_id)
);
