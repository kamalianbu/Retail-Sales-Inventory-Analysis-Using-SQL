#Retail Sales Analysis and Customer Behaviour analysis Using SQL#

-- DataBase Creation
create database sqlproject;
use sqlproject;
-- Table Creations
CREATE TABLE customers (customer_id INT PRIMARY KEY AUTO_INCREMENT,customer_name VARCHAR(100) NOT NULL,city VARCHAR(50),segment VARCHAR(30),registration_date DATE);
CREATE TABLE products (product_id INT PRIMARY KEY AUTO_INCREMENT,product_name VARCHAR(100) NOT NULL,category VARCHAR(50) NOT NULL,cost_price DECIMAL(10,2) NOT NULL,selling_price DECIMAL(10,2) NOT NULL);
CREATE TABLE stores (store_id INT PRIMARY KEY AUTO_INCREMENT,store_name VARCHAR(100) NOT NULL,city VARCHAR(50) NOT NULL,state VARCHAR(50) NOT NULL,manager_name VARCHAR(100) NOT NULL,opened_date DATE);
CREATE TABLE orders (order_id INT PRIMARY KEY AUTO_INCREMENT,customer_id INT NOT NULL,store_id INT NOT NULL,order_date DATE NOT NULL,total_amount DECIMAL(10,2) NOT NULL,payment_method VARCHAR(20),FOREIGN KEY (customer_id) REFERENCES customers(customer_id),FOREIGN KEY (store_id) REFERENCES stores(store_id));
CREATE TABLE order_details (order_detail_id INT PRIMARY KEY AUTO_INCREMENT,order_id INT NOT NULL,product_id INT NOT NULL,quantity INT NOT NULL,FOREIGN KEY (order_id) REFERENCES orders(order_id),FOREIGN KEY (product_id) REFERENCES products(product_id));
CREATE TABLE inventory (inventory_id INT PRIMARY KEY AUTO_INCREMENT,product_id INT NOT NULL,store_id INT NOT NULL,quantity_in_stock INT NOT NULL DEFAULT 0,reorder_level INT NOT NULL DEFAULT 10,last_restock_date DATE,FOREIGN KEY (product_id) REFERENCES products(product_id),FOREIGN KEY (store_id) REFERENCES stores(store_id));

-- Insertion Into Tables
INSERT INTO customers VALUES
(1,'Aarav Mehta','Chennai','Retail','2023-01-12'),
(2,'Priya Reddy','Bangalore','Corporate','2023-02-05'),
(3,'Rahul Sharma','Hyderabad','Retail','2023-03-18'),
(4,'Kavya Nair','Mumbai','Retail','2023-04-10'),
(5,'Vikram Singh','Delhi','Corporate','2023-05-21'),
(6,'Sneha Iyer','Chennai','Retail','2023-06-25'),
(7,'Aditya Verma','Bangalore','Retail','2023-07-14'),
(8,'Divya Patel','Hyderabad','Corporate','2023-08-09'),
(9,'Rohit Menon','Mumbai','Retail','2023-09-30'),
(10,'Anjali Gupta','Delhi','Retail','2023-10-11'),
(11,'Kiran Kumar','Chennai','Corporate','2023-02-18'),
(12,'Harini Suresh','Bangalore','Retail','2023-03-22'),
(13,'Farhan Khan','Hyderabad','Retail','2023-04-16'),
(14,'Roshni Joseph','Mumbai','Corporate','2023-05-27'),
(15,'Deepak Shetty','Delhi','Retail','2023-06-13'),
(16,'Pooja Agarwal','Chennai','Retail','2023-07-19'),
(17,'Sanjay Gupta','Bangalore','Corporate','2023-08-24'),
(18,'Nisha Das','Hyderabad','Retail','2023-09-05'),
(19,'Arjun Reddy','Mumbai','Retail','2023-10-14'),
(20,'Shreya Bhat','Delhi','Corporate','2023-11-22'),
(21,'Manoj Pillai','Chennai','Retail','2023-01-26'),
(22,'Kavitha Raj','Bangalore','Retail','2023-02-11'),
(23,'Tarun Malhotra','Hyderabad','Corporate','2023-03-28'),
(24,'Ritu Singh','Mumbai','Retail','2023-04-19'),
(25,'Abhishek Jain','Delhi','Retail','2023-05-07'),
(26,'Lavanya Mohan','Chennai','Corporate','2023-06-12'),
(27,'Amit Kumar','Bangalore','Retail','2023-07-08'),
(28,'Meera Thomas','Hyderabad','Retail','2023-08-03'),
(29,'Ravi Krishnan','Mumbai','Corporate','2023-09-17'),
(30,'Swathi Iyer','Delhi','Retail','2023-10-28'),
(31,'Naveen Joseph','Chennai','Retail','2023-11-04'),
(32,'Varun Sharma','Bangalore','Corporate','2023-01-18'),
(33,'Lakshmi Menon','Hyderabad','Retail','2023-02-14'),
(34,'Suresh Kumar','Mumbai','Retail','2023-03-25'),
(35,'Ananya Rao','Delhi','Corporate','2023-04-30'),
(36,'Imran Ali','Chennai','Retail','2023-06-10'),
(37,'Geetha Reddy','Bangalore','Retail','2023-07-21'),
(38,'Raghav Gupta','Hyderabad','Corporate','2023-08-26'),
(39,'Jasmin Samuel','Mumbai','Retail','2023-09-29'),
(40,'Dinesh Patel','Delhi','Retail','2023-10-06'),
(41,'Sahana Prakash','Chennai','Corporate','2023-11-15'),
(42,'Ajay Singh','Bangalore','Retail','2023-12-03'),
(43,'Ramya Nair','Hyderabad','Retail','2023-01-24'),
(44,'Mahesh Yadav','Mumbai','Corporate','2023-02-27'),
(45,'Priyanka Sharma','Delhi','Retail','2023-03-16'),
(46,'Arun Raj','Chennai','Retail','2023-04-09'),
(47,'Shilpa Menon','Bangalore','Corporate','2023-05-31'),
(48,'Joseph Mathew','Hyderabad','Retail','2023-06-06'),
(49,'Harish Kumar','Mumbai','Retail','2023-07-11'),
(50,'Sneha Kapoor','Delhi','Corporate','2023-08-22');
INSERT INTO products VALUES
(1,'Basmati Rice 5kg','Grocery',280.00,350.00),
(2,'Shampoo 500ml','Personal Care',120.00,175.00),
(3,'LED Bulb 9W','Electronics',75.00,120.00),
(4,'T-Shirt Cotton','Clothing',150.00,250.00),
(5,'Toor Dal 1kg','Grocery',92.00,130.00),
(6,'Bath Soap 100g','Personal Care',18.00,30.00),
(7,'Detergent Powder 1kg','Household',55.00,90.00),
(8,'USB Cable 1m','Electronics',45.00,80.00),
(9,'Women Kurti','Clothing',280.00,480.00),
(10,'Sugar 1kg','Grocery',38.00,52.00),
(11,'Notebook 200 Pages','Stationery',25.00,40.00),
(12,'Face Wash 150ml','Personal Care',85.00,130.00),
(13,'AA Batteries Pack of 4','Electronics',35.00,60.00),
(14,'Men Formal Shirt','Clothing',320.00,520.00),
(15,'Sunflower Oil 1L','Grocery',110.00,145.00),
(16,'Glass Cleaner 500ml','Household',65.00,95.00),
(17,'Ball Pen (Pack of 5)','Stationery',20.00,35.00),
(18,'Hair Oil 200ml','Personal Care',55.00,85.00),
(19,'Table Fan 3-Speed','Electronics',650.00,850.00),
(20,'Kids School Bag','Clothing',300.00,450.00),
(21,'Atta 5kg','Grocery',150.00,199.00),
(22,'Mop Stick Set','Household',120.00,180.00),
(23,'Kitchen Foil 72m','Household',95.00,150.00),
(24,'Power Bank 10000mAh','Electronics',600.00,900.00),
(25,'Women Leggings','Clothing',200.00,320.00),
(26,'Marker Pen Set','Stationery',50.00,80.00),
(27,'Instant Noodles Pack','Grocery',35.00,50.00),
(28,'Shaving Cream 100g','Personal Care',45.00,70.00),
(29,'Room Freshener 300ml','Household',110.00,160.00),
(30,'Bluetooth Earphones','Electronics',480.00,750.00);
INSERT INTO stores VALUES
(1,'Chennai Central Store','Chennai','Tamil Nadu','Ramesh Kumar','2020-02-10'),
(2,'Bangalore North Store','Bangalore','Karnataka','Suresh Reddy','2019-08-15'),
(3,'Hyderabad City Center','Hyderabad','Telangana','Megha Patel','2021-01-20'),
(4,'Mumbai Andheri Store','Mumbai','Maharashtra','Arun Sharma','2018-06-05'),
(5,'Delhi Karol Bagh Store','Delhi','Delhi','Priya Menon','2022-10-12');
INSERT INTO orders VALUES
(1,12,1,'2024-01-02',450.50,'UPI'),
(2,5,3,'2024-01-03',780.00,'Card'),
(3,21,2,'2024-01-03',320.75,'Cash'),
(4,8,5,'2024-01-04',540.00,'UPI'),
(5,15,1,'2024-01-04',260.40,'Cash'),
(6,27,4,'2024-01-05',970.10,'Card'),
(7,33,2,'2024-01-06',350.00,'UPI'),
(8,4,1,'2024-01-06',620.00,'Cash'),
(9,19,3,'2024-01-07',890.25,'Card'),
(10,6,5,'2024-01-07',140.00,'UPI'),
(11,44,2,'2024-01-08',230.50,'Cash'),
(12,10,1,'2024-01-08',760.00,'Card'),
(13,3,4,'2024-01-09',415.00,'UPI'),
(14,18,5,'2024-01-09',935.90,'Cash'),
(15,29,3,'2024-01-10',310.00,'UPI'),
(16,7,1,'2024-01-10',520.00,'Card'),
(17,14,2,'2024-01-11',185.40,'Cash'),
(18,50,4,'2024-01-11',680.30,'UPI'),
(19,23,5,'2024-01-12',795.50,'Card'),
(20,9,3,'2024-01-12',265.80,'UPI'),
(21,31,1,'2024-01-13',440.00,'Cash'),
(22,2,5,'2024-01-13',980.00,'Card'),
(23,46,4,'2024-01-14',300.00,'UPI'),
(24,1,2,'2024-01-14',620.50,'Cash'),
(25,35,3,'2024-01-15',890.10,'Card'),
(26,17,1,'2024-01-15',240.00,'UPI'),
(27,49,5,'2024-01-16',330.60,'Cash'),
(28,25,4,'2024-01-17',740.25,'Card'),
(29,40,2,'2024-01-17',560.00,'UPI'),
(30,11,1,'2024-01-18',155.00,'Cash'),
(31,6,3,'2024-01-18',910.70,'UPI'),
(32,22,4,'2024-01-19',275.50,'Card'),
(33,48,5,'2024-01-19',430.00,'Cash'),
(34,30,2,'2024-01-20',850.20,'UPI'),
(35,20,3,'2024-01-20',195.00,'Cash'),
(36,32,1,'2024-01-21',760.40,'Card'),
(37,43,5,'2024-01-21',255.00,'UPI'),
(38,26,4,'2024-01-22',690.10,'Card'),
(39,45,2,'2024-01-22',340.50,'Cash'),
(40,24,1,'2024-01-23',560.00,'UPI'),
(41,38,3,'2024-01-23',980.00,'Card'),
(42,41,4,'2024-01-24',275.60,'Cash'),
(43,47,5,'2024-01-24',450.00,'UPI'),
(44,13,2,'2024-01-25',310.75,'Card'),
(45,16,1,'2024-01-25',230.40,'UPI'),
(46,28,3,'2024-01-26',725.00,'Cash'),
(47,36,5,'2024-01-27',840.90,'Card'),
(48,34,4,'2024-01-27',490.00,'UPI'),
(49,39,2,'2024-01-28',260.00,'Cash'),
(50,42,1,'2024-01-28',680.00,'Card');
INSERT INTO order_details VALUES
(1,1,3,2),
(2,1,15,1),
(3,2,7,3),
(4,2,1,1),
(5,3,10,2),
(6,3,5,1),
(7,4,12,1),
(8,4,27,2),
(9,5,8,2),
(10,5,4,1),
(11,6,19,1),
(12,6,2,2),
(13,7,14,3),
(14,7,9,1),
(15,8,23,2),
(16,8,6,1),
(17,9,28,2),
(18,9,7,1),
(19,10,11,1),
(20,10,5,2),
(21,11,16,1),
(22,11,3,2),
(23,12,8,1),
(24,12,25,2),
(25,13,2,3),
(26,13,24,1),
(27,14,30,2),
(28,14,5,1),
(29,15,21,2),
(30,15,12,1),
(31,16,18,1),
(32,16,7,2),
(33,17,4,1),
(34,17,11,2),
(35,18,9,3),
(36,18,1,1),
(37,19,13,2),
(38,19,27,1),
(39,20,22,1),
(40,20,5,2),
(41,21,6,1),
(42,21,19,2),
(43,22,8,3),
(44,22,14,1),
(45,23,17,2),
(46,23,10,1),
(47,24,11,1),
(48,24,23,2),
(49,25,4,3),
(50,25,18,1),
(51,26,26,2),
(52,26,1,1),
(53,27,15,2),
(54,27,3,1),
(55,28,10,2),
(56,28,7,1),
(57,29,22,1),
(58,29,13,2),
(59,30,21,2),
(60,30,5,1),
(61,31,25,2),
(62,31,30,1),
(63,32,6,1),
(64,32,14,2),
(65,33,4,2),
(66,33,2,1),
(67,34,11,3),
(68,34,17,1),
(69,35,5,2),
(70,35,9,1),
(71,36,8,3),
(72,36,12,1),
(73,37,29,1),
(74,37,1,2),
(75,38,10,2),
(76,38,18,1),
(77,39,7,2),
(78,39,20,1),
(79,40,24,2),
(80,40,3,1),
(81,41,16,2),
(82,41,11,1),
(83,42,13,3),
(84,42,6,1),
(85,43,14,2),
(86,43,5,1),
(87,44,27,3),
(88,44,8,1),
(89,45,22,1),
(90,45,15,2),
(91,46,30,2),
(92,46,21,1),
(93,47,17,3),
(94,47,12,1),
(95,48,4,2),
(96,48,29,1),
(97,49,3,1),
(98,49,19,2),
(99,50,25,2),
(100,50,10,1);
INSERT INTO inventory VALUES
(1,1,1,55,30,'2024-01-05'),
(2,1,2,42,30,'2024-01-07'),
(3,1,3,38,30,'2024-01-03'),
(4,1,4,60,30,'2024-01-08'),
(5,1,5,45,30,'2024-01-04'),
(6,2,1,32,15,'2024-01-06'),
(7,2,2,28,15,'2024-01-07'),
(8,2,3,40,15,'2024-01-03'),
(9,2,4,35,15,'2024-01-05'),
(10,2,5,30,15,'2024-01-02'),
(11,3,1,30,8,'2024-01-04'),
(12,3,2,22,8,'2024-01-06'),
(13,3,3,28,8,'2024-01-03'),
(14,3,4,35,8,'2024-01-07'),
(15,3,5,18,8,'2024-01-05'),
(16,4,1,25,10,'2024-01-08'),
(17,4,2,19,10,'2024-01-03'),
(18,4,3,30,10,'2024-01-02'),
(19,4,4,15,10,'2024-01-06'),
(20,4,5,22,10,'2024-01-07'),
(21,5,1,60,30,'2024-01-04'),
(22,5,2,48,30,'2024-01-06'),
(23,5,3,35,30,'2024-01-03'),
(24,5,4,72,30,'2024-01-08'),
(25,5,5,50,30,'2024-01-02'),
(26,6,1,30,15,'2024-01-05'),
(27,6,2,27,15,'2024-01-04'),
(28,6,3,23,15,'2024-01-07'),
(29,6,4,34,15,'2024-01-06'),
(30,6,5,28,15,'2024-01-02'),
(31,7,1,45,20,'2024-01-03'),
(32,7,2,38,20,'2024-01-06'),
(33,7,3,30,20,'2024-01-05'),
(34,7,4,48,20,'2024-01-01'),
(35,7,5,40,20,'2024-01-07'),
(36,8,1,20,8,'2024-01-04'),
(37,8,2,33,8,'2024-01-05'),
(38,8,3,25,8,'2024-01-07'),
(39,8,4,18,8,'2024-01-02'),
(40,8,5,29,8,'2024-01-06'),
(41,9,1,26,10,'2024-01-05'),
(42,9,2,19,10,'2024-01-03'),
(43,9,3,35,10,'2024-01-06'),
(44,9,4,22,10,'2024-01-07'),
(45,9,5,30,10,'2024-01-01'),
(46,10,1,48,30,'2024-01-06'),
(47,10,2,35,30,'2024-01-04'),
(48,10,3,55,30,'2024-01-07'),
(49,10,4,38,30,'2024-01-02'),
(50,10,5,42,30,'2024-01-05'),
(51,11,1,28,25,'2024-01-03'),
(52,11,2,39,25,'2024-01-06'),
(53,11,3,33,25,'2024-01-05'),
(54,11,4,20,25,'2024-01-02'),
(55,11,5,44,25,'2024-01-07'),
(56,12,1,34,15,'2024-01-06'),
(57,12,2,26,15,'2024-01-02'),
(58,12,3,37,15,'2024-01-04'),
(59,12,4,28,15,'2024-01-03'),
(60,12,5,30,15,'2024-01-07'),
(61,13,1,23,8,'2024-01-05'),
(62,13,2,20,8,'2024-01-04'),
(63,13,3,27,8,'2024-01-07'),
(64,13,4,18,8,'2024-01-01'),
(65,13,5,22,8,'2024-01-03'),
(66,14,1,40,10,'2024-01-06'),
(67,14,2,33,10,'2024-01-02'),
(68,14,3,29,10,'2024-01-04'),
(69,14,4,20,10,'2024-01-07'),
(70,14,5,38,10,'2024-01-03'),
(71,15,1,50,30,'2024-01-02'),
(72,15,2,43,30,'2024-01-03'),
(73,15,3,55,30,'2024-01-07'),
(74,15,4,48,30,'2024-01-04'),
(75,15,5,60,30,'2024-01-06'),
(76,16,1,44,20,'2024-01-05'),
(77,16,2,35,20,'2024-01-07'),
(78,16,3,30,20,'2024-01-02'),
(79,16,4,48,20,'2024-01-06'),
(80,16,5,39,20,'2024-01-03'),
(81,17,1,20,10,'2024-01-06'),
(82,17,2,17,10,'2024-01-03'),
(83,17,3,22,10,'2024-01-05'),
(84,17,4,25,10,'2024-01-07'),
(85,17,5,29,10,'2024-01-02'),
(86,18,1,27,15,'2024-01-04'),
(87,18,2,36,15,'2024-01-06'),
(88,18,3,29,15,'2024-01-03'),
(89,18,4,22,15,'2024-01-07'),
(90,18,5,31,15,'2024-01-02'),
(91,19,1,15,10,'2024-01-05'),
(92,19,2,26,10,'2024-01-04'),
(93,19,3,19,10,'2024-01-03'),
(94,19,4,21,10,'2024-01-07'),
(95,19,5,30,10,'2024-01-01'),
(96,20,1,33,10,'2024-01-02'),
(97,20,2,26,10,'2024-01-05'),
(98,20,3,29,10,'2024-01-07'),
(99,20,4,20,10,'2024-01-03'),
(100,20,5,31,10,'2024-01-06'),
(101,21,1,51,30,'2024-01-05'),
(102,21,2,43,30,'2024-01-06'),
(103,21,3,36,30,'2024-01-07'),
(104,21,4,48,30,'2024-01-01'),
(105,21,5,44,30,'2024-01-02'),
(106,22,1,38,20,'2024-01-05'),
(107,22,2,31,20,'2024-01-07'),
(108,22,3,44,20,'2024-01-03'),
(109,22,4,36,20,'2024-01-04'),
(110,22,5,29,20,'2024-01-01'),
(111,23,1,22,8,'2024-01-02'),
(112,23,2,18,8,'2024-01-03'),
(113,23,3,25,8,'2024-01-07'),
(114,23,4,19,8,'2024-01-05'),
(115,23,5,21,8,'2024-01-04'),
(116,24,1,60,8,'2024-01-03'),
(117,24,2,52,8,'2024-01-06'),
(118,24,3,46,8,'2024-01-02'),
(119,24,4,55,8,'2024-01-07'),
(120,24,5,49,8,'2024-01-04'),
(121,25,1,35,10,'2024-01-06'),
(122,25,2,28,10,'2024-01-01'),
(123,25,3,34,10,'2024-01-03'),
(124,25,4,28,10,'2024-01-07'),
(125,25,5,32,10,'2024-01-05'),
(126,26,1,44,20,'2024-01-03'),
(127,26,2,37,20,'2024-01-06'),
(128,26,3,29,20,'2024-01-05'),
(129,26,4,32,20,'2024-01-04'),
(130,26,5,38,20,'2024-01-07'),
(131,27,1,58,30,'2024-01-01'),
(132,27,2,49,30,'2024-01-06'),
(133,27,3,41,30,'2024-01-05'),
(134,27,4,65,30,'2024-01-07'),
(135,27,5,59,30,'2024-01-03'),
(136,28,1,19,15,'2024-01-04'),
(137,28,2,26,15,'2024-01-06'),
(138,28,3,34,15,'2024-01-03'),
(139,28,4,22,15,'2024-01-07'),
(140,28,5,25,15,'2024-01-01'),
(141,29,1,33,20,'2024-01-03'),
(142,29,2,38,20,'2024-01-06'),
(143,29,3,29,20,'2024-01-04'),
(144,29,4,31,20,'2024-01-02'),
(145,29,5,36,20,'2024-01-07'),
(146,30,1,41,8,'2024-01-05'),
(147,30,2,33,8,'2024-01-03'),
(148,30,3,28,8,'2024-01-06'),
(149,30,4,35,8,'2024-01-02'),
(150,30,5,29,8,'2024-01-07');

-- Preview Of Tables
select * from customers;
select * from products;
select * from stores;
select * from orders;
select * from order_details;
select * from inventory;

-- counts of each table
select count(*) from customers;
select count(*) from products;
select count(*) from stores;
select count(*) from orders;
select count(*) from order_details;
select * from customers limit 10;

-- data cleaning process
-- checking null values
select * from customers where customer_id is null or customer_name is null or city is null or segment is null or registration_date is null;
select * from products where product_id is null or product_name is null or category is null or cost_price is null or selling_price is null;
select * from stores where store_id is null or store_name is null or city is null or state is null or  manager_name is null or opened_date is null;
select * from orders where order_id is null or customer_id is null or store_id is null or order_date is null or total_amount is null or payment_method is null;
select * from order_details where order_detail_id is null or order_id is null or product_id is null or quantity is null;
select * from inventory where inventory_id is null or product_id is null or store_id is null  or quantity_in_stock is null  or reorder_level is null or last_restock_date is null;

-- Total Sales Revenue
select sum(total_amount) as total_sales_revenue from orders;

-- Store Wise Total Sales
select s.store_name,sum(o.total_amount) as total_sales  from stores s join orders o on s.store_id=o.order_id group by s.store_name order by sum(o.total_amount);

-- Top 10 Customer by Spending
select c.customer_name,sum(o.total_amount)as customer_spending_amount from customers c join orders o on c.customer_id=o.customer_id group by c.customer_name order by customer_spending_amount desc limit 10;

-- Top 10 Best Selling Products
select p.product_name,sum(o.quantity)as total_quantity from products p join order_details o on p.product_id=o.product_id group by p.product_name order by total_quantity desc limit 10;

-- Category Wise Revenue
select p.category,sum(p.selling_price*o.quantity)as total_revenue from products p join order_details o on p.product_id=o.product_id group by p.category order by total_revenue desc;

-- Total Quantity Sold per Product
select p.product_name,sum(o.quantity)as total_quantity from products p join order_details o on p.product_id=o.product_id group by p.product_name order by total_quantity desc ;

-- Category Wise Total Quantity Sold
select p.category,sum(o.quantity)as total_quantity from products p join order_details o on p.product_id=o.product_id group by p.category order by total_quantity desc;

-- Highest Selling Product
select p.product_name,sum(o.quantity)as total_quantity from products p join order_details o on p.product_id=o.product_id group by p.product_name order by total_quantity desc limit 5;

-- Least Selling Product
select p.product_name,sum(o.quantity)as total_quantity from products p join order_details o on p.product_id=o.product_id group by p.product_name order by total_quantity asc limit 5;

-- Payment Method Mostly Used
select payment_method,count(*)as count_of_payment_method_used from orders group by payment_method order by count_of_payment_method_used desc limit 1;

-- Total Inventory Value
select sum(i.quantity_in_stock*p.cost_price)as Total_Inventory_Value from inventory i join products  p on i.product_id=p.product_id; 

-- Product wise Inventory Value
select p.product_name,sum(i.quantity_in_stock*p.cost_price)as Total_Inventory_Value from inventory i join products  p on i.product_id=p.product_id group by p.product_name  order by total_inventory_value desc ; 

-- Category wise Inventory Value
select p.category,sum(i.quantity_in_stock*p.cost_price)as Total_inventory_value from inventory i join products p on i.product_id=p.product_id group by p.category order by Total_inventory_value desc;

-- Low Stock Product
SELECT p.product_id,p.product_name,p.category,i.quantity_in_stock,i.reorder_level FROM inventory i JOIN products p  ON i.product_id = p.product_id WHERE i.quantity_in_stock < i.reorder_level;

-- Non Moving Products
select p.product_name from products p left join order_details o on p.product_id=o.product_id where o.product_id is null; 

-- Product Wise Profit
select p.product_name,sum((p.selling_price-p.cost_price)* o.quantity)as total_profit from products p join order_details o on p.product_id=o.product_id group by p.product_name order by total_profit desc;

-- Category Wise Profit
select p.category,sum((p.selling_price-p.cost_price)* o.quantity)as total_profit from products p join order_details o on p.product_id=o.product_id group by p.category order by total_profit desc;

-- Orders Did Each Customer Place
select c.customer_name,count(o.order_id)as total_orders from customers c join orders o on c.customer_id=o.customer_id group by c.customer_name order by total_orders desc;

-- Store Performance Comparison (Rank store based on Revenue)
select s.store_name,sum(o.total_amount)as total_revenue,dense_rank() over(order by sum(o.total_amount) desc) as rank_based_on_revenue from stores s join orders o on s.store_id=o.store_id group by s.store_name;  

