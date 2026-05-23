-- BestBuy Database Population Script
-- Order matters: parents before children (FK constraints)
INSERT INTO store (storeID) VALUES
(1),  -- BM: Los Angeles, CA
(2),  -- BM: New York, NY
(3),  -- BM: Chicago, IL
(4),  -- BM: Houston, TX
(5),  -- BM: Seattle, WA
(6);  -- Webstore


-- BM (Brick & Mortar) -- different states for "by state" query
INSERT INTO BM (storeID, address, city, state) VALUES
(1, '1201 Best Buy Blvd',  'Los Angeles', 'CA'),
(2, '450 Tech Ave',        'New York',    'NY'),
(3, '800 Gadget Rd',       'Chicago',     'IL'),
(4, '999 Electronics Way', 'Houston',     'TX'),
(5, '300 Pacific St',      'Seattle',     'WA');


INSERT INTO webstore (storeID, URL) VALUES
(6, 'https://www.bestbuy.com');

INSERT INTO vendors (vendorID, name, email) VALUES
(1, 'Samsung Electronics', 'orders@samsung.com'),
(2, 'Sony Corporation',    'supply@sony.com'),
(3, 'LG Electronics',      'vendors@lg.com'),
(4, 'Apple Inc',           'orders@apple.com'),
(5, 'Dyson Ltd',           'supply@dyson.com'),
(6, 'Mattel Inc',          'orders@mattel.com'),
(7, 'IKEA',                'supply@ikea.com');

INSERT INTO discount (discountID, amount) VALUES
(1, 50),
(2, 100),
(3, 25),
(4, 200),
(5, 10);

INSERT INTO product (productID, vendorID, discountID, price, name) VALUES
-- Electronics
(1,  1, 2,   999.99, 'Samsung 65 QLED TV'),
(2,  2, 1,   249.99, 'Sony WH-1000XM5 Headphones'),
(3,  4, 2,  1099.99, 'Apple MacBook Air M2'),
(4,  1, 1,   599.99, 'Samsung Galaxy Tab S9'),
(5,  2, NULL, 399.99, 'Sony PlayStation 5'),
(6,  4, NULL, 999.99, 'Apple iPhone 15'),
(7,  1, 3,   299.99, 'Samsung 27in Monitor'),
(8,  2, NULL, 149.99, 'Sony Soundbar'),
-- Appliances
(9,  3, 4,  1299.99, 'LG French Door Refrigerator'),
(10, 3, 2,   799.99, 'LG Washer and Dryer Set'),
(11, 5, 1,   499.99, 'Dyson V15 Vacuum'),
(12, 3, NULL, 349.99, 'LG Dishwasher'),
-- Toys
(13, 6, NULL,  49.99, 'LEGO Star Wars Millennium Falcon'),
(14, 6, 3,     29.99, 'Barbie Dreamhouse'),
(15, 6, NULL,  19.99, 'Hot Wheels 20 Car Pack'),
(16, 6, 5,     59.99, 'LEGO Technic Ferrari'),
-- Furniture
(17, 7, 3,   799.99, 'Herman Miller Aeron Chair'),
(18, 7, NULL, 299.99, 'IKEA Standing Desk'),
(19, 7, 2,   199.99, 'IKEA 3 Shelf Bookcase'),
(20, 7, NULL, 499.99, 'IKEA Sectional Sofa');

INSERT INTO electronics (productID, watts) VALUES
(1,  150),
(2,    5),
(3,   30),
(4,   15),
(5,   75),
(6,    5),
(7,   45),
(8,   60);

INSERT INTO appliances (productID, brand) VALUES
(9,  'LG'),
(10, 'LG'),
(11, 'Dyson'),
(12, 'LG');

INSERT INTO toys (productID, age) VALUES
(13, 9),
(14, 3),
(15, 3),
(16, 10);

INSERT INTO furniture (productID, size) VALUES
(17, 'Large'),
(18, 'Medium'),
(19, 'Medium'),
(20, 'Large');

INSERT INTO inventory (productID, storeID) VALUES
-- Samsung TV at 4 stores
(1,1),(1,2),(1,3),(1,6),
-- Sony Headphones at 3 stores
(2,1),(2,4),(2,6),
-- MacBook at 3 stores
(3,2),(3,5),(3,6),
-- Galaxy Tab at 3 stores
(4,1),(4,3),(4,6),
-- PS5 at all physical stores + web
(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),
-- iPhone at all stores
(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),
-- Monitor at 2 stores
(7,2),(7,5),
-- Soundbar at 2 stores
(8,1),(8,3),
-- LG Fridge at 3 stores
(9,2),(9,4),(9,6),
-- LG Washer at 2 stores
(10,3),(10,5),
-- Dyson Vacuum at 3 stores
(11,1),(11,2),(11,6),
-- LG Dishwasher at 2 stores
(12,4),(12,5),
-- LEGO Millennium Falcon everywhere
(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),
-- Barbie at 3 stores
(14,1),(14,3),(14,5),
-- Hot Wheels at 4 stores
(15,1),(15,2),(15,4),(15,6),
-- LEGO Technic at 3 stores
(16,2),(16,3),(16,6),
-- Herman Miller Chair at 2 stores
(17,1),(17,5),
-- Standing Desk at 3 stores
(18,2),(18,4),(18,6),
-- Bookcase at 2 stores
(19,3),(19,6),
-- Sofa at 2 stores
(20,1),(20,4);

-- 12. CUSTOMER (parent of member + guest)
INSERT INTO customer (customerID) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15);


--  MEMBER (customers 1-10)
INSERT INTO member (customerID, name, email) VALUES
(1,  'Alice Johnson',   'alice@gmail.com'),
(2,  'Bob Smith',       'bob@yahoo.com'),
(3,  'Carlos Rivera',   'carlos@gmail.com'),
(4,  'Diana Chen',      'diana@outlook.com'),
(5,  'Ethan Brown',     'ethan@gmail.com'),
(6,  'Fatima Malik',    'fatima@gmail.com'),
(7,  'George Kim',      'george@yahoo.com'),
(8,  'Hannah Patel',    'hannah@outlook.com'),
(9,  'Ivan Okafor',     'ivan@gmail.com'),
(10, 'Julia Torres',    'julia@gmail.com');


-- GUEST (customers 11-15, anonymous)
INSERT INTO guest (customerID) VALUES
(11),(12),(13),(14),(15);


INSERT INTO payment (paymentID, payment_type) VALUES
(1, 'Credit Card'),
(2, 'Debit Card'),
(3, 'PayPal'),
(4, 'Gift Card');


-- ORDERS (spread across stores, customers, dates in 2025)
INSERT INTO orders (orderID, orderDate, storeID, customerID) VALUES
(1,  '2025-01-05', 1, 1),
(2,  '2025-01-12', 2, 2),
(3,  '2025-01-20', 3, 3),
(4,  '2025-01-28', 4, 4),
(5,  '2025-02-03', 5, 5),
(6,  '2025-02-10', 6, 6),
(7,  '2025-02-14', 1, 7),
(8,  '2025-02-20', 2, 8),
(9,  '2025-02-25', 3, 9),
(10, '2025-03-01', 4, 10),
(11, '2025-03-05', 5, 11),
(12, '2025-03-10', 6, 12),
(13, '2025-03-15', 1, 1),
(14, '2025-03-18', 2, 3),
(15, '2025-03-22', 3, 5),
(16, '2025-03-28', 4, 2),
(17, '2025-04-02', 5, 4),
(18, '2025-04-05', 6, 6),
(19, '2025-04-10', 1, 8),
(20, '2025-04-15', 2, 9),
(21, '2025-04-18', 3, 10),
(22, '2025-04-20', 4, 1),
(23, '2025-04-22', 5, 2),
(24, '2025-04-25', 6, 3),
(25, '2025-04-28', 1, 13),
(26, '2025-04-30', 2, 14),
(27, '2025-05-01', 3, 15),
(28, '2025-05-02', 4, 7),
(29, '2025-05-03', 5, 8),
(30, '2025-05-04', 6, 9);


--  ORDER_ITEM (this drives ALL 5 required queries — most important table)
-- Note: no price_paid column, price lives in product table
INSERT INTO order_item (orderID, productID, quantity) VALUES
-- Order 1 (Store 1 / LA): TV + Headphones
(1, 1, 89), (1, 2, 120),
-- Order 2 (Store 2 / NY): MacBook + iPhone
(2, 3, 195), (2, 6, 822),
-- Order 3 (Store 3 / Chicago): PS5 + Soundbar
(3, 5, 84), (3, 8, 43),
-- Order 4 (Store 4 / Houston): Fridge
(4, 9, 25),
-- Order 5 (Store 5 / Seattle): Vacuum + Washer
(5, 11, 37), (5, 10, 29),
-- Order 6 (Webstore): iPhone + MacBook
(6, 6, 1054), (6, 3, 769),
-- Order 7 (Store 1 / LA): PS5 + LEGO
(7, 5, 34), (7, 13, 58),
-- Order 8 (Store 2 / NY): Monitor + TV
(8, 7, 44), (8, 1, 32),
-- Order 9 (Store 3 / Chicago): Galaxy Tab + LEGO Technic
(9, 4, 68), (9, 16, 27),
-- Order 10 (Store 4 / Houston): iPhone + Hot Wheels
(10, 6, 678), (10, 15, 49),
-- Order 11 (Store 5 / Seattle): MacBook + Chair
(11, 3, 400), (11, 17, 147),
-- Order 12 (Webstore): TV + Standing Desk
(12, 1, 512), (12, 18, 88),
-- Order 13 (Store 1 / LA): iPhone + Barbie
(13, 6, 730), (13, 14, 95),
-- Order 14 (Store 2 / NY): PS5 + LEGO Falcon
(14, 5, 210), (14, 13, 143),
-- Order 15 (Store 3 / Chicago): Galaxy Tab + Bookcase
(15, 4, 175), (15, 19, 62),
-- Order 16 (Store 4 / Houston): Fridge + Dishwasher
(16, 9, 18), (16, 12, 22),
-- Order 17 (Store 5 / Seattle): Standing Desk + Vacuum
(17, 18, 74), (17, 11, 91),
-- Order 18 (Webstore): iPhone + LEGO Technic + Hot Wheels
(18, 6, 889), (18, 16, 204), (18, 15, 317),
-- Order 19 (Store 1 / LA): TV + Sofa
(19, 1, 67), (19, 20, 11),
-- Order 20 (Store 2 / NY): MacBook + Headphones
(20, 3, 340), (20, 2, 278),
-- Order 21 (Store 3 / Chicago): PS5 + Hot Wheels
(21, 5, 156), (21, 15, 88),
-- Order 22 (Store 4 / Houston): iPhone + Vacuum
(22, 6, 543), (22, 11, 64),
-- Order 23 (Store 5 / Seattle): Chair + Desk
(23, 17, 39), (23, 18, 55),
-- Order 24 (Webstore): TV + Headphones + LEGO Falcon
(24, 1, 423), (24, 2, 391), (24, 13, 267),
-- Order 25 (Store 1 / LA): PS5 + Barbie
(25, 5, 98), (25, 14, 134),
-- Order 26 (Store 2 / NY): iPhone + Monitor
(26, 6, 612), (26, 7, 83),
-- Order 27 (Store 3 / Chicago): LEGO Falcon + LEGO Technic
(27, 13, 189), (27, 16, 112),
-- Order 28 (Store 4 / Houston): Sofa + Fridge
(28, 20, 8), (28, 9, 31),
-- Order 29 (Store 5 / Seattle): MacBook + Vacuum
(29, 3, 287), (29, 11, 76),
-- Order 30 (Webstore): iPhone + Galaxy Tab + Bookcase
(30, 6, 947), (30, 4, 388), (30, 19, 145);


-- ORDER_PAYMENT
INSERT INTO order_payment (orderID, paymentID, total) VALUES
(1,  1, 1249.98),
(2,  2, 2099.98),
(3,  1,  549.98),
(4,  3, 1299.99),
(5,  2, 1299.98),
(6,  1, 2099.98),
(7,  4,  1099.97),
(8,  2, 1299.98),
(9,  1,   949.98),
(10, 3, 2059.95),
(11, 1, 1899.98),
(12, 2, 1299.98),
(13, 1, 1029.98),
(14, 4, 1399.98),
(15, 1,   899.98),
(16, 2, 1649.98),
(17, 3, 1299.98),
(18, 1, 1229.95),
(19, 2, 1299.98),
(20, 1, 1349.98),
(21, 4,  1099.95),
(22, 1, 1499.98),
(23, 2, 1299.98),
(24, 3, 1499.96),
(25, 1,  1059.97),
(26, 2, 1149.98),
(27, 1,   229.96),
(28, 3, 1799.98),
(29, 4, 1599.98),
(30, 1, 2499.95);