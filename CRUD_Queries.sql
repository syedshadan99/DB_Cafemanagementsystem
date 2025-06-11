
INSERT INTO customers (customer_id, name, phone, email)
VALUES (13, 'Shayan Rafiq', '03001112222', 'shayan.rafiq@mail.com');

INSERT INTO orders (order_id, cafe_id, customer_id, order_date, total_amount)
VALUES (13, 1, 13, '2024-06-13', 650.00);

INSERT INTO order_items (order_item_id, order_id, item_id, quantity, price)
VALUES 
(13, 13, 1, 1, 300.00),
(14, 13, 2, 1, 350.00);

INSERT INTO payments (payment_id, order_id, amount, method)
VALUES (13, 13, 650.00, 'Card');

-- Add a new menu item to 'Snacks' for Cafe ID 1
INSERT INTO menu_items (item_id, cafe_id, category_id, name, price)
VALUES (13, 1, 3, 'Garlic Bread', 280.00);

-- Insert a new shift for an existing staff
INSERT INTO shifts (shift_id, staff_id, start_time, end_time)
VALUES (13, 2, '2024-06-10 14:00', '2024-06-10 22:00');

-- Add a new inventory item for cafe_id = 1
INSERT INTO inventory (inventory_id, cafe_id, item_name, quantity)
VALUES (13, 1, 'Cups', 100);

-- All cafes in Lahore with their owner and number of staff
SELECT c.name AS Cafe_Name, c.owner_name, COUNT(s.staff_id) AS Staff_Count
FROM cafes c
LEFT JOIN staff s ON c.cafe_id = s.cafe_id
WHERE c.city = 'Lahore'
GROUP BY c.name, c.owner_name;

-- Orders above Rs. 500 with customer and payment method
SELECT o.order_id, cu.name AS Customer, o.total_amount, p.method AS Payment_Method
FROM orders o
JOIN customers cu ON o.customer_id = cu.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE o.total_amount > 500;

-- Average rating of each cafe
SELECT c.name AS Cafe_Name, ROUND(AVG(r.rating), 2) AS Avg_Rating
FROM cafes c
JOIN reviews r ON c.cafe_id = r.cafe_id
GROUP BY c.name
ORDER BY Avg_Rating DESC;

-- Staff working morning shifts (before 9 AM)
SELECT s.name AS Staff_Name, s.role, CONVERT(TIME, sh.start_time) AS Start_Time
FROM staff s
JOIN shifts sh ON s.staff_id = sh.staff_id
WHERE CONVERT(TIME, sh.start_time) < '09:00:00';

-- Cafes with more than 1 order placed
SELECT c.name AS Cafe_Name, COUNT(o.order_id) AS Orders_Count
FROM cafes c
JOIN orders o ON c.cafe_id = o.cafe_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;

-- Customers who paid using Easypaisa or JazzCash
SELECT cu.name, p.method
FROM customers cu
JOIN orders o ON cu.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.method IN ('Easypaisa', 'JazzCash');

-- Inventory items running low (quantity < 40)
SELECT c.name AS Cafe_Name, i.item_name, i.quantity
FROM inventory i
JOIN cafes c ON i.cafe_id = c.cafe_id
WHERE i.quantity < 40;

-- Most expensive item in each category
SELECT mc.name AS Category, mi.name AS Item, MAX(mi.price) AS Max_Price
FROM menu_items mi
JOIN menu_categories mc ON mi.category_id = mc.category_id
GROUP BY mc.name, mi.name
ORDER BY Max_Price DESC;

-- Update customer phone number
UPDATE customers
SET phone = '03112223344'
WHERE name = 'Fatima Zahra';

-- Increase price of all Coffee items by 10%
UPDATE menu_items
SET price = price * 1.10
WHERE category_id = (SELECT category_id FROM menu_categories WHERE name = 'Coffee');

-- Promote staff member to Manager
UPDATE staff
SET role = 'Manager'
WHERE name = 'Ali Imran' AND cafe_id = 2;

-- Refill inventory item for 'Flour' at Cafe ID 3
UPDATE inventory
SET quantity = quantity + 20
WHERE cafe_id = 3 AND item_name = 'Flour';

-- Delete reviews with rating < 4
DELETE FROM reviews
WHERE rating < 4;

-- Remove menu item that is no longer available
DELETE FROM menu_items
WHERE name = 'Green Tea' AND cafe_id = 5;

-- Delete customers who haven’t placed any orders
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);

-- Delete a shift record that was added mistakenly
DELETE FROM shifts
WHERE shift_id = 13;
