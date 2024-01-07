=begin
[PROBLEM]
+ understand +
- write a program that with an input of a string, 
  will return the scrabble score for that word

+ input +
  - string

+ output +
  - integer

+ explicit + 
  - each letter of the string has a discrete value. 
  - add up the sum of the values and return

+ implicit +
  - case insensitive
  - empty / whitespace / nil returns `0`. 
  - minimum word lengfth is `1`.

+ questions + 
  - no max length of word? 

[EXAMPLE]
"CABBAGE"
letter => points * letter count
c => 3 * 1
a => 1 * 2
b => 3 * 2
g => 2 * 1
e => 1 * 1
==========
SUM : 14 (also the return value)

[DATA]
- hashes -- to create a key value system for letter and their value
- and array to iterate through the word input

[ALGORITHM]
class Scrabble
  HASH_CONSTANT -> stores values of each letter

  def initialize(word)
    @word = word.downcase
  end 
  
  def score
    -tally variable = 0
    - returns the total tally value. 
    - iterate through the @word, one letter at a time
      - obtains the value to the letter via HASH_CONSTANT
      taly += letter_value

    return tally as last line.
  end



=end
#[CODE]

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
    @scrabble_set = create_scrabble_values
  end
  
  def self.score(word)
    self.new(word).score
  end

  def score
    total_score = 0
    return total_score if invalid_word?(word) || word.nil?
    word.downcase.chars.each do |letter|
      total_score += @scrabble_set[letter] 
    end
    total_score
  end

  private
  def invalid_word?(input)
    input.class != String ||
    input.length == 0 || 
    input != input.strip
  end 

  def create_scrabble_values
    scrabble_set =    
    {
    one_values = %w(a e i o u l n r s t) => 1,
    two_values = %w(d g) => 2,
    three_values = %w(b c m p) => 3,
    four_values = %w(f h v w y) => 4,
    five_values = %w(k) => 5,
    eight_values = %w(j x) => 8,
    ten_values = %w(q z) => 10,
    }

    letter_set = Hash.new
    scrabble_set.each do |set, value|
      set.each {|letter| letter_set[letter] = value }
    end 
    letter_set
  end

end

#word = Scrabble.new("word")
# p Scrabble.new(" \t\n").score
