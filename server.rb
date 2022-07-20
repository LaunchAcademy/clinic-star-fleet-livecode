require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/star-ships'
end

get '/star-ships' do
  @star_ships = StarShip.all

  erb :'star_ships/index'
end

get "/star-ships/new" do 
  erb :"star_ships/new"
end

post '/star-ships' do

  new_ship = StarShip.new(name: params[:name], location: params[:location], ship_class: params[:ship_class])

  if new_ship.save 
    flash[:notice] = "You successfully created a starship!"
    redirect "/star-ships/#{new_ship.id}"
  else 
    flash.now[:error] = new_ship.errors.full_messages.to_sentence
    erb :"star_ships/new"
  end
end

get '/crew-members' do
  @crew_members = CrewMember.all

  erb :'crew_members/index'
end

get '/star-ships/:id' do
  @star_ship = StarShip.find(params[:id])

  erb :'star_ships/show'
end

post "/star-ships/:star_ship_id/crew-members" do 

  first_name = params[:first_name]
  last_name = params[:last_name]
  specialty_division = params[:specialty_division]

  @star_ship = StarShip.find(params[:star_ship_id])
  
  new_crew_member = CrewMember.new(
    first_name: first_name, 
    last_name: last_name, 
    specialty_division: specialty_division,
    star_ship_id: params[:star_ship_id]
    )
    
  if new_crew_member.save
    flash[:banana] = "You added a new friend <3"
    redirect "/star-ships/#{params[:star_ship_id]}"
  else 
    flash.now[:error_for_stinkers] = new_crew_member.errors.full_messages.to_sentence
    erb :'star_ships/show'
  end
end