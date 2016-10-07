class Rotor

  attr_accessor :indicator

  def path_to_resources
      File.join(File.dirname(File.expand_path(__FILE__)), @file_name)
  end
  #puts path_to_resources

  def initialize(rotor_number, position, ring_setting, ground_setting, notches)
    @rotor_number = rotor_number
    @position = position
    @ring_setting = ring_setting
    @indicator = ground_setting
    @file_name = "rotors/r#{@rotor_number}.txt"
    @notches = notches

    #puts File.read(path_to_resources)
    rotor_text = File.read(path_to_resources)
    #puts rotor_text
    #letter based wiring
    @wiring = rotor_text.split("")
    #number based wiring
    @num_wiring = []
    @wiring.each {|i| @num_wiring.push((i.ord - 'A'.ord) % 26)}
  end

  def rotate()
    if @position == "right" 
      @indicator = (@indicator + 1) % 26
    end
    if @position == "right" && @notches.has_value?(@indicator)
      $middle_rotor.indicator= (($middle_rotor.indicator + 1) %26)
    end
    if @position == "middle" && @notches.has_value?(@indicator + 1)
      @indicator = (@indicator + 1) % 26 #double step sequence
      $left_rotor.indicator= (($left_rotor.indicator + 1) %26)
    end


  end

  def pass_left(input)
    #letter based wiring
    #@wiring[input]
    #number based wiring
    (@num_wiring[(input - @ring_setting + @indicator) % 26] + @ring_setting - @indicator) % 26
  end
  
  def pass_right(input)
    (@num_wiring.index((input - @ring_setting + @indicator) % 26) + @ring_setting - @indicator) % 26
  end

end

