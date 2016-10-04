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
  
  def test_machine_right_mid_left_reflect_left_mid_right #only works if all rings are set to 0
    assert_equal @machine.crypt("D"), "U"
  end
  
  def test_machine_multichar_encrypt #only works if all rings are set to 0
    assert_equal @machine.chop_text("dd"), "UU"
  end

end