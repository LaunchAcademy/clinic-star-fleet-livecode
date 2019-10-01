require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  @ships = Ship.all

  erb :'starships/index'
end

get '/starships/new' do
  erb :'starships/new'
end

post '/starships/new' do
  starship = Ship.new
  starship.name = params[:name]
  starship.ship_class = params[:ship_class]
  starship.location = params[:location]

  if !starship.name.empty? && !starship.ship_class.empty? && !starship.location.empty?
    starship.save
    flash[:notice] = "Starship Created"

    redirect "/starships/#{starship.id}"
  else
    flash[:notice] = "Shut Up Wesley - you done effed up"
    @name = params[:name]
    @ship_class = params[:ship_class]
    @location = params[:location]
    erb :"/starships/new"
  end

end

get '/starships/:id' do
  @ship = Ship.find(params[:id])

  erb :'starships/show'
end
