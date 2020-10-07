require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  @starships = Starship.all
  erb :'starships/index'
end

get '/crew-members' do
  @crew_members = CrewMember.all
  erb :'crew_members/index'
end

get '/starships/new' do
  erb :'starships/new'
end

get '/starships/:id' do
  # binding.pry
  @starship = Starship.find(params["id"])

  erb :'starships/show'
end

post '/starships' do
 @name = params["name"]
 @ship_class = params["ship_class"]
 @location = params["location"]

 new_ship = Starship.new(name: @name, ship_class: @ship_class, location: @location)

 if new_ship.save
  flash[:notice] = "Ship was made WOOOOOOO"
  redirect "/starships/#{new_ship.id}"
 else
  flash.now[:notice] = new_ship.errors.full_messages.to_sentence
  erb :'starships/new'
 end

end

post '/starships/:starship_id/crew-members' do
  new_member = CrewMember.new(params)
  @starship = Starship.find(params["starship_id"])

  if new_member.save
    flash[:notice] = "#{new_member.first_name} has been added"
    redirect "/starships/#{@starship.id}"
  else
    flash.now[:notice] = new_member.errors.full_messages.to_sentence
    erb :'starships/show'
  end
end

