require 'pry'

def letter_counter string, mode=:characters
  result = Hash.new 0
  method = mode == :words ? :split : :chars
  string.downcase.send(method).
    select { |l| ('a'..'z').include? l }.
    each { |l| result[l] += 1 }

  result.sort_by { |k,v| -v }.to_h
end

def word_counter string
  counter string, :words
end

def encrypt string, shift='m'
  shifted = (shift..'z').to_a + ('a'...shift).to_a
  assignment = ('a'..'z').zip(shifted).to_h

  string.downcase.chars.map { |l| assignment.fetch l, l }.join
end

def prompt_for_file_path
  puts "What file should we count?"
  gets.chomp
end

file_path = ARGV.first || prompt_for_file_path
contents  = File.read file_path

puts "Letters or words (l/w)?"
counts = if gets.chomp == "w"
  word_counter contents
else
  counter contents
end

pp letter_counter File.read file_path
pp encrypt "Hello, my name is James"
pp encrypt "Hello, my name is James", "f"
