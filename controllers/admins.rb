require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/content.rb' )
require_relative( '../models/rentals.rb' )
require_relative( '../models/user.rb' )
also_reload( '../models/*' )

get '/admin' do
  erb(:"admin/adminsearch")
end

get '/admin/users' do
  @users = User.all
  erb(:'admin/allusers')
end

get '/admin/rentals' do
  erb
end
