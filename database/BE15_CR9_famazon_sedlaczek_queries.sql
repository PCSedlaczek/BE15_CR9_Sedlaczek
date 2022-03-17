-- Number of registered users
SELECT 
  COUNT(*) AS "Users"
FROM user

-- User address
SELECT
  user.first_name AS "First name",
  user.last_name AS "Last name",
  user_address.address_line1 AS "Address",
  user_address.postal_code AS ZIP,
  user_address.city AS City,
  user_address.country AS Country,
  user.email AS "E-Mail address"
FROM user
JOIN user_address ON fk_user_id = user.id

-- Names & emails of users
SELECT 
  first_name AS "First name",
  last_name AS "Last name",
  email AS "E-Mail address"
FROM user

-- Users per provider
SELECT provider, COUNT(*)
FROM user_billing
GROUP BY provider

-- Invoice per provider
SELECT provider, COUNT(*)
FROM order_invoice
GROUP BY provider

-- Invoice per status
SELECT status, COUNT(*)
FROM order_invoice
GROUP BY status

-- Registered products
SELECT
  category.name AS Category,
  supplier.company AS Supplier,
  product.name AS Product,
  product.price AS Price
FROM product
JOIN category ON fk_category_id = category.id
JOIN supplier ON fk_supplier_id = supplier.id

-- Registered Discounts
SELECT
  supplier.company AS Supplier,
  product.name AS Product,
  product.price AS Price,
  discount.name AS Discount,
  discount.percent AS Percent,
  discount.active AS Active
FROM product
JOIN supplier ON fk_supplier_id = supplier.id
JOIN discount ON fk_discount_id = discount.id
