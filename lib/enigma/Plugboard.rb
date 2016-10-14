class Plugboard
  
  def initialize(plugs)
    @plugs = plugs
  end
  
  
  def pass(input)
    if @plugs.key?(input)
      return @plugs[input]
    end
    if @plugs.value?(input)
      return @plugs.key(input)
    end
    return input
  end
  

end
