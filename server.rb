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

get "/starships/new" do
  erb :'starships/new'
end

get "/starships/:id" do
  @starship = Starship.find(params[:id])

  erb :'starships/show'
end

post "/starships/:starship_id/crew_members" do
  first_name = params[:first_name]
  last_name = params[:last_name]
  specialty_division = params[:specialty_division]
  starship_id = params[:starship_id]

  member = CrewMember.new(first_name: first_name, last_name: last_name, specialty_division: specialty_division, starship_id: starship_id )

  if member.save
    flash[:notice] = "YOU DID IT YAY!"

    redirect "/crew-members"
  else
    flash.now[:notice] = member.errors.full_messages.to_sentence
    erb :'starships/show'
  end
end

post "/starships" do
  name = params[:name]
  ship_class = params[:ship_class]
  location = params[:location]

  starship = Starship.new(name: name, ship_class: ship_class, location: location)

  if starship.save
    flash[:notice] = "YOU DID IT YAY!"

    redirect "/starships/#{starship.id}"
  else
    flash.now[:notice] = starship.errors.full_messages.to_sentence
    erb :'starships/new'
  end



end
