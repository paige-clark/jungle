# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. The goal of this project was to simulate what it's like to work on code that has been developed by other people in a language that you aren't familiar with. In this case, I started learning Ruby and Ruby on Rails a week before the project began then had to implement assigned tasks.

## Screenshots
Feature request- show disabled add button and sold out badge if the stock is 0:
![sold out badge](https://github.com/paige-clark/jungle/blob/master/docs/1.png?raw=true)
Feature request- an admin dashboard that's password protected:
![admin dashboard](https://github.com/paige-clark/jungle/blob/master/docs/2.png?raw=true)
Feature request- add a category and add new products within it:
![create a new product](https://github.com/paige-clark/jungle/blob/master/docs/3.png?raw=true)
Feature request- register a new user:
![register a new user](https://github.com/paige-clark/jungle/blob/master/docs/4.png?raw=true)
Feature request- show order details after placement:
![order placement](https://github.com/paige-clark/jungle/blob/master/docs/5.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Testing
- Cypress
- Rspec