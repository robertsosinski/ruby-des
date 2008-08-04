require 'test_helper'

class CtxTest < Test::Unit::TestCase
  fixtures :ctx
  
  def setup
    @data = RubyDES::Block.new('security')
    @key  = RubyDES::Block.new('ruby-des')
  end
  
  def test_run
    encrypted_data = RubyDES::Ctx.new(@data, @key).encrypt
    
    assert_equal ctx(:encrypted_bit_array), encrypted_data.bit_array
    
    decrypted_data = RubyDES::Ctx.new(encrypted_data, @key).decrypt
    
    assert_equal ctx(:decrypted_bit_array), decrypted_data.bit_array
  end
end
