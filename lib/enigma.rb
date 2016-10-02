class Enigma
  
  require_relative './enigma/Rotor.rb'
  
  def self.on
    return "class - I'm on"
  end
  
  def initialize()
    @right_rotor = Rotor.new(1, "right")
  end
  
  def crypt(text)
    #puts text.swapcase

    @right_rotor.pass_left((text.ord - 'A'.ord) % 26)
    
  end
  

  
  def on
    return "I'm on"
  end
  
  
  if __FILE__ == $0
    
    machine = Enigma.new
    #puts machine.methods
    #machine.on
    
    puts "Enter letter to encrypt:"
    plaintext = STDIN.gets.chomp.upcase
    puts machine.crypt(plaintext)
  
  end
  
end
