SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_item oi
JOIN product p ON oi.productID = p.productID
GROUP BY oi.productID
ORDER BY total_sold DESC
LIMIT 20;

SELECT bm.state, p.name, SUM(oi.quantity) AS total_sold
FROM orders o
JOIN order_item oi ON o.orderID = oi.orderID
JOIN product p ON oi.productID = p.productID
JOIN BM bm ON o.storeID = bm.storeID
GROUP BY bm.state, p.productID
ORDER BY bm.state, total_sold DESC;

SELECT 
    o.storeID,
    COALESCE(bm.city, 'Online') AS store_name,
    SUM(op.total) AS total_sales
FROM orders o
JOIN order_payment op ON o.orderID = op.orderID
LEFT JOIN BM bm ON o.storeID = bm.storeID
WHERE YEAR(o.orderDate) = 2025
GROUP BY o.storeID
ORDER BY total_sales DESC
LIMIT 5;

SELECT 
    p.name AS product,
    SUM(oi.quantity) AS total_sold,
    COUNT(DISTINCT o.storeID) AS stores_sold_in
FROM orders o
JOIN order_item oi ON o.orderID = oi.orderID
JOIN product p ON oi.productID = p.productID
WHERE oi.productID IN (1, 6)
GROUP BY oi.productID;

SELECT p.name, SUM(oi.quantity) AS times_bought_together
FROM order_item oi
JOIN product p ON oi.productID = p.productID
WHERE oi.orderID IN (
    SELECT orderID FROM order_item WHERE productID = 5
)
AND oi.productID != 5
GROUP BY oi.productID
ORDER BY times_bought_together DESC
LIMIT 3;

SELECT 
    CASE 
        WHEN e.productID IS NOT NULL THEN 'Electronics'
        WHEN a.productID IS NOT NULL THEN 'Appliances'
        WHEN t.productID IS NOT NULL THEN 'Toys'
        WHEN f.productID IS NOT NULL THEN 'Furniture'
    END AS category,
    ROUND(SUM(oi.quantity * p.price)) AS total_revenue
FROM order_item oi
JOIN product p ON oi.productID = p.productID
LEFT JOIN electronics e ON p.productID = e.productID
LEFT JOIN appliances a ON p.productID = a.productID
LEFT JOIN toys t ON p.productID = t.productID
LEFT JOIN furniture f ON p.productID = f.productID
GROUP BY category
ORDER BY total_revenue DESC;

SELECT 
    DATE_FORMAT(o.orderDate, '%b') AS month,
    MONTH(o.orderDate) AS month_num,
    ROUND(SUM(op.total)) AS monthly_sales
FROM orders o
JOIN order_payment op ON o.orderID = op.orderID
GROUP BY month_num, month
ORDER BY month_num;

SELECT v.name AS vendor, SUM(oi.quantity) AS total_units
FROM order_item oi
JOIN product p ON oi.productID = p.productID
JOIN vendors v ON p.vendorID = v.vendorID
GROUP BY v.vendorID
ORDER BY total_units DESC;

SELECT 
    COALESCE(bm.city, 'Online') AS store_name,
    ROUND(AVG(op.total), 2) AS avg_order_value,
    COUNT(o.orderID) AS num_orders
FROM orders o
JOIN order_payment op ON o.orderID = op.orderID
LEFT JOIN BM bm ON o.storeID = bm.storeID
GROUP BY o.storeID
ORDER BY avg_order_value DESC;