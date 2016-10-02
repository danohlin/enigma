require 'minitest/autorun'
require 'enigma.rb'

class RightRotorTest < Minitest::Test
  
  def setup
    @machine = Enigma.new
    @right_rotor = Rotor.new(1, "right")
  end
  
  def test_machine_right_rotor
    assert_equal @machine.crypt("d"), 5
  end
  
  def test_right_rotor
    assert_equal @machine.crypt("d"), 5
  end
end