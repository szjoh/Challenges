=begin
[PROBLEM]

+ understand + 
  - write a program that takes a list of words and selects the correct 
    sublist that contains anagrams of that word. 
  - listen -> and program will select "inlets" from a list of other words
    such as google and banana. 
+ explicit + 
  - the word input will have to match one(?) word from a lsit of words
  - input is string 
  - output is array
+ implicit + 
  - word will have to match, in the characgter count.
  - case insensitive 
  - anagram word cannot be the same. e.g.: corn cannot select 'corn'
    from a list of words, but it can select 'cron'
+ questions + 
  - what is the return value when nothign matches? 'nil'? 
  - case sensitive? yes
  - if multiple matches, order does not matter ? ( no, but maybe sort,
    alphabetically. )
[EXAMPLE]
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
    # This one says that we can select more than one word from the list
    if it exists. 
    1) No match return []
    2) match returns match
    3) returns multiple matches
    4) not return almost anagrams (character count must match)
    5) cannot return the same word

[DATA]
- array 

[ALGORITHM]
- Class Anagram
    def initialize(string)
      @string = string
      # string is the word to find other anagrams amongst list.
      @matches = []
    end 

    def count_letters # helper method for match
      # iterates through the array in match method |word| 
      - chars and sort [apple] => "a", "e", "l", "p", "p"
      - iterate through and create a hash that counts the letters
      
    end

    def match(array)
      - returns an array of matched words, if any found
      [iterate through the list of array] 
      - if the word matches the same word (corn = corn) then skip
      - otherwise, call count_letters on the word, as well as on
        the potential anagram
      - store into matches array.
      return @matches array. 
    end 
=end
#[CODE]

class Anagram
  attr_accessor :string
  def initialize(string)
    @string = string.downcase
    @matches = []
  end 

  def count_letters(str)
    letter_count = Hash.new
    str.downcase.chars.sort.each do |letter|
      letter_count[letter] = str.downcase.chars.count(letter)
    end
    letter_count
  end

  def match(arr)
    arr.each do |word|
      next if word.downcase == string
      @matches << word if count_letters(word) == count_letters(string)
    end
    @matches
  end

end
