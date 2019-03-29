require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/content.rb' )
require_relative( '../models/rentals.rb' )
require_relative( '../models/user.rb' )
also_reload( '../models/*' )

get '/admin' do
  erb(:'admin/home')
end

get '/admin/users' do
  @users = User.all
  erb(:'admin/allusers')
end

get '/admin/rentals' do
  @rental = Rental.all
  erb(:'admin/allrentals')
end

post '/admin/users/find' do
  name_user = params['name_user']
  user = User.find_by_name(name_user)
  @users = [user]
  erb(:'admin/finduser')
end

post '/admin/rentals/find' do
  title = params['title']
  rental = Rental.find_by_content_title(title)
  @rental = [rental]
  erb(:'admin/findrental')
end

post '/admin/rentals/delete/:id' do
  rental = Rental.find(params['id'])
  rental.delete
  redirect to '/'
end
