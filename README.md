# Jungle

A mini e-commerce application built with Rails 4.2. Learned how to navaigate existing code-bases and implement new features with an unfamiliar language. Applied previous research tactics to become familiar with new paradigms, language and frameworks. Able to implement features without thorough explanation. simulating real world situations.

## Final Product

!['main page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/main.png)
!['cart page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/cart.png)
!['payment page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/payment.png)
!['order finish page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/order.png)
!['products in admin page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/products.png)
!['categories in admin page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/categories.png)
!['item show page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/item.png)
!['reviews in item show page'](https://github.com/hjd007wwkd/LP6.Jungle-Rails/blob/master/docs/review.png)

## Implementation

Implemented the following features for Jungle:

* **Sold Out Badge**: Implemented boolean function to display badge when inventory 0.
* **Admin Categories**: Created restful routes to be able to create new categories within the admin namespace.
* **User Authentication**: User is able to signup/login to Jungle where password is encrypted and email is validated through uniqueness to ensure non existing user.
* **Enhanced Order Page**: Order details shown with description, quantity and cart total upon successful payment.
* **Confirmation Email**: Email is sent to user to confirm purchase with order details.
* **Product Ratings**: Users logged in are able to leave reviews for each product and can delete reviews. Visitors are able to see product ratings, but must be logged in in order to leaver review.

Code is DRY and modular, follow The Rails Way.

## Stack
* Rails
* Ruby
* ERB
* Boostrap
* PostgreSQL

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe