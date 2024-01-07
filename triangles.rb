=begin
Write a program to determine whether a triangle is equilateral, 
isosceles, or scalene.

An equilateral triangle has all three sides the same length.
-uniq.count == 1

An isosceles triangle has exactly two sides of the same length.
- uniq.count == 2

A scalene triangle has all sides of different lengths.
- uniq.count == 3 

Note: For a shape to be a triangle at all, all sides must be of 
length > 0, 
and the sum of the lengths of any two sides must be greater 
than the length of the third side.
- private methods that verify 
def valid_triangle?


PROBLEM
- Create a program that determines what kind of triangle a given triangle is

- Input:
(1,2,3)
- either 3 parameters, or one array, containing three integers. 
-Output: 
"A triangle with a side of 1,2,3 is a #{triangle_type}"

- We can "throw an error" if the given parameters do not qualify for them
  to be a triangle -- invalid length and invalid triangle. 
Implicit:
- Our input will be given via 3 seperate parameters of a method.
- We need to create a Triangle class, where it takes 3 arguments. 
- has a method, `kind` that will return a string of iether 
'equilateral', 'scalene', or 'isoceles'
- can it take floats as well, based on example, so long as it is > 0
- Will raise an ArgumentError if parameters do not "fit" 

Explicit: 
- All sides must be greater than 0
- two smaller sides sum > largest

+ How to handle errors, if any of the explicit requirements are not met? 
+ Do we assume we always get three integers? 

E
1) (2,2,2)
D
-input: integer / float
- Work with array. 
-output: string 
A
Triangle Class. 
- take the three arguments, and create a sorted array. 
[10, 10, 2] => [2, 10, 10]
- check that all three elements are greater than 0 (is a positive number.
  - return ArugmentEror if false. 

- take the first two, add together, and verify if they are > last
- if false: Argument Error
- if true, continue. 
[verify triangle at initialize method]


[method that raises ARgument Error]

[def kind]
- Maybe( case) 
- use `uniq` method to determine how many unique elements
An equilateral triangle has all three sides the same length.
-uniq.count == 1

An isosceles triangle has exactly two sides of the same length.
- uniq.count == 2

A scalene triangle has all sides of different lengths.
- uniq.count == 3 
case sides.uniq.count
when 1
  "equo"
when 2
  "iso"
when 3
  "sca"
end




(C)
=end





#++++++++++++++++
class Triangle
  attr_accessor :kind
  def initialize(one, two, three)
    @sides = [one, two, three].sort
    raise ArgumentError unless verify_sides? && verify_positive?
  end

  def verify_sides?
    sides[0] + sides[1] > sides[2]
  end

  def verify_positive?  
    sides.select {|side| side > 0}.count == 3
  end

  def kind
    case sides.uniq.count
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  private
  attr_accessor :sides
end

t1 = Triangle.new(1,2,2)
p t1.kind

