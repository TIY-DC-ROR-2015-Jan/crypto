require 'pry'

def letter_counter string
  letters = string.split("")
  result = {}

  letters.each do |l|
    if result[l]
      result[l] += 1
    else
      result[l] = 1
    end
  end

  result
end

pp letter_counter File.read "corpus.txt"
