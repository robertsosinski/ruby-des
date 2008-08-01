require 'test_helper'

class FeistelTest < Test::Unit::TestCase
  fixtures :feistel
  
  def test_run
    assert_equal feistel(:output), Feistel.run(feistel(:half_block), feistel(:sub_key))
  end
end
