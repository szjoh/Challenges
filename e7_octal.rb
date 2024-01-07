=begin
Octal

Implement octal to decimal conversion. 
Given an octal input string, your program should produce a decimal output. 
Treat invalid input as octal 0.

Note: Implement the conversion yourself.
Don't use any built-in or library methods that perform the necessary c
onversions for you. 
In this exercise, the code necessary to perform the conversion is what we're looking for.

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

[PROBLEM]
-convert octal numbers to decimal numbers


input
- string of the integer (octal)
output
- integer (decimal)

explicit
- any invalid string should return 0

implicit
- integers that have 8 or 9 are invalid. return 0 .

[EXAMPLE]
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    skip
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    skip
    assert_equal 15, Octal.new('17').to_decimal

[DATA]
-ARRAY? HASH? 

[ALGO]
-class called Octal, and a method that converts the octal number into a decimal 
number, called `to_decimal`
- constructor method that takes a string input. 

class Octal
  def initialize(octal)
    @octal = octal.to_i
    # This will convert all inappropriate string numbers into 0, as well as 
    - simply turning the string into an integer. 
  end

  def to_decimal
    power = 0
    octal_digits = octal.digits => e.g: 123 => ["3", "2", "1"]
    - take the octal variable, iterate thorugh the digits, where
      we also have a seperate "power" variable that +=1 between each iteration. 
    iterate through the array, and make so that map [digits] { |digit| digit* (8^power) ; power +=1 } 
    }
    
  end
end

=end


class Octal

  def initialize(num)
    @octal = num.to_i
    validate_input(num)
  end

  def to_decimal
    octal_digits = octal.digits 
    power = 0

    octal_digits.map! do |digit|
      num = digit * (8**power)
      power += 1
      num
    end
    octal_digits.reduce(&:+)
  end

  private
  attr_accessor :octal

  def validate_input(num)
    @octal = 0 if num.match?(/[[:alpha:89]]/)
  end
end


