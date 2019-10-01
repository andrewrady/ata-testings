# README

A simple rails application that tracks student and tests for ATA schools.

Things you may want to cover:

## Ruby version
ruby version 2.4.2

## Database creation
Currently local development is ran off of sqlite, but there is plans to move it too Postgres to match production

## Database initialization
There is some test data in the `seeds.rb` file. When initializing the database run `rake db:migrate db:seed`. This will create some test users and 25 student records 

## How to run the test suite
Using `rspec` for unit test. Run `rspec` in the the root of the application

## Services (job queues, cache servers, search engines, etc.)
Need to add

## Deployment instructions
Heroku will build from `master` branch from the admin dashboard
