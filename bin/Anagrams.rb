#!/usr/bin/env ruby

require_relative '../lib/anagram.rb'

def user_input(message_to_user)
    puts message_to_user
    get_user_input = gets.chomp.split(" ")
    get_user_input
end

if ARGV[0] == nil
    input_content = user_input("Find anagrams for:")
else
    input_content = ARGV
end
p input_content
anagrams = Anagram.new(input_content)


