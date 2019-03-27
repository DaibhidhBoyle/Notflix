require('pry-byebug')
require_relative('../db/sql_runner')

class Content

  attr_reader :id
  attr_accessor :title, :type, :cost

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @type = options['type']
    @cost = options['cost']
  end

  def save()
    sql = "INSERT INTO content
    (title, type, cost)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@title, @type, @cost]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE content
    SET
    (title, type, cost) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @type, @cost, @id]
    result = SqlRunner.run(sql, values)
  end

  def users()
    sql = "SELECT u.* FROM users u INNER JOIN rentals r ON r.user_id = u.id WHERE r.content_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |user| User.new(user) }
  end

  def delete()
    sql = "DELETE FROM content
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM content"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM content
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    content = Content.new(result)
    return content
  end

  def self.all()
    sql = "SELECT * FROM content"
    content_data = SqlRunner.run(sql)
    content = map_items(content_data)
    return content
  end

  def self.map_items(content_data)
    return content_data.map { |content| Content.new(content) }
  end

end
