-- #1. Get all the customers and their addresses.
  SELECT * FROM "customers"
  JOIN "addresses"
    ON "addresses"."customer_id" = "customers"."id";

-- #2. Get all orders and their line items (orders, quantity and product).
  SELECT * FROM "orders"
  JOIN "line_items"
    ON "orders"."id" = "line_items"."order_id"
  JOIN "products"
    ON "line_items"."product_id" = "products"."id";

-- #3. Which warehouses have cheetos?
  SELECT * FROM "warehouse"
  JOIN "warehouse_product"
    ON "warehouse"."id" = "warehouse_product"."warehouse_id"
  JOIN "products"
    ON "products"."id" = "warehouse_product"."product_id"
  WHERE "product_id" = 5;

-- #4. Which warehouses have diet pepsi?
  SELECT * FROM "warehouse"
  JOIN "warehouse_product"
    ON "warehouse"."id" = "warehouse_product"."warehouse_id"
  JOIN "products"
    ON "products"."id" = "warehouse_product"."product_id"
  WHERE "product_id" = 6;

-- #5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
  SELECT "customers"."first_name", "customers"."last_name", COUNT("orders"."id") FROM "orders"
  JOIN "addresses"
    on "orders"."address_id" = "addresses"."id"
  JOIN "customers"
    on "addresses"."customer_id" = "customers"."id"
  GROUP BY "customers"."id";

-- #6. How many customers do we have?
  SELECT COUNT(*) FROM "customers";

-- #7. How many products do we carry?
  SELECT COUNT(*) FROM "products";

-- #8. What is the total available on-hand quantity of diet pepsi?
  SELECT SUM("warehouse_product"."on_hand") FROM "products"
  JOIN "warehouse_product"
    on "warehouse_product"."product_id" = "products"."id"
  WHERE "products"."description" = 'diet pepsi';

-- #9. How much was the total cost for each order?
