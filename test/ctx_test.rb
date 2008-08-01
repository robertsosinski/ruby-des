require 'test_helper'

class CtxTest < Test::Unit::TestCase
  fixtures :ctx
  
  def setup
    @data = RubyDES::Block.new('security')
    @key  = RubyDES::Block.new('ruby-des')
  end
  
  def test_run
    encrypted = RubyDES::Ctx.new(@data, @key).run(:encrypt)
    
    assert_equal ctx(:encrypted_bit_array), encrypted.bit_array
    
    decrypted = RubyDES::Ctx.new(encrypted, @key).run(:decrypt)
    
    assert_equal ctx(:decrypted_bit_array), decrypted.bit_array
  end
end