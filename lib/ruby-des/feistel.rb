module Feistel
  E = [0x20, 0x01, 0x02, 0x03, 0x04, 0x05,
       0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
       0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d,
       0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11,
       0x10, 0x11, 0x12, 0x13, 0x14, 0x15,
       0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
       0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d,
       0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x01]

  P = [0x10, 0x07, 0x14, 0x15,
       0x1d, 0x0c, 0x1c, 0x11,
       0x01, 0x0f, 0x17, 0x1a,
       0x05, 0x12, 0x1f, 0x0a,
       0x02, 0x08, 0x18, 0x0e,
       0x20, 0x1b, 0x03, 0x09,
       0x13, 0x0d, 0x1e, 0x06,
       0x16, 0x0b, 0x04, 0x19]
  
  S1 = [0x0e, 0x04, 0x0d, 0x01, 0x02, 0x0f, 0x0b, 0x08, 0x03, 0x0a, 0x06, 0x0c, 0x05, 0x09, 0x00, 0x07,
        0x00, 0x0f, 0x07, 0x04, 0x0e, 0x02, 0x0d, 0x01, 0x0a, 0x06, 0x0c, 0x0b, 0x09, 0x05, 0x03, 0x08,
        0x04, 0x01, 0x0e, 0x08, 0x0d, 0x06, 0x02, 0x0b, 0x0f, 0x0c, 0x09, 0x07, 0x03, 0x0a, 0x05, 0x00,
        0x0f, 0x0c, 0x08, 0x02, 0x04, 0x09, 0x01, 0x07, 0x05, 0x0b, 0x03, 0x0e, 0x0a, 0x00, 0x06, 0x0d]
  
  S2 = [0x0f, 0x01, 0x08, 0x0e, 0x06, 0x0b, 0x03, 0x04, 0x09, 0x07, 0x02, 0x0d, 0x0c, 0x00, 0x05, 0x0a,
        0x03, 0x0d, 0x04, 0x07, 0x0f, 0x02, 0x08, 0x0e, 0x0c, 0x00, 0x01, 0x0a, 0x06, 0x09, 0x0b, 0x05,
        0x00, 0x0e, 0x07, 0x0b, 0x0a, 0x04, 0x0d, 0x01, 0x05, 0x08, 0x0c, 0x06, 0x09, 0x03, 0x02, 0x0f,
        0x0d, 0x08, 0x0a, 0x01, 0x03, 0x0f, 0x04, 0x02, 0x0b, 0x06, 0x07, 0x0c, 0x00, 0x05, 0x0e, 0x09]
  
  S3 = [0x0a, 0x00, 0x09, 0x0e, 0x06, 0x03, 0x0f, 0x05, 0x01, 0x0d, 0x0c, 0x07, 0x0b, 0x04, 0x02, 0x08,
        0x0d, 0x07, 0x00, 0x09, 0x03, 0x04, 0x06, 0x0a, 0x02, 0x08, 0x05, 0x0e, 0x0c, 0x0b, 0x0f, 0x01,
        0x0d, 0x06, 0x04, 0x09, 0x08, 0x0f, 0x03, 0x00, 0x0b, 0x01, 0x02, 0x0c, 0x05, 0x0a, 0x0e, 0x07,
        0x01, 0x0a, 0x0d, 0x00, 0x06, 0x09, 0x08, 0x07, 0x04, 0x0f, 0x0e, 0x03, 0x0b, 0x05, 0x02, 0x0c]
  
  S4 = [0x07, 0x0d, 0x0e, 0x03, 0x00, 0x06, 0x09, 0x0a, 0x01, 0x02, 0x08, 0x05, 0x0b, 0x0c, 0x04, 0x0f,
        0x0d, 0x08, 0x0b, 0x05, 0x06, 0x0f, 0x00, 0x03, 0x04, 0x07, 0x02, 0x0c, 0x01, 0x0a, 0x0e, 0x09,
        0x0a, 0x06, 0x09, 0x00, 0x0c, 0x0b, 0x07, 0x0d, 0x0f, 0x01, 0x03, 0x0e, 0x05, 0x02, 0x08, 0x04,
        0x03, 0x0f, 0x00, 0x06, 0x0a, 0x01, 0x0d, 0x08, 0x09, 0x04, 0x05, 0x0b, 0x0c, 0x07, 0x02, 0x0e]
  
  S5 = [0x02, 0x0c, 0x04, 0x01, 0x07, 0x0a, 0x0b, 0x06, 0x08, 0x05, 0x03, 0x0f, 0x0d, 0x00, 0x0e, 0x09,
        0x0e, 0x0b, 0x02, 0x0c, 0x04, 0x07, 0x0d, 0x01, 0x05, 0x00, 0x0f, 0x0a, 0x03, 0x09, 0x08, 0x06,
        0x04, 0x02, 0x01, 0x0b, 0x0a, 0x0d, 0x07, 0x08, 0x0f, 0x09, 0x0c, 0x05, 0x06, 0x03, 0x00, 0x0e,
        0x0b, 0x08, 0x0c, 0x07, 0x01, 0x0e, 0x02, 0x0d, 0x06, 0x0f, 0x00, 0x09, 0x0a, 0x04, 0x05, 0x03]
  
  S6 = [0x0c, 0x01, 0x0a, 0x0f, 0x09, 0x02, 0x06, 0x08, 0x00, 0x0d, 0x03, 0x04, 0x0e, 0x07, 0x05, 0x0b,
        0x0a, 0x0f, 0x04, 0x02, 0x07, 0x0c, 0x09, 0x05, 0x06, 0x01, 0x0d, 0x0e, 0x00, 0x0b, 0x03, 0x08,
        0x09, 0x0e, 0x0f, 0x05, 0x02, 0x08, 0x0c, 0x03, 0x07, 0x00, 0x04, 0x0a, 0x01, 0x0d, 0x0b, 0x06,
        0x04, 0x03, 0x02, 0x0c, 0x09, 0x05, 0x0f, 0x0a, 0x0b, 0x0e, 0x01, 0x07, 0x06, 0x00, 0x08, 0x0d]
  
  S7 = [0x04, 0x0b, 0x02, 0x0e, 0x0f, 0x00, 0x08, 0x0d, 0x03, 0x0c, 0x09, 0x07, 0x05, 0x0a, 0x06, 0x01,
        0x0d, 0x00, 0x0b, 0x07, 0x04, 0x09, 0x01, 0x0a, 0x0e, 0x03, 0x05, 0x0c, 0x02, 0x0f, 0x08, 0x06,
        0x01, 0x04, 0x0b, 0x0d, 0x0c, 0x03, 0x07, 0x0e, 0x0a, 0x0f, 0x06, 0x08, 0x00, 0x05, 0x09, 0x02,
        0x06, 0x0b, 0x0d, 0x08, 0x01, 0x04, 0x0a, 0x07, 0x09, 0x05, 0x00, 0x0f, 0x0e, 0x02, 0x03, 0x0c]
  
  S8 = [0x0d, 0x02, 0x08, 0x04, 0x06, 0x0f, 0x0b, 0x01, 0x0a, 0x09, 0x03, 0x0e, 0x05, 0x00, 0x0c, 0x07,
        0x01, 0x0f, 0x0d, 0x08, 0x0a, 0x03, 0x07, 0x04, 0x0c, 0x05, 0x06, 0x0b, 0x00, 0x0e, 0x09, 0x02,
        0x07, 0x0b, 0x04, 0x01, 0x09, 0x0c, 0x0e, 0x02, 0x00, 0x06, 0x0a, 0x0d, 0x0f, 0x03, 0x05, 0x08,
        0x02, 0x01, 0x0e, 0x07, 0x04, 0x0a, 0x08, 0x0d, 0x0f, 0x0c, 0x09, 0x00, 0x03, 0x05, 0x06, 0x0b]
  
  S = [S1, S2, S3, S4, S5, S6, S7, S8]
  
  def self.run(r, k)    
    b = [] # b[0..7] is e_xor_k prepped as 8 6-bit arrays for s-box substitution.
    m = [] # m[0..7] is the row of the value when performing a s-box lookup.
    n = [] # n[0..7] is the column of the value when performing a s-box lookup.
    
    e = E.collect{|p| r[p - 1]} # Expand r (right half data block) using E.
    
    e_xor_k = XOR.run(e, k) # X-or e (expanded r) with k (the sub key).
    
    # Break e_xor_k into 8 6-bit arrays and find both m (s-box row) and n (s-box column) for the s-box lookup.
    8.times do |i|
      b << []
        6.times do 
        b[i] << e_xor_k.shift
      end
      
      m << [b[i].first, b[i].last].join.to_i(2) * 16 # [1, 0, 1, 0, 1, 0] => [1, 0] => 2 => 32 => 3rd row.
      n << b[i][1..4].join.to_i(2) # [1, 0, 1, 0, 1, 0] => [0, 1, 0, 1] => 5 => 6th column.
    end
    
    # Substitute every 6-bit array with the 4-bit array specified by the appropriate s-box.
    8.times do |i|
        b[i] = S[i][m[i] + n[i]].to_s(2).rjust(4, '0').split('').collect{|bit| bit.to_i}
    end
        
    return P.collect{|p| b.flatten[p - 1]}
  end
end