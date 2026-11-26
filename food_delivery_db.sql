create database food_delivery_db;
use food_delivery_db;

CREATE TABLE DIM_CUSTOMERS(
CUSTOMER_ID INT primary key,
CUSTOMER_AGE INT NOT NULL,
CUSTOMER_GENDER VARCHAR(20),
CUSTOMER_AREA VARCHAR(50)
);

CREATE TABLE DIM_restaurantS(
restaurant_ID INT primary key,
restaurant_name VARCHAR(100) NOT NULL,
restaurant_area  VARCHAR(500) NOT NULL,
restaurant_cuisine  VARCHAR(100) NOT NULL,
restaurant_rating  decimal(2,1) 
);

CREATE TABLE DIM_ITEMS(
item_id  INT primary KEY,
restaurant_id INT NOT NULL,
item_name  VARCHAR(50) NOT NULL,
category  VARCHAR(50) NOT NULL
);

CREATE TABLE DIM_DATE(
DATE DATE NOT NULL unique,
DATE_ID INT primary KEY,
YEAR INT NOT NULL,
MONTH INT NOT NULL,
MONTH_NAME VARCHAR(20) NOT NULL,
DAY INT NOT NULL,
DAY_NAME VARCHAR(20) NOT NULL,
quarter INT NOT NULL 
);

CREATE TABLE FACT_ORDERS(
ORDER_ID VARCHAR(20) primary KEY,
DATE_ID INT NOT NULL,
customer_id INT NOT NULL,
restaurant_id  INT NOT NULL,
order_ts  datetime not null,
discount  decimal(10,2) not null,
delivery_fee  DECIMAL(10,2) not null,
packaging_fee DECIMAL(10,2) NOT NULL,
gst decimal(5,2),
tip DECIMAL(10,2) NOT NULL,
final_amount decimal(12,2) NOT NULL,
estimated_delivery_min  INT,
actual_delivery_min INT,
order_status VARCHAR(20),
payment_method VARCHAR(20),
food_rating decimal(2,1),
delivery_rating decimal(2,1),

constraint CNK_DATE_ID foreign key(DATE_ID) references DIM_DATE(DATE_ID),
constraint CN_restaurant_id foreign key(restaurant_id) references DIM_restaurantS(restaurant_id),
constraint CNK_customer_id foreign key(customer_id) references DIM_customerS(customer_id)
);

create TABLE FACT_ORDER_ITEMS(
order_item_id VARCHAR(20) primary KEY,
order_id VARCHAR(20) NOT NULL,
item_id INT NOT NULL,
quantity INT NOT NULL,
unit_price decimal(10,2) NOT NULL,
line_subtotal decimal(12,2) NOT NULL,

constraint CNK_ORDER_ID foreign key(order_id) references FACT_ORDERS(order_id),
constraint CNK_item_id foreign key(item_id) references DIM_ITEMS(item_id)
);
ALTER TABLE DIM_DATE
ADD CONSTRAINT UQ_FULL_DATE UNIQUE (DATE);


SELECT 'DIM_CUSTOMERS' AS table_name, COUNT(*) AS total_rows
FROM DIM_CUSTOMERS
UNION ALL
SELECT 'DIM_RESTAURANTS', COUNT(*)
FROM DIM_RESTAURANTS
UNION ALL
SELECT 'DIM_ITEMS', COUNT(*)
FROM DIM_ITEMS
UNION ALL
SELECT 'DIM_DATE', COUNT(*)
FROM DIM_DATE
UNION ALL
SELECT 'FACT_ORDERS', COUNT(*)
FROM FACT_ORDERS
UNION ALL
SELECT 'FACT_ORDER_ITEMS', COUNT(*)
FROM FACT_ORDER_ITEMS;

-- Orders → Restaurants
SELECT COUNT(*) AS orphan_restaurants
FROM FACT_ORDERS o
LEFT JOIN DIM_RESTAURANTS r
    ON o.restaurant_id = r.restaurant_id
WHERE r.restaurant_id IS NULL;

-- Orders → Dates
SELECT COUNT(*) AS orphan_dates
FROM FACT_ORDERS o
LEFT JOIN DIM_DATE d
    ON o.date_id = d.date_id
WHERE d.date_id IS NULL;

-- Order items → Orders
SELECT COUNT(*) AS orphan_orders
FROM FACT_ORDER_ITEMS oi
LEFT JOIN FACT_ORDERS o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Order items → Items
SELECT COUNT(*) AS orphan_items
FROM FACT_ORDER_ITEMS oi
LEFT JOIN DIM_ITEMS i
    ON oi.item_id = i.item_id
WHERE i.item_id IS NULL;