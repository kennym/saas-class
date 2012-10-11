load 'basic_oop.rb'
load 'test_helper.rb'

def test_dessert_constructor
  test_result = true
  name = "dessert_name"
  calories = 200

  @d = Dessert.new(name, calories)

  test_result = (@d.name == name)
  test_result = test_result && (@d.calories == calories)

  return test_result
end

def test_healthy
  test_result = true

  @d = Dessert.new
  test_result = (@d.healthy? == true)
  @d.calories = 300
  test_result = test_result && (@d.healthy? == false)

  return test_result
end

def test_delicious
  test_result = true

  @d = Dessert.new
  test_result = (@d.delicious? == true)

  return test_result
end

def test_jelly_bean_constructor
  test_result = true
  name = "dessert_name"
  calories = 200
  flavor = "any"

  @j = JellyBean.new(name, calories, flavor)

  test_result = (@j.name == name)
  test_result = test_result && (@j.calories == calories)
  test_result = test_result && (@j.flavor == flavor)

  return test_result
end

def test_jelly_bean_delicious
  test_result = true

  name = "dessert_name"
  calories = 200
  flavor = "any"

  @j = JellyBean.new(name, calories, flavor)

  test_result = (@j.delicious? == true)
  @j.flavor = "black lickorice"
  test_result = test_result && (@j.delicious? == false)

  return test_result
end

run_test :test_dessert_constructor, "Test desert class constructor"
run_test :test_healthy, "Test healthy? method"
run_test :test_delicious, "Test delicious? method"
run_test :test_jelly_bean_constructor, "Test Jelly Bean class constructor"
run_test :test_jelly_bean_delicious, "Test Jelly Bean delicious? method"

