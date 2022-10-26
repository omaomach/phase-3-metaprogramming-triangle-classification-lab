class Triangle

  attr_accessor :length, :height, :hyportenuse

  def initialize(length, height, hyportenuse)
    @length = length
    @height = height
    @hyportenuse = hyportenuse

  end

  def kind
    raise_error
    if (length == height) && (length == hyportenuse)
      :equilateral
    elsif (length == height) || (length == hyportenuse) || (height == hyportenuse)
      :isosceles
    # elsif (length != height) && (height != hyportenuse) && (length != hyportenuse)
    else
      :scalene
    end

  end

  # def error_method
  #   if ((length || height || hyportenuse) <= 0)
  #     raise TriangleError
  #   end

  #   if (length.negative? || height.negative? || hyportenuse.negative?)
  #     raise TriangleError
  #   end

  # end

  def sides_greater_than_zero?
    [length, height, hyportenuse].all?(&:positive?)
  end

  def triangle_inequality?
    (length + height) > hyportenuse && (length + hyportenuse) > height && (height + hyportenuse) > length  
  end

  def raise_error
    raise TriangleError unless sides_greater_than_zero? && triangle_inequality?
  end

  class TriangleError < StandardError

  end

end

t1 = Triangle.new(4,4,5)
puts t1.kind