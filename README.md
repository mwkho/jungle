# Jungle

A mini e-commerce application built with Rails 4.2.

Features include:
* Guest checkout
* User registration and sign-in
* Prevent user from adding an out of stock item to cart
* Admin rights for adding a product and category

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
9. Assign admin username and password to .env file 
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

![Home Page](https://raw.githubusercontent.com/mwkho/jungle/master/docs/homepage.png)
![Shopping Cart](https://raw.githubusercontent.com/mwkho/jungle/master/docs/cart.png)
![Admin page of product](https://raw.githubusercontent.com/mwkho/jungle/master/docs/admin-product-show.png)
## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing orders,

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 
* PostgreSQL 9.x
* Stripe