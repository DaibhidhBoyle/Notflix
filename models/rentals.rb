require('pry-byebug')
require_relative('../db/sql_runner')

class Rentals

attr_reader :id, :user_id, :content_id, :start_date, :end_date

  def initalize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id']
    @content_id = options['content_id']
    @start_date = options['start_date']
    @end_date = options['end_date']
  end

end
