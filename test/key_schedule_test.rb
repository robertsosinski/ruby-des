require 'test_helper'

class KeyScheduleTest < Test::Unit::TestCase
  fixtures :key_schedule
  
  def setup
    @key_schedule = KeySchedule.new(key_schedule(:test_key))
  end
  
  def test_class    
    assert_kind_of KeySchedule, @key_schedule
  end
  
  def test_test_key
    assert_kind_of Array, @key_schedule.key
    assert_equal key_schedule(:test_key), @key_schedule.key
  end
  
  def test_sub_keys
    assert_kind_of Array, @key_schedule.sub_keys
    assert_equal key_schedule(:sub_key_1), @key_schedule.sub_keys[0]
    assert_equal key_schedule(:sub_key_2), @key_schedule.sub_keys[1]
    assert_equal key_schedule(:sub_key_3), @key_schedule.sub_keys[2]
    assert_equal key_schedule(:sub_key_4), @key_schedule.sub_keys[3]
    assert_equal key_schedule(:sub_key_5), @key_schedule.sub_keys[4]
    assert_equal key_schedule(:sub_key_6), @key_schedule.sub_keys[5]
    assert_equal key_schedule(:sub_key_7), @key_schedule.sub_keys[6]
    assert_equal key_schedule(:sub_key_8), @key_schedule.sub_keys[7]
    assert_equal key_schedule(:sub_key_9), @key_schedule.sub_keys[8]
    assert_equal key_schedule(:sub_key_10), @key_schedule.sub_keys[9]
    assert_equal key_schedule(:sub_key_11), @key_schedule.sub_keys[10]
    assert_equal key_schedule(:sub_key_12), @key_schedule.sub_keys[11]
    assert_equal key_schedule(:sub_key_13), @key_schedule.sub_keys[12]
    assert_equal key_schedule(:sub_key_14), @key_schedule.sub_keys[13]
    assert_equal key_schedule(:sub_key_15), @key_schedule.sub_keys[14]
    assert_equal key_schedule(:sub_key_16), @key_schedule.sub_keys[15]
  end
end
