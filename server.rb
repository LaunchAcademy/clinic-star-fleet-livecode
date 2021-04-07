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



@starship = Starship.find(params["id"])
  erb :'starships/show'
end

post '/starships' do
  # binding.pry
  @name = params["name"]
  @ship_class = params["ship_class"]
  @location = params["location"]

  new_starship = Starship.new(name: @name, ship_class: @ship_class, location: @location)

  # new_starship2 = Starship.create(name: @name, ship_class: @ship_class, location: @location)
# binding.pry
  if new_starship.save
    flash[:notice] = "we made a ship, yay!"
    redirect "/starships/#{new_starship.id}"
  else
    flash.now[:notice] = new_starship.errors.full_messages.to_sentence
    erb :'starships/new'
  end


end

post '/starships/:starship_id/crew-members' do
  # binding.pry

  new_member = CrewMember.new(params)
  @starship = Starship.find(params["starship_id"])

  if new_member.save
    flash[:notice] = "crew member added"
    redirect "/crew-members"
  else
    flash.now[:notice] = new_member.errors.full_messages.to_sentence
    erb :'starships/show'
  end

end