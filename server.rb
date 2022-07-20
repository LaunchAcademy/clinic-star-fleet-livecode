require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/star-ships'
end

get '/star-ships' do


  erb :'star_ships/index'
end

get '/crew-members' do


  erb :'crew_members/index'
end

get '/star-ships/:id' do


  erb :'star_ships/index'
end

post "/" do 
# add new crew member route
end