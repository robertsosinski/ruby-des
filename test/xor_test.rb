require 'test_helper'

class XORTest < Test::Unit::TestCase
  fixtures :xor
  
  def test_run
    assert_equal xor(:e_xor_sub_key), XOR.run(xor(:e), xor(:sub_key))
  end
end