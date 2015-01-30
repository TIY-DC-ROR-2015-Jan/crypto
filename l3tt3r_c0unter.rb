require 'pry'

def letter_counter string
  result = Hash.new 0
  string.downcase.chars.
    select { |l| ('a'..'z').include? l }.
    each { |l| result[l] += 1 }

  result.sort_by { |k,v| -v }.to_h
end

def encrypt string
  shifted = ('m'..'z').to_a + ('a'..'l').to_a
  assignment = ('a'..'z').zip(shifted).to_h

  string.downcase.chars.map { |l| assignment.fetch l, l }.join
end

pp letter_counter File.read "corpus.txt"
pp encrypt "Hello, my name is James"
