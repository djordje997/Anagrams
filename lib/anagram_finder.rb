class AnagramFinder
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_anagrams
    find_all_anagrams(signatures)
  end

  private

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
    dictionary_words = dictionary_format(@dictionary)
    dictionary_words.each do |line|
      word = line.chomp
      signature = word_signature(word)
      all_signatures_from_file[signature] << word
    end
    all_signatures_from_file
  end

  def dictionary_format(dictionary)
    if File.file?(dictionary[0])
      words_from_file = read_from(dictionary[0])
    elsif @dictionary.is_a? Array
      words_from_file = dictionary
    elsif @dictionary.is_a? String
      words_from_file = dictionary.split(" ")
    end
  end

  def read_from(file_name)
    File.readlines(file_name)
  end

  def word_signature(word)
    word.chars.sort.join
  end
end

