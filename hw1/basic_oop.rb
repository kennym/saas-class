class Dessert
  attr_accessor :name, :calories

  def initialize(name="", calories=0)
    @name = name
    @calories = calories
  end

  def healthy?
    true ? calories < 200 : false
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor="")
    super name, calories
    @flavor = flavor
  end

  def delicious?
    @flavor.downcase != "black lickorice"
  end
end
