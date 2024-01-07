=begin
Diamond

The diamond exercise takes as its input a letter, and outputs it in a diamond shape.
Given a letter, it prints a diamond starting with 'A', with the supplied letter at 
the widest point.

The first row contains one 'A'.
The last row contains one 'A'.

All rows, except the first and last, have exactly two identical letters.

The diamond is horizontally symmetric.
The diamond is vertically symmetric.

The diamond has a square shape (width equals height).
A  <= 'A' letter input

 a
b b <= 'b'
 a

  A
 B B
C   C <= 'c' letter input 
 B B
  A
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

[PROBLEM]
- Create a program that outputs a "letter-diamond" that is determined by the letter 
input. 
- letter input determimes the output diamond, as it its the center of the diamond.
INPUT: letter (string)
OUTPUT: diamond-shaped letters (strings)

explicit: the center / widest part of the diamond is determiend by the letter input
implicit: case insenstive? ('a' is "A") for the output diamond (or all input is upcase)


[EXAMPLES]
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"



[DATA]
-array? 

[ALGORITHM]
- "A".ord => 65 (ord_base = 65) 
- "B".ord => 66 - ord_base <- gives us the number of spaces required between the letters. 
- number of rows determine the spaces between the letters. 
"box" size. 
- if letter 'E
  -5 + 4 => 9
    "    [4][-5]   \n" => A
    "   [3] [-4]   " => B
    "  [2]   [-3]  " => C
    " [1]     [-2] " => D
  - "[0]       [-1]" => E
  - the letters will always be the same amount of space? 
leading up to: a b c d
letter 
reverse of leading up to [d c b a]
"letter_value" => "E" is 5; 5 + (5-1) => 9 (number of spaces)
"a" => 1 + (-0) => "1"
b" = (2) + 1 -> "3" 


class Diamond
  def self.make_diamond(letter) letter "E"
    - letteR_to_spaces("E") => 9
    - letter_template("E") => ["A", "B", "C", "D", "E", "D", "C", "B", "A"]
    itereate through the letter template. 
    - make so that each letter is assigned at the correct string index.
    spaces = " " * letteR_to_spaces
    half_point = letter_to_spaces / 2  - letter "a"
    other_half_point = (half_point + 1) * -1
    - each iteration (-1 to half_point), (+1 to other_half_point)
    - store the lette_space as a hash, with the letter as the key. + "\n"

    - store the string
    upto = [a b c d] (as the values, add them together. )
    "letter"
    + upto.reverse.
  end

  class << self
  private
  def letter_to_spaces
    LETTER_BASE = 64
    -take the letter input and convert into the spaces it will need to make 
    a square

    letter_value = (letter.ord - LETTER_BASE)
    num_of_spaces = letter_value + (letter_value - 1)
  end 

  def letter_template(letters)
    - find letter_to_spaces value based on letter
    alphabet ("A".."Z").to_a
    iterate through the alphabet until the letter on alphabet == letter
    upto_letters + letter + upto_letters.reverse
  end

end

=end
# CODE 

class Diamond
  def self.make_diamond(letter)
    template = letter_template(letter)
    reverse_letters = ((letter_template(letter)) - [letter]).reverse
    whole_template = template + reverse_letters

    letter_line_template = create_template(letter)
    final_string = ""
    whole_template.each do |char| 
      final_string += letter_line_template[char]
    end 
    final_string
  end 

  class << self
    private 

    def letter_to_spaces(letter)
      letter_value = (letter.ord - 64)
      num_of_spaces = letter_value + (letter_value - 1)
    end 

    def letter_template(letter)
      #- find letter_to_spaces value based on letter
      alphabet = ("A".."Z").to_a
      template = []
      alphabet.each do |character| 
        template << character
        break if character == letter
      end 
      #iterate through the alphabet until the letter on alphabet == letter
      #upto_letters + letter + upto_letters.reverse
      template
    end

    def indices(letter)
      spaces = letter_to_spaces(letter)
      half_point = spaces / 2
      other_half_point = (half_point + 1) * -1
      [half_point, other_half_point]
    end 

    def change_index(letter)
      half_point, other_half_point = indices(letter)
      half_point -= 1
      other_half_point += 1
      [half_point, other_half_point]
    end

    def reset_spaces(letter)
      spaces = " " * letter_to_spaces(letter)
    end

    def create_template(letter)
      spaces = reset_spaces(letter)
      template = letter_template(letter)

      letters_and_spaces = Hash.new
      half_point, other_half_point = indices(letter)
  
      template.each do |char| 
        spaces[half_point] = char
        spaces[other_half_point] = char
        letters_and_spaces[char] = spaces + "\n"
        spaces = reset_spaces(letter)
        half_point -= 1
        other_half_point +=1 
      end 
      letters_and_spaces
    end

  end 

end 

puts Diamond.make_diamond("A")