class CartesianProduct
  include Enumerable

  attr_accessor :xs, :ys

  def initialize(lhs, rhs)
    @xs, @ys = lhs, rhs
  end

  def each
    @xs.each do |x|
      @ys.each do |y|
        yield x, y
      end
    end
  end
end
