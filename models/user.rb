require 'date'
require_relative('../db/sql_runner')
require( 'pry-byebug' )

class User

  attr_reader :id
  attr_accessor :user_name, :wallet, :profile_pic

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_name = options['user_name']
    @wallet = options['wallet'].to_i
    @profile_pic = options['profile_pic']
  end

  def save()
    sql = "INSERT INTO users
    (user_name, wallet, profile_pic)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@user_name, @wallet, @profile_pic]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE users
    SET user_name = $1
    WHERE id = $2"
    values = [@user_name, @id]
    result = SqlRunner.run(sql, values)
  end

  def update_wallet(cost)
    sql = "UPDATE users
    SET wallet = (CAST($1 AS int) - CAST($2 AS int))
    WHERE id = $3"
    values = [@wallet, cost, @id]
    result = SqlRunner.run(sql, values)
  end

  def update_profile_pic
    sql = "UPDATE users
    SET profile_pic = $1
    WHERE id = $2"
    values = [@profile_pic, @id]
    result = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM users
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def content()
    sql = "SELECT c.* FROM content c INNER JOIN rentals r ON r.content_id = c.id WHERE r.user_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |content| Content.new(content) }
  end

  def current_rentals()
    sql = "SELECT * FROM rentals
    WHERE end_date >= NOW() AND user_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |rental| Rental.new(rental) }
  end

  def self.all()
    sql = "SELECT * FROM users"
    user_data = SqlRunner.run(sql)
    users = map_items(user_data)
    return users
  end

  def self.map_items(user_data)
    return user_data.map { |user| User.new(user) }
  end

  def self.find(id)
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    user = User.new(result)
    return user
  end

  def self.find_by_name(string_entered)
    lower_string_entered= string_entered.downcase
    user_name_search = lower_string_entered.split(' ')
    users = []

    for letter in user_name_search

      sql = "SELECT * FROM users
      WHERE lower(user_name) LIKE $1"
      values = ["%" + letter + "%"]
      result = SqlRunner.run(sql ,values)
      users << result.map{|single_user| User.new(single_user)}
    end
    users = users.flatten

    if users.empty?
      sql = "SELECT * FROM users
      WHERE lower(user_name) LIKE $1"
      values = [lower_string_entered]
      result = SqlRunner.run(sql ,values).first

      user = User.new(result)
      users << user
    end

    return users
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

end
