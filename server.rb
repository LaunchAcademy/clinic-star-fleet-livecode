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

get '/star-ships/:id' do
  @star_ship = StarShip.find(params[:id])
  @crew_members = @star_ship.crew_members 

  erb :'star_ships/show'
end


get '/crew-members' do
  @crew_members = CrewMember.all

  erb :'crew_members/index'
end

post "/star-ships/:star_ship_id/crew-members" do 
  @star_ship = StarShip.find(params["star_ship_id"])
  
  @crew_member = CrewMember.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      specialty_division: params["specialty_division"],
      star_ship_id: @star_ship.id
    )

    if @crew_member.save 
      flash[:success] = "Yay you created a ship"
      redirect "/star-ships/#{@star_ship.id}"
    else 
      flash.now[:error] = @crew_member.errors.full_messages.to_sentence
      erb :'star_ships/show'
    end

end


@ship = StarShip.find(params["id"])

@ship.create_at.strftime("%m/%d/%Y") 

# @ship.update(params)