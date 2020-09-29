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