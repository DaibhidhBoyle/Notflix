require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/admins')
require_relative('controllers/users')
also_reload( '../models/*' )
require( 'pry-byebug')


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

# post '/rent/:content_id/new' do #ac
#   binding.pry
#   rental = Rental.new(params)
#   rental.save
#   redirect to redirect to "/"
# end

post '/rent/:content_id/new' do
  rental = Rental.new(params)
  rental.start_date_set
  rental.end_date_calculation(params[:duration].to_i)
  rental.save
  rental.user.update_wallet(rental.content.cost.to_i)
  redirect to redirect to "/"
end
