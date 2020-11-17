require "sinatra/base"
require 'sinatra/cors'
require_relative 'password_checker'

class Backend < Sinatra::Base
  register Sinatra::Cors

  set :allow_origin, "http://localhost:3000"
  set :allow_methods, "GET,HEAD,POST"
  set :allow_headers, "content-type,if-modified-since"

  post '/passwords' do
    json = JSON.parse(request.body.read)

    if json["password"]
      password_checker = PasswordChecker.new(json["password"])
      password_checker.status
    else
      status 400
    end
  end
end
