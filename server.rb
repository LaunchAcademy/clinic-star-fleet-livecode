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

  erb :'crew_members/index'
end

get '/starships/new' do
  erb :'starships/new'
end

get '/starships/:id' do
  @starship = Starship.find(params["id"])
  erb :'starships/show'
end

post '/starships' do
  @name = params["name"]
  @ship_class = params["ship_class"]
  @location = params["location"]

  @starship = Starship.new(name: name, ship_class: ship_class, location: location)
  if @starship.valid?
  
    @starship.save
    flash[:notice] = "Ship has been added"
    redirect "/starships/#{@starship.id}"
  else
  
    flash.now[:notice] =  @starship.errors.full_messages.to_sentence
    erb :'starships/new'
  end
end

post '/starships/:starship_id/crew-members' do
  @starship = Starship.find(params["starship_id"])
  
  # binding.pry
end
