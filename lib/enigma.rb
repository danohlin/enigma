class Enigma
  
  require_relative './enigma/Rotor.rb'
  
  def self.on
    return "class - I'm on"
  end
  
  def initialize()
    @right_rotor = Rotor.new(1, "right")
    @middle_rotor = Rotor.new(2, "middle")
    @left_rotor = Rotor.new(3, "left")
  end
  
  def crypt(text)
    #puts text.swapcase
    text.upcase!
    right_mid = @right_rotor.pass_left((text.ord - 'A'.ord) % 26)
    mid_left = @middle_rotor.pass_left(right_mid)
    left_mid = @left_rotor.pass_left(mid_left)
    left_mid
  end
  

  
  def on
    return "I'm on"
  end
  
  
  if __FILE__ == $0
    
    machine = Enigma.new
    #puts machine.methods
    #machine.on
    
    puts "Enter letter to encrypt:"
    plaintext = STDIN.gets.chomp
    puts machine.crypt(plaintext)
  
  end
  
end
