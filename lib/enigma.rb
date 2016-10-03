class Enigma
  
  require_relative './enigma/Rotor.rb'
  require 'yaml'
  
  def self.on
    return "class - I'm on"
  end

  def initialize()
    settings = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), "settings.yml"))
    #p settings["rotors"]["right"]
    @right_rotor = Rotor.new(settings["rotors"]["right"], "right")
    @middle_rotor = Rotor.new(settings["rotors"]["middle"], "middle")
    @left_rotor = Rotor.new(settings["rotors"]["left"], "left")
    @reflector = Rotor.new(settings["rotors"]["reflector"], "reflector")
  end
  
  def chop_text(plaintext)
    cyphertext = ""
    plaintext.gsub!(/[^a-z]/i, '')
    plaintext.upcase!
    plaintext.split("").each do |i|
      cyphertext << crypt(i)
    end
    return cyphertext
  end
  
  def crypt(letter)
    right_mid = @right_rotor.pass_left((letter.ord - 'A'.ord) % 26)
    mid_left = @middle_rotor.pass_left(right_mid)
    left_reflector = @left_rotor.pass_left(mid_left)
    reflector_left = @reflector.pass_left(left_reflector)
    left_mid = @left_rotor.pass_right(reflector_left)
    mid_right = @middle_rotor.pass_right(left_mid)
    post_right = @right_rotor.pass_right(mid_right)
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

    puts machine.chop_text(plaintext)
  
  end
  
end
