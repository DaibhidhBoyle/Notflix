require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/admins')
require_relative('controllers/users')


get '/' do
  erb( :home )
end
