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

def word_counter string
  words = string.downcase.split # or split(" ")
  result = {}

  words.each do |w|
    if result[w]
      result[w] += 1
    else
      result[w] = 1
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

def count_words_or_letters body
  puts "Letters or words (l/w)?"
  if gets.chomp == "w"
    word_counter body
  else
    letter_counter body
  end
end

if ARGV.first
  contents = File.read ARGV.first
  count_words_or_letters contents
else
  puts "What file should we count?"
  contents = File.read gets.chomp
  count_words_or_letters contents
end

pp encrypt "Hello, my name is James"
pp encrypt "Hello, my name is James", "f"
