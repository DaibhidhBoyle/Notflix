require('pry-byebug')
require_relative('../db/sql_runner')
require 'date'

class Rental

  attr_reader :id, :user_id, :content_id, :start_date, :end_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id']
    @content_id = options['content_id']
    # @duration = options['duration'].to_i
    #ac
    @start_date = options['start_date']
    #ac
    # @end_date = @start_date + @duration
    @end_date = options['end_date']
  end

  def save()
    sql = "INSERT INTO rentals
    (user_id, content_id, start_date, end_date)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@user_id, @content_id, @start_date, @end_date]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE rentals
    SET
    (user_id, content_id, start_date, end_date) =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@user_id, @content_id, @start_date, @end_date, @id]
    result = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def start_date_set
    @start_date = Date.today
  end

  def end_date_calculation(duration)
    now = Date.today
    @end_date = (now + duration)
  end

  def user()
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [@user_id]
    results = SqlRunner.run( sql, values )
    return User.new( results.first )

  end

  def content()
    sql = "SELECT * FROM content
    WHERE id = $1"
    values = [@content_id]
    results = SqlRunner.run(sql, values)
    return Content.new( results.first)
  end


  def self.all()
    sql = "SELECT * FROM rentals"
    rental_data = SqlRunner.run(sql)
    rentals = map_items(rental_data)
    return rentals
  end

  def self.map_items(rental_data)
    return rental_data.map { |rental| Rental.new(rental) }
  end

  def self.find(id)
    sql = "SELECT * FROM rentals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    rental = Rental.new(result)
    return rental
  end

  def self.find_by_content_title(title)
    sql = "SELECT rentals.* FROM rentals
    INNER JOIN content ON rentals.content_id = content.id
    WHERE title = $1"
    values = [title]
    rental_data = SqlRunner.run(sql ,values)
    rentals = map_items(rental_data)
    return rentals
  end

  def self.delete_all
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

end
