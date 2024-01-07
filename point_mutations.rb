=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, 
in particular DNA. 

Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect 
throughout the cell. 

Although mutations are technically mistakes, a very rare mutation may equip the cell with 
a beneficial attribute. 

In fact, the macro effects of evolution are attributable to the accumulated result of 
beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, 
which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from 
different genomes with a common ancestor, we get a measure of the minimum number of 
point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.

[PROBLEM]
understand:
- calculate the "Hamming Distance" between two strands of DNA

Questions: 
1) What is Hamming Distance
  + The number of point mutations (number of different bases) between two strands of DNA

Input
- Two strings? Two arguments, that are pointing to a string?
- 

Output
-Integer 

Explicit
- Count the difference between the two strands (string of letters)

Implicit
- What happens when the two strands are not the same length? Does it compare based off the first
  base, and continue on, until the shortest ends? 

- When given an empty string to compare to the empty string, return 0 
- presumably, the string is compared only as far as the shortest strand, so if 
one of the strands == 0, then that is what gets compared. 
[EXAMPLE]
assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
assert_equal 3, DNA.new('ACT').hamming_distance('GGA')

[DATA]
Array?

[ALGORITHM]
- Create a DNA class 
[methods]
[initialize]
- take the one arugment (to create a DNA object, a string)
  - turn into an array, where all the letters are split into its own elements. 
  'GTA' => ['G', 'T', 'A']

[hamming distance]
- takes one argument(other)
- create a counter to count the hamming_distance. 
- iterate through index of the two arrays, where unless arr1[index] == arr2[index] hamming_dsitance +=1
- return the hamming distance. 
=end

class DNA
  attr_accessor :strand
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(other_strand)
    hamming_distance = 0
    shorter_strand = strand.count <= other_strand.length ? strand : other_strand.chars

    shorter_strand.each_index do |idx| 
      hamming_distance += 1 unless strand[idx] == other_strand[idx]
    end

    hamming_distance
  end
end