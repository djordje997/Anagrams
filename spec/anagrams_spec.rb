require_relative '../lib/anagram_finder.rb'

describe "find_anagrams method" do

  context "Always return array" do
    it "returns an array if array is passed" do
    anagrams = AnagramFinder.new(["enlist"])
    anagram_value = anagrams.find_all_anagrams
    expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array if path to file is passed" do
      anagrams = AnagramFinder.new("spec/files/wordlist.txt")
      anagram_value = anagrams.find_all_anagrams
      expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array if string is passed" do
      anagrams = AnagramFinder.new("find some anagrams")
      anagram_value = anagrams.find_all_anagrams
      expect(anagram_value).to be_an_instance_of(Array)
    end
  end

  context "Return correct values" do
    it "return anagram words of given array" do
      anagrams = AnagramFinder.new(["enlist", "listen", "sort", "rots", "no", "yes"])
      anagram_value = anagrams.find_all_anagrams
      expect(anagram_value).to eq([["enlist", "listen"], ["sort", "rots"]])
    end
    it "return anagram words if some text is passed" do
      anagrams = AnagramFinder.new("this is some text and includes words listen enlist sort rots")
      anagram_value = anagrams.find_all_anagrams
      expect(anagram_value).to eq([["listen", "enlist"], ["sort", "rots"]])
    end
    it "return all anagrams of file when path of file is given" do
      anagrams = AnagramFinder.new(["spec/files/word.txt"])
      anagram_value = anagrams.find_all_anagrams
      expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"], ["sort", "rots", "tors"]])
    end
  end
end
  
