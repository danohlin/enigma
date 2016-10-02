class Enigma
  
  def self.on
    puts "class - I'm on"
  end
  
  def initialize(names = "World")
    @names = names
  end
  
  def encrypt(text)
    text.swapcase
  end
  

  
  def on
    puts "I'm on"
  end
  
  
  if __FILE__ == $0
    
    machine = Enigma.new
    #puts machine.methods
    #machine.on
    
    puts "Enter letter to encrypt:"
    plaintext = STDIN.gets.chomp
    puts machine.encrypt(plaintext)
  
  end
  
end
