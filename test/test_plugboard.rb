require 'minitest/autorun'
require 'enigma.rb'

class PlugboardTest < Minitest::Test
  
  def setup
    plugs = {0=>20, 1=>19, 2=>18, 3=>17, 4=>16, 5=>15, 6=>14, 7=>13, 8=>12, 9=>11}
    @plugboard = Plugboard.new(plugs)
  end
  
  def test_plugboard_pass_key
    assert_equal 19, @plugboard.pass(1)
  end
  
  def test_plugboard_pass_value
    assert_equal 2, @plugboard.pass(18)
  end
  
  def test_plugboard_pass_not_found
    assert_equal 24, @plugboard.pass(24)
  end
  
  
end