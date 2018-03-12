# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Source 

* https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

# Curl examples

### curl POST examples
> https://gist.github.com/subfuzion/08c5d85437d5d4f00e58
### GET
> curl -X GET -H -I http://localhost:3000/todos
### POST
> curl -d '{"title":"Mozart", "created_by":"1"}' -H "Content-Type: application/json" -X POST http://localhost:3000/todos
### PUT
> curl -d '{"title":"Beethoven"}' -H "Content-Type: application/json" -X PUT http://localhost:3000/todos/1
### DELETE
> curl -X DELETE -H -I http://localhost:3000/todos/1 
