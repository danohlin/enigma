class Enigma
  
  require_relative './enigma/Rotor.rb'
  
  def self.on
    return "class - I'm on"
  end
  
  def initialize()
    @right_rotor = Rotor.new(1, "right")
    @middle_rotor = Rotor.new(2, "middle")
    @left_rotor = Rotor.new(3, "left")
    @reflector = Rotor.new("b", "reflector")
  end
  
  def crypt(text)
    #puts text.swapcase
    text.upcase!
    right_mid = @right_rotor.pass_left((text.ord - 'A'.ord) % 26)
    mid_left = @middle_rotor.pass_left(right_mid)
    left_reflector = @left_rotor.pass_left(mid_left)
    reflector_left = @reflector.pass_left(left_reflector)
    left_mid = @left_rotor.pass_right(reflector_left)
    mid_right = @middle_rotor.pass_right(left_mid)
    p post_right = @right_rotor.pass_right(mid_right)
    (post_right + 65).chr
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
