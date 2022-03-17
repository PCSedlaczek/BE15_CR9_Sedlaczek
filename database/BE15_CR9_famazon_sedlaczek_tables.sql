-- 1. User Management

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR (64),
  first_name VARCHAR (35),
  last_name VARCHAR (35),
  pwd TEXT,
  email VARCHAR (255)
);

CREATE TABLE user_address (
  address_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fk_user_id INT,
  address_line1 VARCHAR (95),
  address_line2 VARCHAR (95),
  city VARCHAR (45),
  postal_code VARCHAR (10),
  country VARCHAR (53),
  telephone VARCHAR (15),
  mobile VARCHAR (26),
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

CREATE TABLE user_billing (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fk_user_id INT,
  provider ENUM ('PayPal','Credit Card','Debit Card','Invoice'),
  account_no VARCHAR(20),
  expiry DATE,
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

-- 2. Product Management

CREATE TABLE supplier (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(30),
  country VARCHAR(53),
  city VARCHAR(45)
);

CREATE TABLE shipper (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(30),
  country VARCHAR(53),
  city VARCHAR(45)
);

CREATE TABLE inventory (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  warehouse INT
);

CREATE TABLE category (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  description TEXT
);

CREATE TABLE discount (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  description TEXT,
  percent DECIMAL,
  active BOOLEAN
);

CREATE TABLE product (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  description TEXT,
  barcode VARCHAR(20),
  price DECIMAL(10,2),
  image VARCHAR(50),
  fk_category_id INT,
  fk_inventory_id INT,
  fk_discount_id INT,
  fk_supplier_id INT,
  FOREIGN KEY (fk_category_id) REFERENCES category(id),
  FOREIGN KEY (fk_inventory_id) REFERENCES inventory(id),
  FOREIGN KEY (fk_discount_id) REFERENCES discount(id),
  FOREIGN KEY (fk_supplier_id) REFERENCES supplier(id)
);


-- 3. Shopping Process Management

CREATE TABLE cart_session (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fk_user_id INT,
  total DECIMAL(10,2),
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

CREATE TABLE cart_item (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  fk_session_id INT,
  fk_product_id INT,
  FOREIGN KEY (fk_session_id) REFERENCES cart_session(id),
  FOREIGN KEY (fk_product_id) REFERENCES product(id)
);

CREATE TABLE order_details (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  total DECIMAL(10,2),
  fk_user_id INT,
  fk_invoice_no INT,
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

CREATE TABLE order_invoice (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  amount DECIMAL(10,2),
  provider ENUM ('PayPal','Credit Card','Debit Card','Invoice'),
  status ENUM ('billed','paid','overdue'),
  fk_order_id INT,
  FOREIGN KEY (fk_order_id) REFERENCES order_details(id)
);

ALTER TABLE order_details
ADD FOREIGN KEY (fk_invoice_no) REFERENCES order_invoice(id)

CREATE TABLE order_items (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  fk_order_id INT,
  fk_product_id INT,
  fk_shipper_id INT,
  FOREIGN KEY (fk_order_id) REFERENCES order_details(id),
  FOREIGN KEY (fk_product_id) REFERENCES product(id),
  FOREIGN KEY (fk_shipper_id) REFERENCES shipper(id)
);