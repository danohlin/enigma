require 'minitest/autorun'
require 'enigma.rb'

class RightRotorTest < Minitest::Test
  
  def setup
    @right_rotor = Rotor.new(1, "right", 0)
    @right_rotor_ring_1 = Rotor.new(1, "right", 1)
  end
  
  
  def test_right_rotor_pass_left
    assert_equal @right_rotor.pass_left(3), 5
  end
  
  def test_right_rotor_pass_right
    assert_equal @right_rotor.pass_right(5), 3
  end
  
  def test_right_rotor_ring_1_pass_left
    assert_equal @right_rotor_ring_1.pass_left(3), 13
  end
  
  def test_right_rotor_pass_right
    assert_equal @right_rotor_ring_1.pass_right(5), 1
  end

end