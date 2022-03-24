class AnagramFinder
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_anagrams
    if is_a_file? && @dictionary[1] != nil
      anagrams_of_given_words
    else
      find_all_anagrams
    end
  end


  private

  def anagrams_of_given_words
    anagrams = []
    @dictionary[1..-1].each do |word|
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
    @signatures ||= hash_map_all_data
  end

  def hash_map_all_data
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
    if is_a_file?
      read_from(@dictionary[0])
    elsif @dictionary.is_a? Array
      @dictionary
    elsif @dictionary.is_a? String
      @dictionary.split(" ")
    end
  end

  def is_a_file?
    File.file?(@dictionary[0])
  end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def word_signature(word)
    word.chars.sort.join
  end
end

