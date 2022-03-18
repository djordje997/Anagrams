#!/usr/bin/env ruby

require_relative '../lib/anagram_finder.rb'

def user_input(message_to_user)
    puts message_to_user
    get_user_input = gets.chomp.split(" ")
    get_user_input
end

if ARGV[0] == nil
    input_content = user_input("Find anagrams in:")
else
    input_content = ARGV
end

def print_anagrams(anagrams)
    all_anagrams_of_word = anagrams.find_anagrams
    all_anagrams_of_word.each do |one_anagram|
        puts one_anagram.join(" ")
    end
end

anagrams = AnagramFinder.new(input_content)
print_anagrams(anagrams)
