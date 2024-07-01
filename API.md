# This file covers all the currently available endpoins from our application

## Carts

### Create - POST `/carts`

#### Request Body

```json
{
  "customer_email": "user@email.com",
  "line_items_attributes": [
    {
      "product_id": 1,
      "quantity": 3
    }
  ]
}
```

#### Response

```json
{
  "id": "2206c809-d746-4a0d-8527-4ff48329c29f",
  "total_price": "14.97",
  "customer_email": null,
  "line_items": [
    {
      "quantity": 3,
      "unit_price": "4.99",
      "total_price": "14.97",
      "product": {
        "id": 1,
        "name": "Tea",
        "description": "A soothing beverage.",
        "sku": "TEA",
        "price": "4.99",
        "currency": "USD",
        "inventory": 5,
        "reserved": 3,
        "sold": 0
      }
    }
  ]
}
```

### Update - PUT `/carts/:cart_id`

For cart updates, each line item will either be created or updated.

To remove a line_item from the cart, its quantity should be equal to zero.

The customer email can be omitted when updating the cart.

#### Request Body

```json
{
  "line_items_attributes": [
    {
      "product_id": 1, // will be created if this product is not in the cart, or updated if it is already there
      "quantity": 3 // if zero, the item will be deleted from the cart.
    }
  ]
}
```

#### Response

```json
{
  "id": "2206c809-d746-4a0d-8527-4ff48329c29f",
  "total_price": "14.97",
  "customer_email": null,
  "line_items": [
    {
      "quantity": 3,
      "unit_price": "4.99",
      "total_price": "14.97",
      "product": {
        "id": 1,
        "name": "Tea",
        "description": "A soothing beverage.",
        "sku": "TEA",
        "price": "4.99",
        "currency": "USD",
        "inventory": 5,
        "reserved": 3,
        "sold": 0
      }
    }
  ]
}
```

### Show - GET `/carts/:cart_id`

#### Response

```json
{
  "id": "3852611c-bd4f-4945-8148-0f6234f4628e",
  "total_price": "48.93",
  "customer_email": null,
  "line_items": [
    {
      "quantity": 3,
      "unit_price": "6.99",
      "total_price": "20.97",
      "product": {
        "id": 31,
        "name": "Shampoo",
        "description": "Cleans and nourishes hair.",
        "sku": "SHAMPOO",
        "price": "6.99",
        "currency": "USD",
        "inventory": 7,
        "reserved": 3,
        "sold": 0
      }
    },
    {
      "quantity": 4,
      "unit_price": "6.99",
      "total_price": "27.96",
      "product": {
        "id": 32,
        "name": "Conditioner",
        "description": "Smoothens and softens hair.",
        "sku": "CONDITIONER",
        "price": "6.99",
        "currency": "USD",
        "inventory": 6,
        "reserved": 4,
        "sold": 0
      }
    }
  ]
}
```

## Categories

### Index - GET `/categories`

#### Response

```json
[
  {
    "id": 1,
    "name": "Beverages",
    "products": [
      {
        "id": 1,
        "name": "Tea",
        "description": "A soothing beverage.",
        "sku": "TEA",
        "price": "4.99",
        "currency": "USD",
        "inventory": 5,
        "reserved": 0,
        "sold": 0
      },
      {
        "id": 2,
        "name": "Coffee",
        "description": "A strong and bold beverage.",
        "sku": "COFFEE",
        "price": "5.99",
        "currency": "USD",
        "inventory": 10,
        "reserved": 0,
        "sold": 0
      }
    ]
  },
  {
    "id": 2,
    "name": "Snacks",
    "products": [
      {
        "id": 11,
        "name": "Chips",
        "description": "Crispy and salty snack.",
        "sku": "CHIPS",
        "price": "2.99",
        "currency": "USD",
        "inventory": 11,
        "reserved": 0,
        "sold": 0
      },
      {
        "id": 12,
        "name": "Chocolate Bar",
        "description": "Sweet and rich chocolate.",
        "sku": "CHOCBAR",
        "price": "1.99",
        "currency": "USD",
        "inventory": 7,
        "reserved": 0,
        "sold": 0
      }
    ]
  }
]
```

### Show - GET `/categories/:category_id`

#### Response

```json
{
  "id": 1,
  "name": "Beverages",
  "products": [
    {
      "id": 1,
      "name": "Tea",
      "description": "A soothing beverage.",
      "sku": "TEA",
      "price": "4.99",
      "currency": "USD",
      "inventory": 5,
      "reserved": 0,
      "sold": 0
    },
    {
      "id": 2,
      "name": "Coffee",
      "description": "A strong and bold beverage.",
      "sku": "COFFEE",
      "price": "5.99",
      "currency": "USD",
      "inventory": 10,
      "reserved": 0,
      "sold": 0
    }
  ]
}
```

## Products

### Index - GET `/products`

#### Accepted Params

- `sku` : if passed, it will search for a product that maches the string passed to the param.
- `top_sold` : If passed and equal to `true`, it will retrieve the top 10 most sold products
- `limit` : If passed and equal to an integer, it will limit the amount of results for the `top_sold` query.

`sku` and `top_sold` cannot be used together.
`limit` can only be used with `top_sold`.

#### Response

```json
[
  {
    "id": 1,
    "name": "Tea",
    "description": "A soothing beverage.",
    "sku": "TEA",
    "price": "4.99",
    "currency": "USD",
    "inventory": 5,
    "reserved": 0,
    "sold": 0,
    "category_id": 1
  },
  {
    "id": 2,
    "name": "Coffee",
    "description": "A strong and bold beverage.",
    "sku": "COFFEE",
    "price": "5.99",
    "currency": "USD",
    "inventory": 10,
    "reserved": 0,
    "sold": 0,
    "category_id": 1
  }
]
```

### Show - GET `/products/:product_id`

#### Response

```json
{
  "id": 1,
  "name": "Tea",
  "description": "A soothing beverage.",
  "sku": "TEA",
  "price": "4.99",
  "currency": "USD",
  "inventory": 5,
  "reserved": 0,
  "sold": 0,
  "category_id": 1
}
```
