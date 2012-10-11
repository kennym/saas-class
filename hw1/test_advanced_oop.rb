load 'test_helper.rb'
load 'advanced_oop.rb'

def test_attr_accessor_with_history
  @f = Foo.new
  @f.bar = 1
  @f.bar = 2

  test_result = (@f.bar_history == [nil, 1, 2])

  return test_result
end

run_test :test_attr_accessor_with_history, "Test `attr_accessor_with_history`"
