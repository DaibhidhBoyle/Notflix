require("minitest/autorun")
require('minitest/rg')
require_relative("../models/content")

class ContentTest < MiniTest::Test

  def setup
    @content1 = Content.new('title' => 'Geralds game', 'type' => 'movie', 'cost' => 1)
  end

def test_title
  assert_equal('The Umbrella Academy', @content1.title)
end

end
