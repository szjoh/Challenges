=begin
[PROBLEM]
Understand:
Write some code that converts modern decimal numbers into their 
Roman number equivalents.

input
- arabic numerals (integers)

output
- roman numerals (string)

implicit
- output does not repeat a letter more than 3 times. IV, not IIII for `4`. 


explicit
- no number for `0`. 
- make so that this program works for 1-3000 inclusive.

(questions?)
- What happens if you get `0` output -- do we return `nil`? 

[EXAMPLE]
input -> 1
output -> "I"

input -> 48
output -> "XLVIII"

VALUES OF THE LETTERS: 
I -> 1
V -> 5
X -> 10
L -> 50
C -> 100
D -> 500
M -> 1000

[DATA]
- array, then to hash might be easier. 
- HASHES? to hold the values { 1 -> "I"}

[ALGO]
- create 3 constants to hold the values of the numbers
- zip the arabic and roman values into one constant to create a "key"
  and convert into a hash. 

- create an algorithm that takes the input e.g.: 163, and break it down 
into the ones, tens, hundreds, thousands.
- [100, 60, 3]
  - consider getting the digits (1, 6, 3), turn into array, then multiply 
  by the value of x, starting at 1, and incrementing 10x per digit. 
  3*1, 6*10, 1*100... so on
  - might require reversing the digit array, then iterating through 
  then multiply by x, then *=10 for each "round"
  since 163 -> C LX III, reverse back. [3, 60, 100] -> [100, 60, 3]

  - create cases statments that "sort" the values into its proper "translation-bin"
  - (1..9)
  - (10..90)
  - (100..900)
  - (1000+) 

  -some method that "adds" 
  I, II, III
  VI, VII, VIII 

  if the digit includes 4 or 9: 
    - some method that "subtracts" ->  IV, IX (4, 9),

Class Roman Numeral
    attr_accessor :number, :sparsed_number

helper methods: 
  - def add 
  - def subtract
  - def sparse
  - 
def initialize
    - set @number to the value passed in when instantiating the object
    - @sparsed_number => set to the array version that is seperated into the tens, hundreds.. ect. 

def to_roman
  - give converted value
[CODE]
=end

class RomanNumeral
  attr_accessor :number, :sparsed_number

  ARABIC_NUMERALS = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000, 5000]
  ROMAN_NUMERALS = %w(I IV V IX X XL L XC C CD D CM M -V)
  NUMBER_MAP = ARABIC_NUMERALS.zip(ROMAN_NUMERALS).to_h

  def initialize(num)
    @number = num
    @sparsed_number = sparse(@number).reverse
  end

  def sparse(num)
    increment = 1
    number.digits.map do |digit| 
      incremented_num = digit * increment
      increment *= 10
    incremented_num
    end
  end

  def select_operation(num)
    if NUMBER_MAP[num] == nil
      repetitive_adds(num)
    else
      NUMBER_MAP[num]
    end
  end

  def repetitive_adds(num)
    inc, mid = find_roman(num)
    adds = ""
    add_value = 0
    add_value += NUMBER_MAP.key(mid) if num > NUMBER_MAP.key(mid)
    
    loop do
      break if add_value >= num
      adds += inc
      add_value += NUMBER_MAP.key(inc)
    end 

    if num < NUMBER_MAP.key(mid)
      adds
    else
      mid + adds
    end
  end

  def find_roman(num)
    case num 
    when (1..8) then increment, midpoint = ["I", "V"]
    when (9..80) then increment, midpoint = ["X", "L"]
    when (90..800) then increment, midpoint = ["C", "D"]
    when (900..3000) then increment, midpoint = ["M", "-V"]
    end
    [increment, midpoint]
  end

  def to_roman
    romans = ""
    sparsed_number.reject! { |digit| digit == 0}
    sparsed_number.each do |num|
      romans << select_operation(num)
    end
    romans
  end


end
