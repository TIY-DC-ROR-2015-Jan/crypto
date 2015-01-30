require 'pry'

def letter_counter string
  result = Hash.new 0
  string.chars.each { |l| result[l] += 1 }
  result
end

pp letter_counter File.read "corpus.txt"
