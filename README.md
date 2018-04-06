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
* http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/

# Curl examples

### curl POST examples
> https://gist.github.com/subfuzion/08c5d85437d5d4f00e58
### GET
> curl -X GET -I http://localhost:3000/todos

> curl -X GET -H "Authorization:TOKEN" -I http://localhost:3000/todos

> curl -H Accept:'application/vnd.todos.v1+json' -H Authorization:TOKEN' -X GET http://localhost:3000/todos

>  curl -H Accept:'application/vnd.todos.v1+json' -H Authorization:'TOKEN' -X GET "http://localhost:3000/todos?page=1"
### POST
> curl -d '{"title":"Mozart", "created_by":"1"}' -H "Content-Type: application/json" -X POST http://localhost:3000/todos

> curl -d "name=name&email=mail@email.com&password=foobar&password_confirmation=foobar" -X POST http://localhost:3000/signup

> curl -H "Authorization:TOKEN" -d "title=Beethoven" -X POST http://localhost:3000/todos
### PUT
> curl -d '{"title":"Beethoven"}' -H "Content-Type: application/json" -X PUT http://localhost:3000/todos/1
### DELETE
> curl -X DELETE -H -I http://localhost:3000/todos/1 
