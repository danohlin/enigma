require 'minitest/autorun'
require 'enigma.rb'

class EnigmaTest < Minitest::Test
  
  def setup
    @machine = Enigma.new
  end
  
  def test_Enigma_on
    assert_equal "class - I'm on",
      Enigma.on
  end

  def test_enigma_is_on
    assert @machine
    assert_equal "I'm on", @machine.on
  end
  
  def test_machine_right_mid_left_rotor
    assert_equal @machine.crypt("d"), 17
  end

end