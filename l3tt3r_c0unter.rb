require 'pry'

def letter_counter string
  result = Hash.new 0
  string.downcase.chars.
    select { |l| ('a'..'z').include? l }.
    each { |l| result[l] += 1 }

  result.sort_by { |k,v| -v }.to_h
end

pp letter_counter File.read "corpus.txt"
