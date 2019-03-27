require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/content.rb' )
require_relative( '../models/rentals.rb' )
require_relative( '../models/user.rb' )
also_reload( '../models/*' )

get '/user/:id' do
  @user = User.find(params['id'])
  erb(:'user/profile')
end

get '/user/:id/update' do
  @user = User.find(params['id'])
  erb(:'user/update')
end

post '/user/:id' do
  user = User.new(params)
  user.update
  redirect to "/user/#{params['id']}"
end

post '/user/:id/delete' do
  user = User.find(params['id'])
  user.delete
  redirect to '/'
end

get '/user/:id/rentals' do
  user = User.find(params['id'])
  @rental = user.current_rentals
  erb(:"user/yourrentals")
end
