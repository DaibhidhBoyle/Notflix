require('pry-byebug')
require_relative('../db/sql_runner')

class Content

  attr_reader :id, :title, :type, :cost

  def initalize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @type = options['type']
    @cost = options['cost']
  end

end
