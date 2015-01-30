require 'pry'

def letter_counter string
  letters = string.downcase.split("")
  result = {}

  letters.each do |l|
    next unless ('a'..'z').include? l
    if result[l]
      result[l] += 1
    else
      result[l] = 1
    end
  end

  result.sort_by { |k,v| v }.reverse.to_h
end

def encrypt string, shift='m'
  original = ('a'..'z').to_a
  shifted = (shift..'z').to_a + ('a'..shift).to_a

  result = ""
  string.downcase.split("").each do |letter|
    position = original.index letter
    if position
      result += shifted[position]
    else
      result += letter
    end
  end
  result
end

pp letter_counter File.read "corpus.txt"
pp encrypt "Hello, my name is James"
pp encrypt "Hello, my name is James", "f"
