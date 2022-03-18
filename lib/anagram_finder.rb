require 'pry'

class AnagramFinder
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_anagrams
    find_all_anagrams(signatures)
  end

  private

  # def find_anagrams_for_selected_words(words)
  #   anagrams = []
  #   words.each do |word|
  #     anagrams << anagrams_for_word(word)
  #   end
  #   anagrams
  # end

  def find_all_anagrams(all_signatures)
    all_anagrams = []
    all_signatures.each do |value|
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
    words_from_file = read_from(@dictionary[0])
    words_from_file.each do |line|
      word = line.chomp
      signature = word_signature(word)
      all_signatures_from_file[signature] << word
    end
    all_signatures_from_file
  end

  # def anagrams_for_word(word)
  #   user_signature = sort_word(word)
  #   @signatures[user_signature]
  # end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def word_signature(word)
    word.chars.sort.join
  end
end

