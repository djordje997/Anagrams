class Finder
  DICTIONARY = 'wordlist.txt'
    def initialize(word_list)
      @word_list = word_list
      @signatures = Hash.new
    end

    def find_anagrams
      signatures
      stored_anagrams = []
      @word_list.each do |word|
        stored_anagrams << anagrams_for_word(word)
      end
      stored_anagrams
    end

    private

    def signatures
      signatures ||= signatures_of_words_file
    end

    def signatures_of_words_file
      words_from_file = read_from(DICTIONARY)
      words_from_file.each do |line|
        word = line.chomp
        signature = sort_word(word)
        (@signatures[signature] ||=[]) << word
      end
      @signatures
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

