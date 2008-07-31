require 'test_helper'

class CtxTest < Test::Unit::TestCase
  fixtures :ctx
  
  def test_encypt
    assert_equal ctx(:cipher_text), RubyDES::Ctx.new(ctx(:plain_text), ctx(:key)).run(:encrypt)
  end
  
  def test_decrypt
    assert_equal ctx(:plain_text), RubyDES::Ctx.new(ctx(:cipher_text), ctx(:key)).run(:decrypt)
  end
end