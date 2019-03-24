require('pry-byebug')
require_relative('../db/sql_runner')

class User

  attr_reader :id, :user_name, :wallet

  def initalize(options)
    @id = options['id'].to_i if options['id']
    @user_name = options['user_name']
    @wallet = options['wallet']
  end

end
