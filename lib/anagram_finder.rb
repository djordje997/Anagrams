class AnagramFinder
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_anagrams
    find_all_anagrams
  end

  private

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
    if File.file?(@dictionary[0])
      read_from(@dictionary[0])
    elsif @dictionary.is_a? Array
      @dictionary
    elsif @dictionary.is_a? String
      @dictionary.split(" ")
    end
  end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def word_signature(word)
    word.chars.sort.join
  end
end

