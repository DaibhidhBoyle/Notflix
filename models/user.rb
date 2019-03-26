require('pry-byebug')
require_relative('../db/sql_runner')

class User

  attr_reader :id
  attr_accessor :user_name, :wallet

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_name = options['user_name']
    @wallet = options['wallet']
  end


  def save()
      sql = "INSERT INTO users
      (user_name, wallet)
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@user_name, @wallet]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
    end

    def update()
        sql = "UPDATE users
    SET
    (user_name, wallet) =
    ($1, $2)
    WHERE id = $3"
        values = [@user_name, @wallet, @id]
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

    def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

end
