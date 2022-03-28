#!/usr/bin/env ruby

require_relative '../lib/anagram_finder.rb'

def user_input(message_to_user)
    puts message_to_user
    gets.chomp.split(" ")
end

def print_anagrams(anagrams, words)
    all_anagrams_of_word = anagrams.find_anagrams(words)
    all_anagrams_of_word.each do |one_anagram|
      puts "Anagrams: #{one_anagram.join(" ")}"
    end
end

if ARGV[0] == nil
  input_content = user_input("Find anagrams in:")
  anagrams = AnagramFinder.new(input_content)
  while true
    words_to_find = user_input("Anagrams for word:")
    break if words_to_find.empty?
    print_anagrams(anagrams, words_to_find)
  end
    
  else
    input_content = []
    input_content << ARGV[0]
    words_to_find = ARGV[1..-1]
    anagrams = AnagramFinder.new(input_content)
    print_anagrams(anagrams,words_to_find)
end
