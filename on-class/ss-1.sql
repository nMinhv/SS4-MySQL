CREATE  DATABASE  employee_management3;
USE employee_management3;
-- Tạo mới bảng
CREATE TABLE employee(
employee_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- khóa chính
employee_name TEXT,
employee_address TEXT,
department_id INT
);
CREATE TABLE department(
department_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
department_name TEXT NOT NULL
);

-- Thêm mới dữ liệu
INSERT INTO department(
department_name,
employee_quantity
)VALUES (
'Marketing',
10
);

INSERT INTO employee(
employee_name,
department_id
) VALUES('Tiến',1);

-- các câu lệnh truy vấn
-- 1.SELECT : LẤY DỮ LIỆU RA

-- nhóm
SELECT * FROM employee;
SELECT department_id,employee_quantity,employee_id, COUNT(employee_id) AS employee_count FROM employee 
GROUP BY department_id -- nhóm theo group
HAVING COUNT(employee_id>1); -- thêm điều kiện
-- ***************

-- update
UPDATE employee SET  employee_name ="hồ ngọc tiến" WHERE employee_id =2;
-- delete thường dung update để xóa mềm
UPDATE employee SET is_deleted =1 WHERE employee_id =1;


-- xóa bảng
-- DROP TABLE department,employee;
-- DROP DATABASE  employee_management3;

SELECT * FROM department;
SELECT department_name,employee_quantity FROM department;
SELECT department_name FROM department WHERE employee_quantity > 10 AND department_name ="Sale";
SELECT COUNT(department_id) AS department_count FROM department WHERE employee_quantity>10;
-- thêm cột số lượng nhân viên
ALTER TABLE department
ADD COLUMN employee_quantity INT;
--  thêm cột để xóa mền cho bảng employeeemployee
ALTER TABLE employee
ADD COLUMN is_deleted BIT DEFAULT 0;


ALTER TABLE department
ADD COLUMN is_deleted BIT DEFAULT 0;
