class Enigma
  
  require_relative './enigma/Rotor.rb'
  require_relative './enigma/Plugboard.rb'
  require 'yaml'
  
  attr_accessor :right_rotor
  attr_accessor :middle_rotor
  attr_accessor :left_rotor
  
  def self.on
    return "class - I'm on"
  end

  def initialize()
    settings = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), "settings.yml"))
    rotor_settings = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), "rotor_settings.yml"))
    $right_rotor = Rotor.new(settings["rotors"]["right"], "right", settings["ring_setting"]["right"], settings["ground_setting"]["right"], rotor_settings["notches"][settings["rotors"]["right"]])
    $middle_rotor = Rotor.new(settings["rotors"]["middle"], "middle", settings["ring_setting"]["middle"], settings["ground_setting"]["middle"], rotor_settings["notches"][settings["rotors"]["middle"]])
    $left_rotor = Rotor.new(settings["rotors"]["left"], "left", settings["ring_setting"]["left"], settings["ground_setting"]["left"], rotor_settings["notches"][settings["rotors"]["left"]])
    @reflector = Rotor.new(settings["rotors"]["reflector"], "reflector", 0, 0, 0)
    @plugboard = Plugboard.new(settings["plugboard"])
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
    $middle_rotor.rotate()
    $right_rotor.rotate()
    p plugboard_in = @plugboard.pass((letter.ord - 'A'.ord) % 26)
    right_mid = $right_rotor.pass_left(plugboard_in)
    mid_left = $middle_rotor.pass_left(right_mid)
    left_reflector = $left_rotor.pass_left(mid_left)
    reflector_left = @reflector.pass_left(left_reflector)
    left_mid = $left_rotor.pass_right(reflector_left)
    mid_right = $middle_rotor.pass_right(left_mid)
    p post_right = $right_rotor.pass_right(mid_right)
    p plugboard_out = @plugboard.pass(post_right)
    (plugboard_out + 65).chr
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
