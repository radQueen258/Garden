#chomp is to erase the input's empty spaces and chomp! is going to save the changed one.
#Ruby pays attention to the order just like java and it's also case sensitive.

puts "-----------------Mask credit card---------------------"
puts " "

def maskify (input)
  array = input.split(//).reverse!
  flipped_array = []

    if array.length > 3
          array.each_with_index {|element, index|
            if index <= 3
                flipped_array << element
            else
                flipped_array << "#"
            end
          }
          flipped_array.reverse!
          print flipped_array.map! {|s| "#{s}" }.join()

        else
          puts input
    end
end

puts "The input:"

maskify("23423423423423")


puts " ------------------------Duplicate Characters--------------------------"
puts " "

def duplicate_char(word)
  word = word.downcase!
  result = ""

  word.each_char do |char|
    if word.count(char) > 1
      result += ")"

      else
        result += "("
    end
  end

  return result
end

example = "JOinIng"
encoded_string = duplicate_char(example)
puts encoded_string

puts "---------------------------------Shortest length String-------------------------- "
puts " "
def find_shortest_string (input)
  phrase = input.split(' ')
  shortest_string = phrase.first.length

  phrase.each do |word|
    word_length = word.length
    shortest_string = word_length if word_length < shortest_string
  end

  return shortest_string
end

input = "turns out random test cases are easier than writing out basic ones"
shortest_string = find_shortest_string(input)
puts shortest_string
