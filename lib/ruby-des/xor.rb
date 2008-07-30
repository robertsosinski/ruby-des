module XOR
  def self.run(x, y)
    output = []
    
    x.size.times do |i|
      output << (x[i] ^ y[i])
    end
    
    return output
  end
end