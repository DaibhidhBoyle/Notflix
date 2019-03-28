require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/admins')
require_relative('controllers/users')
also_reload( '../models/*' )


get '/' do
  erb( :home )
end

get '/watch' do
  erb( :watch)
end
