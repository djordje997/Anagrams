
require 'pry'
class AnagramFinder
  def initialize(dictionary)
    @file = 'wordlist.txt'
    @dictionary = dictionary
    @signatures = nil
  end

  def find_anagrams
    signatures
    if @dictionary[0].include? ".txt"
      stored_anagrams = find_all_anagrams(@signatures)
    else
      stored_anagrams = find_anagrams_for_selected_words(@dictionary)
    end
    stored_anagrams
  end

  private

  def find_anagrams_for_selected_words(words)
    anagrams = []
    words.each do |word|
      anagrams << anagrams_for_word(word)
    end
    anagrams
  end

  def find_all_anagrams(all_signatures)
    all_anagrams = []
    all_signatures.each do |key, value| 
        if value.size > 1 
          all_anagrams << value 
        end
      end
      all_anagrams
  end

  def signatures
    @signatures ||= signatures_of_words_file
  end

  def signatures_of_words_file
    all_signatures_from_file = Hash.new {|h, k| h[k] = []}
    words_from_file = read_from(@file)
    words_from_file.each do |line|
      word = line.chomp
      signature = sort_word(word)
      all_signatures_from_file[signature] << word
    end
    all_signatures_from_file
  end

  def anagrams_for_word(word)
    user_signature = sort_word(word)
    @signatures[user_signature]
  end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def sort_word(word)
    sorted_word = word.chars.sort.join
    sorted_word
  end
end

