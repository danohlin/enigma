class Rotor

  def initialize(rotor_number, position)
    @rotor_number = rotor_number
    @position = position
    
    @file_name = "rotors/r#{@rotor_number}.txt"
    
    def path_to_resources
      File.join(File.dirname(File.expand_path(__FILE__)), @file_name)
    end
    #puts path_to_resources
    #puts File.read(path_to_resources)
    rotor_text = File.read(path_to_resources)
    #letter based wiring
    @wiring = rotor_text.split("")
    #number based wiring
    @num_wiring = []
    @wiring.each {|i| @num_wiring.push((i.ord - 'A'.ord) % 26)}
  end

  def pass_left(input)
    #letter based wiring
    #@wiring[input]
    #number based wiring
    @num_wiring[input]
  end
  
  def pass_right(input)
    @wiring.index(input)
  end

end

