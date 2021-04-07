require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  
  erb :'starships/index'
end

get '/crew-members' do

  erb :'crew_members/index'
end

get '/starships/new' do
  erb :'starships/new'
end

get '/starships/:id' do

  erb :'starships/show'
end

post '/starships' do


end

post '/starships/:starship_id/crew-members' do

end