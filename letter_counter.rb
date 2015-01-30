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

pp letter_counter File.read "corpus.txt"
