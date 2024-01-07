=begin
Robot Name

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. 
The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, 
which means that their name gets wiped. The next time you ask, it will 
respond with a new random name.

The names must be random; they should not follow a predictable sequence. 
Random names means there is a risk of collisions. 
Your solution should not allow the use of the same name twice.

[PROBLEM]
write a program that gives a random name to a robot. 

input
output

explicit
- cannot give a robot a name that is already assigned. 
-includes a method `reset` that 
implicit
- two letters 3 numbers is the general format of the name
- when a new Robot object is created, it generates a name

[EXAMPLE]

[DATA]
array

[ALGORITHM]
class Robot
  attr_reader :name
  @@all_names = []

  def initialize 
    -assign name -- use reset method
    check_repeition
    @@all_names << name 
  end 

  def reset
    name = "" 
    2.times select character 
    where we add the character into name 
    3.times select_number
    where we add the number into name 
    name =

  end 

  private 
  attr_writer :name

  def select_character
    create an array of a-z and sample from the array
  end 

  def select_number
    create an array of 0-9 and sample from the array. 
  end 

  def check_repetition()
    loop do 
      reset if a robot's name is already taken. 
      break unless @@all_names.include?(name)
    end 
  end 
end

=end

class Robot
  attr_reader :name
  @@all_names = []

  def initialize
    generate_name
    add_name_list if is_uniq?
    reset until is_uniq?
  end

  def reset
    old_name = name
    generate_name
    clean_up_name_list(old_name)
    add_name_list if is_uniq?
  end

  private
  attr_writer :name

  def generate_name
    @name = ""
    2.times { @name << generate_char("A".."Z") }
    3.times { @name << generate_char("0".."9") }
  end

  def generate_char(range)
    range.to_a.sample
  end

  def add_name_list
    @@all_names << name 
  end

  def clean_up_name_list(old_name)
    @@all_names.reject! {|robot| robot == old_name}
  end

  def is_uniq?
    @@all_names.uniq == @@all_names
  end
end
