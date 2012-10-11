load 'test_helper.rb'
load 'meta_programming_duck_typing.rb'

def test_currencies
  test_result = (5.dollars.in(:dollars) == 5)
  test_result = test_result && 5.dollars.in(:yen) == 5 / 0.013
  test_result = test_result && 5.dollars.in(:euros) == 5 / 1.292
  test_result = test_result && 5.dollars.in(:rupees) == 5 / 0.019

  return test_result
end

def test_palindrome
  test_result = ("foo".palindrome? == false)
  test_result = test_result && ("oo".palindrome? == true)
  test_result = test_result && ("a man a plan a canal panama".palindrome? == true)
  return test_result
end

def test_enumerable_palindrome
  test_result = ([1, 2, 3, 2, 1].palindrome? == true)
  test_result = test_result && [1, 2, 3, 2, 3].palindrome? == false
  test_result = test_result && "a man a plan a canal panama".palindrome? == true
  return test_result
end

run_test :test_currencies, "Test currencies"
run_test :test_palindrome, "Test palindrome"
run_test :test_enumerable_palindrome, "Test enumerable palindrome"
