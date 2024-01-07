=begin
-create a clock independent of date 
- add/subtract minutes from the time represented by a given clock object. 
  -changing the time will result in a new clock object. 
- clock object that are the same time are equal to each other (*1) 
- no built in date/time functions -- just arithmetic operations
[PROBLEM]
- make a clock object.

input: 
output: clock object that has HH:MM 

implicit
- it can track hours
- it can change hours? -- yes, but it changes by given minutes (e.g. 75 minutes, not 
  1 hour, 15 mintes)
explicit
- it can track minutes
- it can change minutes

questions
- if the objects equal to each other, not necessarily the same object, 
just that when c1 == c2 then return true
- is it 12-hour clock or a 24? 
  - examples say 24.

[EXAMPLE]
  def test_past_the_hour
    skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end
  -this test shows that `at` method inside Clock class can take 2 parameteres.
  - it takes at least one, which shows hours. the second parameter represents the min. 
  - when not specified, the minutes are set to "00"

[DATA]

[ALGO]

`Clock` class, that contains an `at` method that returns the time.
- use of `-` and `+` to change the time given -- which returns a new clock object. 
- to_s method that returns the time in proper format HH:MM

class Clock
  def initialize
    @hour = 0
    @minute = 0
  end

  def self.at(hour, minutes=0)
  end

  def to_s
  "#{hour}:#{minutes}"
  # something to do with formating the HH:MM though. 
  end

  def -
    - a helper method to subract hours, if needed
    - a helper method that deals with negative minutes
  end 

  def +
    - a helper method to add the hours, if needed
    - a helper method to deal with minutes > 60
  end 

  private
  attr_accessor :hour, :minute

end
- some sort of mechanism,
if subracting / adding
  - take away /add the minutes from the "current" minute time.
  - format hour depending on minutes being - or >= 60
  - format minute depending on minutes being - or >= 60
  - create a new clock object with the proper hour / minute

=end

class Clock
  def initialize(hh=0, mm=0)
    @hour = hh
    @minute = mm
  end

  def self.at(hh, mm=0)
    clock = self.new(hh, mm)
  end

  def -(min)
    @minute -= min
    calculate_time
  end 

  def +(min)
    @minute += min
    calculate_time
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    "#{format_time(hour)}:#{format_time(minute)}"
  end

  protected 
  attr_accessor :hour, :minute

  private

  def format_time(time)
    format("%0#{2}d", time)
  end

  def calculate_time
    if @minute.negative? || @minute >= 60
      @hour += (@minute) / 60
      @minute = @minute % 60
    end
    @hour = @hour % 24

    self.class.new(@hour, @minute)
  end 

end 