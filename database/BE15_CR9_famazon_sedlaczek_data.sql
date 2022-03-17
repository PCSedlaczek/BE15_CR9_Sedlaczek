INSERT INTO user (username, first_name, last_name, email) VALUES
("johndoe","John","Doe","johndoe@mail.com"),
("janedoe","Jane","Doe","janedoe@mail.com"),
("jilldoe","Jill","Doe","jilldoe@mail.com");

INSERT INTO user_address (fk_user_id, address_line1, city, postal_code, country) VALUES
(1,"Kirchenplatz 6/8/1","Vienna","1230","Austria"),
(2,"Degengasse 70/3/1B","Vienna","1160","Austria"),
(3,"Saileräckerg 47","Vienna","1190","Austria");

INSERT INTO user_billing (fk_user_id, pay_type, account_no, expiry) VALUES
(1,"PayPal", NULL, NULL),
(2,"Credit Card", "1234 5678 9012 3456", "2025-12-31"),
(3,"Invoice", NULL, NULL);

INSERT INTO supplier (company, country, city) VALUES
("Apple","Austria","Vienna"),
("Logitech","Austria","Vienna"),
("JVC","Austria","Vienna");

INSERT INTO shipper (company, country, city) VALUES
("BSS Logistik","Austria","Hütendorf/Mistelbach"),
("DHL","Germany","Bonn"),
("UPS","Austria","Vienna");

INSERT INTO inventory (quantity, warehouse) VALUES
(20, 1),
(30, 2),
(40, 3);

INSERT INTO category (name) VALUES
("Phones"),
("Keyboards"),
("Headphones");

INSERT INTO discount (percent, name, active) VALUES
(5,"5 percent off",true),
(10,"10 percent off",false),
(15,"15 percent off",false);

INSERT INTO product (fk_category_id, fk_supplier_id. fk_inventory_id, name, price, fk_discount_id, image) VALUES
(1, 1, 1, "iPhone SE 64GB", 463.85, 2, "../images/81nld4NtAkL._AC_SL1500_.jpg"),
(2, 2, 2, "Bluetooth Illuminated Keyboard K810", 79.99, 3, "../images/71jr6psIRdL._AC_SL1500_.jpg"),
(3, 3, 3, "HA-S160-B-EF On-Ear Headphones Black", 12.21, 1, "../images/61lHZRiuWKL._AC_SL1500_.jpg");

INSERT INTO cart_session (fk_user_id, total) VALUES
(1, 462.85),
(2, 79.99),
(3, 12.21);

INSERT INTO cart_item (fk_session_id, fk_product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

INSERT INTO order_details (fk_user_id, fk_invoice_no, total) VALUES
(1, 1, 462.85),
(2, 2, 79.99),
(3, 3, 12.21);

INSERT INTO order_invoice (fk_order_id, amount, status) VALUES
(1, 462.85, "billed"),
(2, 79.99, "paid"),
(3, 12.21, "overdue");

INSERT INTO order_items (fk_order_id, fk_product_id, fk_shipper_id,quantity) VALUES
(1,1,1,1),
(2,2,2,1),
(3,3,3,1);

