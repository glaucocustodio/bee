require 'sinatra'
require 'sinatra/cors'


set :allow_origin, "http://localhost:3000"
set :allow_methods, "GET,HEAD,POST"
set :allow_headers, "content-type,if-modified-since"

post '/passwords' do
  'ok'
end
