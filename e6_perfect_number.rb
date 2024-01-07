=begin
Perfect Number

The Greek mathematician Nicomachus devised a classification scheme for 
natural numbers (1, 2, 3, ...), 
identifying each as belonging uniquely to the categories of abundant, 
perfect, or deficient based on a comparison between the number and the 
sum of its positive divisors (the numbers that can be evenly divided into 
the target number with no remainder, excluding the number itself). 

For instance, the positive divisors of 15 are 1, 3, and 5. 
This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.
Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.

15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.

24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 
+ 12 = 36 which is greater than 24.

Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
Write a program that can tell whether a number is perfect, abundant, or deficient.

[Problem]
Perfect numbers have an Aliquot sum that is equal to the original number.
6: 1, 2, 3 => sum of which == 6
28: 1, 2, 4, 7, 14 => sum == 28

Abundant numbers have an Aliquot sum that is greater than the original number.
24: 1, 2, 3, 4, 6, 8, 12 => sum > 24


Deficient numbers have an Aliquot sum that is less than the original number.
15: 1, 3, 5 => sum < 15
all prime numbers are deficient

- Write a program that will determine the type of aliquot sum. (sum of multipliers - self)

input: integer
output: string "deficient", "perfect", "abundant"

explicit: 
- use only natural numbers (whole / positive)
- aliquot sum => integer's multipliers, except for itself.

implicit: 
- return standard error when numbers are not natural. 

[Examples]
13
- 1 -> deficient

28
- 1, 2, 4, 7, 14 -> perfect

12
- 1, 2, 3, 4, 6 -> abundant

DATA
array

Algorithm
Class PerfectNumber
  def self.classify(integer)

    -return stderr if integer is not natural (> 0)
        
  - create code that takes the array of multiples and turn that into the sum
  store output of [arr].reduce(&:+) as `sum`

  - take the sum, and use with case statement to determine the type of a. sum. 
    case sum 
    when sum == int
      perfect'
    when sum > int
      "abundant"
    when sum < int
      "deficient"
    end


  end
  -
    - create a method that takes the integer and returns an array of its multiples
  
  def multiples(integer)
    require 'math'
    multuples = []
    1..sqrt(integer)
    - ieterate through the rangeo of numebrs to find when integer % num == 0
    << that num into multiples array.
    - store the integer / num value into array. 
    - reject the value in the array if == integer.

    -multiples array as the return value of method.
  end 

end

=end

class PerfectNumber
  def self.classify(integer)
    raise StandardError if integer < 0
    sample = self.new
    aliquot_sum = sample.multiples(integer).sum 
    if aliquot_sum == integer
      "perfect"
    elsif aliquot_sum > integer
      "abundant"
    elsif aliquot_sum < integer
      "deficient"
    end
  end

  def multiples(integer)
    multiples = []
    (1..Math.sqrt(integer)).to_a.each do |num|
      if integer % num == 0
      multiples << num
      multiples << integer/num if integer / num != integer
      end
    end
    multiples
  end
end

=begin

LAUNCH SCHOOL SOLUTION 
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self ### HERE
  
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end

### create a class method by creating a "private instance" using `class << self`
this basically create a private class method

=end