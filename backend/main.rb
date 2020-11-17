require 'sinatra'
require 'sinatra/cors'
require_relative 'password_checker'

set :allow_origin, "http://localhost:3000"
set :allow_methods, "GET,HEAD,POST"
set :allow_headers, "content-type,if-modified-since"

post '/passwords' do
  json = JSON.parse(request.body.read)
  password_checker = PasswordChecker.new(json["password"])
  password_checker.status
end
