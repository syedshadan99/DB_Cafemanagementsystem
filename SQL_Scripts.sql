CREATE DATABASE DB_project;
use DB_project;

CREATE TABLE cafes (
    cafe_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO cafes VALUES
(1, 'Brew & Bean', 'Ali Khan', 'ali@brewbean.com', '03001234567', '123 Main Street', 'Lahore'),
(2, 'Café Aroma', 'Sara Iqbal', 'sara@aroma.pk', '03111234567', '456 Central Plaza', 'Karachi'),
(3, 'Chai Shai', 'Bilal Mehmood', 'bilal@chaishai.pk', '03211231234', '78 Mall Road', 'Islamabad'),
(4, 'Coffee Corner', 'Zara Khalid', 'zara@coffeecorner.pk', '03451234567', '19 Gulberg', 'Lahore'),
(5, 'Tea Time', 'Naveed Aslam', 'naveed@teatime.pk', '03551231234', '88 Liberty Market', 'Lahore'),
(6, 'Sip & Bite', 'Rida Farooq', 'rida@sipbite.pk', '03014567890', '44 F-6', 'Islamabad'),
(7, 'Daily Grind', 'Usman Tariq', 'usman@dailygrind.pk', '03336789012', '12 Clifton', 'Karachi'),
(8, 'Mug Mug', 'Hina Sohail', 'hina@mugmug.pk', '03451230000', '89 Commercial Area', 'Rawalpindi'),
(9, 'Cafe Dastaan', 'Tariq Shah', 'tariq@dastaan.pk', '03210009988', '45 MM Alam', 'Lahore'),
(10, 'Latte Lounge', 'Asma Bashir', 'asma@lounge.pk', '03667890021', '23 University Road', 'Peshawar'),
(11, 'Bean Square', 'Fahad Anwar', 'fahad@beansquare.pk', '03211221122', '11 Phase 6', 'Lahore'),
(12, 'Roast House', 'Zainab Raza', 'zainab@roasthouse.pk', '03004566778', '55 G-8', 'Islamabad');

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO customers VALUES
(1, 'Ahmed Ali', '03211234567', 'ahmed.ali@gmail.com'),
(2, 'Fatima Zahra', '03331234567', 'fatima.zahra@yahoo.com'),
(3, 'Saad Khan', '03451234567', 'saad.khan@hotmail.com'),
(4, 'Mariam Bukhari', '03001234567', 'mariam.bukhari@gmail.com'),
(5, 'Umar Farooq', '03151234567', 'umar.f@gmail.com'),
(6, 'Rida Malik', '03219876543', 'rida.m@pk.com'),
(7, 'Hassan Tariq', '03337654321', 'h.tariq@live.com'),
(8, 'Ayesha Usman', '03459874561', 'ayesha.u@gmail.com'),
(9, 'Bilal Ahmed', '03557894561', 'bilal.a@yahoo.com'),
(10, 'Zoya Jamil', '03669874523', 'zoya.j@gmail.com'),
(11, 'Taha Siddiqui', '03761234567', 'taha.sid@hotmail.com'),
(12, 'Ibrahim Naveed', '03869874567', 'ibrahim.naveed@gmail.com');

CREATE TABLE menu_categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO menu_categories VALUES
(1, 'Coffee'),
(2, 'Tea'),
(3, 'Snacks'),
(4, 'Desserts'),
(5, 'Breakfast'),
(6, 'Juices'),
(7, 'Shakes'),
(8, 'Burgers'),
(9, 'Pasta'),
(10, 'Wraps'),
(11, 'Pizza'),
(12, 'Salads');

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    cafe_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE
);

INSERT INTO staff VALUES
(1, 1, 'Ahmed Raza', 'Barista', '2023-05-01'),
(2, 1, 'Fatima Noor', 'Manager', '2022-12-15'),
(3, 2, 'Zain Malik', 'Chef', '2023-01-10'),
(4, 2, 'Ali Imran', 'Waiter', '2023-02-01'),
(5, 3, 'Sana Tariq', 'Barista', '2023-03-12'),
(6, 4, 'Noman Khan', 'Cashier', '2023-01-25'),
(7, 5, 'Nida Shah', 'Waitress', '2022-11-11'),
(8, 6, 'Hassan Abbas', 'Manager', '2023-04-05'),
(9, 7, 'Maryam Javed', 'Chef', '2023-03-20'),
(10, 8, 'Waqas Khan', 'Barista', '2023-02-28'),
(11, 9, 'Uzair Ali', 'Barista', '2023-03-01'),
(12, 10, 'Hiba Saeed', 'Waitress', '2023-01-30');

CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    cafe_id INT NOT NULL,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES menu_categories(category_id) ON DELETE CASCADE
);

INSERT INTO menu_items VALUES
(1, 1, 1, 'Espresso', 300.00),
(2, 1, 1, 'Latte', 350.00),
(3, 2, 2, 'Karak Chai', 200.00),
(4, 2, 3, 'Club Sandwich', 500.00),
(5, 3, 4, 'Chocolate Cake', 450.00),
(6, 4, 1, 'Cappuccino', 370.00),
(7, 5, 2, 'Green Tea', 250.00),
(8, 6, 3, 'Fries', 300.00),
(9, 7, 5, 'Omelette', 400.00),
(10, 8, 3, 'Paratha Roll', 350.00),
(11, 9, 1, 'Mocha', 380.00),
(12, 10, 4, 'Brownie', 320.00);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cafe_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE NO ACTION
);

INSERT INTO orders VALUES
(1, 1, 1, '2024-06-01', 650.00),
(2, 2, 2, '2024-06-02', 700.00),
(3, 3, 3, '2024-06-03', 450.00),
(4, 4, 4, '2024-06-04', 370.00),
(5, 5, 5, '2024-06-05', 250.00),
(6, 6, 6, '2024-06-06', 300.00),
(7, 7, 7, '2024-06-07', 400.00),
(8, 8, 8, '2024-06-08', 350.00),
(9, 9, 9, '2024-06-09', 380.00),
(10, 10, 10, '2024-06-10', 320.00),
(11, 11, 11, '2024-06-11', 300.00),
(12, 12, 12, '2024-06-12', 500.00);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id) ON DELETE NO ACTION
);

INSERT INTO order_items VALUES
(1, 1, 1, 1, 300.00),
(2, 1, 2, 1, 350.00),
(3, 2, 3, 2, 400.00),
(4, 2, 4, 1, 300.00),
(5, 3, 5, 1, 450.00),
(6, 4, 6, 1, 370.00),
(7, 5, 7, 1, 250.00),
(8, 6, 8, 1, 300.00),
(9, 7, 9, 1, 400.00),
(10, 8, 10, 1, 350.00),
(11, 9, 11, 1, 380.00),
(12, 10, 12, 1, 320.00);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

INSERT INTO payments VALUES
(1, 1, 650.00, 'Cash'),
(2, 2, 700.00, 'Card'),
(3, 3, 450.00, 'JazzCash'),
(4, 4, 370.00, 'Card'),
(5, 5, 250.00, 'Cash'),
(6, 6, 300.00, 'Easypaisa'),
(7, 7, 400.00, 'Cash'),
(8, 8, 350.00, 'Card'),
(9, 9, 380.00, 'Card'),
(10, 10, 320.00, 'Cash'),
(11, 11, 300.00, 'JazzCash'),
(12, 12, 500.00, 'Cash');

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    cafe_id INT NOT NULL,
    rating INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE
);

INSERT INTO reviews VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 3, 3, 3),
(4, 4, 4, 5),
(5, 5, 5, 4),
(6, 6, 6, 3),
(7, 7, 7, 5),
(8, 8, 8, 4),
(9, 9, 9, 5),
(10, 10, 10, 4),
(11, 11, 11, 5),
(12, 12, 12, 4);

CREATE TABLE shifts (
    shift_id INT PRIMARY KEY,
    staff_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

INSERT INTO shifts VALUES
(1, 1, '2024-06-01 08:00', '2024-06-01 16:00'),
(2, 2, '2024-06-01 09:00', '2024-06-01 17:00'),
(3, 3, '2024-06-01 10:00', '2024-06-01 18:00'),
(4, 4, '2024-06-02 08:00', '2024-06-02 16:00'),
(5, 5, '2024-06-02 09:00', '2024-06-02 17:00'),
(6, 6, '2024-06-03 08:00', '2024-06-03 16:00'),
(7, 7, '2024-06-03 09:00', '2024-06-03 17:00'),
(8, 8, '2024-06-04 10:00', '2024-06-04 18:00'),
(9, 9, '2024-06-04 08:00', '2024-06-04 16:00'),
(10, 10, '2024-06-05 09:00', '2024-06-05 17:00'),
(11, 11, '2024-06-05 10:00', '2024-06-05 18:00'),
(12, 12, '2024-06-06 08:00', '2024-06-06 16:00');

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

INSERT INTO suppliers VALUES
(1, 'Fresh Beans Ltd.', '03001234567'),
(2, 'Tea Traders Co.', '03111234567'),
(3, 'SnackSupplies PK', '03211234567'),
(4, 'Dessert World', '03331234567'),
(5, 'Morning Foods', '03441234567'),
(6, 'Fruit Suppliers', '03551234567'),
(7, 'Meat Market', '03661234567'),
(8, 'Dairy House', '03771234567'),
(9, 'Wrap & Roll', '03881234567'),
(10, 'Pizza Base Co.', '03991234567'),
(11, 'Veggie Mart', '03110001122'),
(12, 'Burger King Suppliers', '03220002233');

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    cafe_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE
);

INSERT INTO inventory VALUES
(1, 1, 'Coffee Beans', 50),
(2, 2, 'Tea Leaves', 40),
(3, 3, 'Flour', 30),
(4, 4, 'Sugar', 60),
(5, 5, 'Milk', 80),
(6, 6, 'Eggs', 100),
(7, 7, 'Butter', 70),
(8, 8, 'Chicken', 45),
(9, 9, 'Vegetables', 90),
(10, 10, 'Juice Packs', 55),
(11, 11, 'Pizza Base', 35),
(12, 12, 'Lettuce', 25);
