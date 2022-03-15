
class AnagramFinder
    def initialize(word_list, dictionary)
      @dictionary = dictionary
      @word_list = word_list
      @signatures = nil
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
      @signatures ||= signatures_of_words_file
    end

    def signatures_of_words_file
      all_signatures_from_file = Hash.new {|h, k| h[k] = []}
      words_from_file = read_from(@dictionary)
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

