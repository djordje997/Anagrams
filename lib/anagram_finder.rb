require "pry"

class AnagramFinder
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_anagrams(words_to_find)
      if words_to_find.empty?
        find_all_anagrams
      else
        anagrams_of_given_words(words_to_find)
      end
  end

  private

  def anagrams_of_given_words(words)
    anagrams = []
    words.each do |word|
      word
      anagrams << anagrams_for_word(word)
    end
    anagrams
  end

  def anagrams_for_word(word)
    selected_word = word_signature(word)
    signatures[selected_word]
  end
    
  def find_all_anagrams
    all_anagrams = []
    signatures.each do |key, value|
      if value.size > 1 
        all_anagrams << value
      end
    end
    all_anagrams
  end

  def signatures
    @signatures ||= load_dictionary
  end

  def load_dictionary
    all_signatures_from_file = Hash.new {|h, k| h[k] = []}
    dictionary_words = dictionary_parse
    dictionary_words.each do |line|
      word = line.chomp
      signature = word_signature(word)
      all_signatures_from_file[signature] << word
    end
    all_signatures_from_file
  end

  def dictionary_parse
    if @dictionary.is_a? String
      if File.file?(@dictionary)
        read_from(@dictionary)
      else
        @dictionary.split(" ")
      end
    elsif @dictionary.is_a? Array
      @dictionary
    end
  end

  def is_dictionary_path_to_file?
    File.file?(@dictionary[0]) || File.file?(@dictionary)
  end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def word_signature(word)
    word.chars.sort.join
  end
end
