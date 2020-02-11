# README

A CRM that is being developed for ATA schools to run their business as effectively possible. The goal is to reduce the amount of time school owners need to spend doing business operations task and focus on training their students. 

## Ruby version
ruby version 2.4.2

## Database creation
Local development uses Postgres to match production. The configuration is in `database.yml` file so you can connect to your local client

## Database initialization
There is some test data in the `seeds.rb` file. When initializing the database run `rake db:migrate db:seed`. This will create some test users and 25 student records 

## How to run the test suite
Using `rspec` for unit test. Run `rspec` in the the root of the application

## Services (job queues, cache servers, search engines, etc.)
Need to add

## Deployment instructions
Heroku will build from `master` branch from the admin dashboard
