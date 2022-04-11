require_relative '../lib/anagram_finder.rb'

describe "AnagramFinder" do
  context "#find_anagrams" do
    let(:anagrams_wordlist_txt) { AnagramFinder.new("spec/files/wordlist.txt") }
    context "when passed dictionary as a file" do
      it "returns array with anagrams" do
        anagrams = AnagramFinder.new("spec/files/word.txt")
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"], ["sort", "rots", "tors"]])
      end
    end
    
    context "when passed ditionary as a string" do
      it "returns array with anagrams" do
        anagrams = AnagramFinder.new("this is some text and includes words listen enlist sort rots")
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["listen", "enlist"], ["sort", "rots"]])
      end
    end

    context "when passed dictionary as array" do
      it "returns array with anagrams" do
        anagrams = AnagramFinder.new(["enlist", "listen", "sort", "rots", "no", "yes"])
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["enlist", "listen"], ["sort", "rots"]])
      end
      it "returns empty array when there are no matching anagrams" do
        anagrams = AnagramFinder.new(["no", "yes"])
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([])
      end
      it "it ignores letter case when metching anagrams" do
        anagrams = AnagramFinder.new(["ENLIST", "LISTEN", "SORT", "ROTS", "no", "yes"])
        words_to_find = []
        anagram_value = anagrams.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["ENLIST", "LISTEN"], ["SORT", "ROTS"]])
      end
      it "returns array of anagrams for selected words" do
        words_to_find = ["enlist"]
        anagram_value = anagrams_wordlist_txt.find_anagrams(words_to_find)
        expect(anagram_value).to eq([["elints", "enlist", "inlets", "listen", "silent", "tinsel"]])
      end
      it "ignores special charachters when matching anagrams" do
          words_to_find = ['way\'s']
          anagram_value = anagrams_wordlist_txt.find_anagrams(words_to_find)
          expect(anagram_value).to eq([["way's", "yaw's"]])
      end
    end
  end
end
