$:.unshift(File.dirname(__FILE__))

require 'ruby-des/feistel'
require 'ruby-des/key_schedule'
require 'ruby-des/xor'

module RubyDES
  IP_L = [0x3a, 0x32, 0x2a, 0x22, 0x1a, 0x12, 0x0a, 0x02,
          0x3c, 0x34, 0x2c, 0x24, 0x1c, 0x14, 0x0c, 0x04,
          0x3e, 0x36, 0x2e, 0x26, 0x1e, 0x16, 0x0e, 0x06,
          0x40, 0x38, 0x30, 0x28, 0x20, 0x18, 0x10, 0x08]

  IP_R = [0x39, 0x31, 0x29, 0x21, 0x19, 0x11, 0x09, 0x01,
          0x3b, 0x33, 0x2b, 0x23, 0x1b, 0x13, 0x0b, 0x03,
          0x3d, 0x35, 0x2d, 0x25, 0x1d, 0x15, 0x0d, 0x05,
          0x3f, 0x37, 0x2f, 0x27, 0x1f, 0x17, 0x0f, 0x07]
        
  FP = [0x28, 0x08, 0x30, 0x10, 0x38, 0x18, 0x40, 0x20,
        0x27, 0x07, 0x2f, 0x0f, 0x37, 0x17, 0x3f, 0x1f,
        0x26, 0x06, 0x2e, 0x0e, 0x36, 0x16, 0x3e, 0x1e,
        0x25, 0x05, 0x2d, 0x0d, 0x35, 0x15, 0x3d, 0x1d,
        0x24, 0x04, 0x2c, 0x0c, 0x34, 0x14, 0x3c, 0x1c,
        0x23, 0x03, 0x2b, 0x0b, 0x33, 0x13, 0x3b, 0x1b,
        0x22, 0x02, 0x2a, 0x0a, 0x32, 0x12, 0x3a, 0x1a,
        0x21, 0x01, 0x29, 0x09, 0x31, 0x11, 0x39, 0x19]
  
  class Ctx
    attr_reader :data, :key
    
    def initialize(data, key)
      unless data.is_a?(RubyDES::Block) and key.is_a?(RubyDES::Block)
        raise "RubyDES::InvalidBlockFormat: Data and key must be a Block object."
      end
      
      @data = data
      @key  = key
    end
    
    def run(operation)
      l = [] # l[0] is the IP_1_L permutation of the data block, l[1..16] are the results of each round of encryption.
      r = [] # r[0] is the IP_1_R permutation of the data block, r[1..16] are the results of each round of encryption.
      
      l << IP_L.collect{|p| data.bit_array[p - 1]}
      r << IP_R.collect{|p| data.bit_array[p - 1]}
      
      case operation
      when :encrypt
        k = KeySchedule.new(key.bit_array).sub_keys
      when :decrypt
        k = KeySchedule.new(key.bit_array).sub_keys.reverse
      end
      
      16.times do |i|
        l << r[i]
        r << XOR.run(Feistel.run(r[i], k[i]), l[i])
      end
      
      return RubyDES::Block.new(FP.collect{|p| (r.last + l.last)[p - 1]})
    end
  end
  
  class Block
    attr_reader :string, :bit_array
    
    def initialize(input)
      if input.is_a?(String)
        raise "RubyDES::InvalidStringLength: Input String must contain (8) characters." unless input.length.eql?(8)
        
        @string    = input
        @bit_array = input.unpack('B*').join.split('').collect{|b| b.to_i}
      elsif input.is_a?(Array)
        raise "RubyDES::InvalidArraySize: Input Array must contain (64) bits." unless input.size.eql?(64)
        
        @string    = input.join.to_a.pack('B*')
        @bit_array = input
      else
        raise "RubyDES::InvalidFormat: Input must be a String or an Array."
      end
    end
  end
end