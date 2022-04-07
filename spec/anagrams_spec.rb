require_relative '../lib/anagram_finder.rb'

describe "AnagramFinder" do
  context "find_anagrams() returns all anagrams" do
    let(:anagrams_wordlist_txt) { AnagramFinder.new("spec/files/wordlist.txt") }

    context "Always return array if words to find is empty" do
      it "returns an array if array is passed " do
        anagrams = AnagramFinder.new(["enlist"])
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to be_an_instance_of(Array)
      end
      it "returns an array if path to file is passed" do
        words_to_find = []
        anagram_value = anagrams_wordlist_txt.find_anagrams(words_to_find)
        expect(anagram_value).to be_an_instance_of(Array)
      end
      it "returns an array if string is passed" do
        anagrams = AnagramFinder.new("find some anagrams")
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to be_an_instance_of(Array)
      end
    end
  
    context "Return correct values" do
      it "AnagramFinder.new([\"enlist\", \"listen\", \"sort\", \"rots\", \"no\", \"yes\"])" do
        anagrams = AnagramFinder.new(["enlist", "listen", "sort", "rots", "no", "yes"])
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["enlist", "listen"], ["sort", "rots"]])
      end
      it "AnagramFinder.new(\"this is some text and includes words listen enlist sort rots\")" do
        anagrams = AnagramFinder.new("this is some text and includes words listen enlist sort rots")
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["listen", "enlist"], ["sort", "rots"]])
      end
      it "AnagramFinder.new(\"spec/files/word.txt\") return all anagrams" do
        anagrams = AnagramFinder.new("spec/files/word.txt")
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"], ["sort", "rots", "tors"]])
      end
    end

    context "find_anagrams() return anagrams for selected words" do
      context "Always returns array if words_to_find is not empty" do
        it "find_anagrams([enlist, sort])" do
          words_to_find = ['enlist', 'sort']
          anagram_value = anagrams_wordlist_txt.find_anagrams(words_to_find)
          expect(anagram_value).to be_an_instance_of(Array)
          end
      end
      context "Returns correct values" do
        it "find_anagrams([enlist, sort])" do
          words_to_find = ['enlist', 'sort']
          anagram_value = anagrams_wordlist_txt.find_anagrams(words_to_find)
          expect(anagram_value).to eq([["elints", "enlist", "inlets", "listen", "silent", "tinsel"], ["orts", "rots", "sort", "stor", "tors"]])
        end
      end
    end
  end
end
  
