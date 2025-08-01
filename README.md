# Pizzeria
This is an application that lets users with specific roles manage pizzas and toppings. 

You can find a live version [here](https://smassessment-db.onrender.com/).

## Tech Used
- Rails 8.0.2
- Ruby 3.4.5
- Tailwind
- PostgreSQL
- Devise
- Slim
  
## Test Tech Used
- RSpec
- Pry/Pry-Byebug
- Shoulda Matchers
- Faker
- Factory Bot

## Getting Started
1. Clone this repo ```git clone git@github.com:melodykirshberg/pizzeria.git```
2. Ensure you have the correct ruby version ```ruby -v```
   - If you don't, install via your favorite version manager tool.
3. Bundle ```bundle install```
4. Set up the database ```rails db:drop db:create db:migrate db:seed```
5. Build Tailwind CSS ```rails tailwindcss:build```
6. Start the application ```bin/dev``` or ```rails s```
7. You're live!

## Running Tests
To run tests ```bundle exec rspec```

## Future additions
- Move main Pizza and Topping views into more reusable components with ViewComponents
- Add icons
- Add customer user role to see current pizza options
  - Add a favorites option for customers
  - Once a favorite is back on the menu, notify customers via their email
  
