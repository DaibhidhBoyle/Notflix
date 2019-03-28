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

get '/rent/:id' do
  @users = User.all
  @content = Content.find(params[:id])
  erb( :rent)
end

post '/rent/new' do
  rental = Rental.new(params)
  rental.start_date
  rental.save
end
