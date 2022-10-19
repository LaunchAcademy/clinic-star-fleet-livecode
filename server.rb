require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/star-ships'
end

get '/star-ships' do
  # @star_ships = StarShip.all

  # erb :'star_ships/index'
end

# new starship form

post '/star-ships' do

  # make a ship 

  # tell the user if they messed up or not
end

get '/crew-members' do
  # @crew_members = CrewMember.all

  # erb :'crew_members/index'
end

# STARSHIP SHOW ROUTE

