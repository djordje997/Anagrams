require_relative '../lib/anagram_finder.rb'

describe "all_anagrams method" do

  context "Always return array" do
    it "returns an array if array is passed" do
    anagrams = AnagramFinder.new(["enlist"])
    anagram_value = anagrams.all_anagrams
    expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array if path to file is passed" do
      anagrams = AnagramFinder.new("spec/files/wordlist.txt")
      anagram_value = anagrams.all_anagrams
      expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array if string is passed" do
      anagrams = AnagramFinder.new("find some anagrams")
      anagram_value = anagrams.all_anagrams
      expect(anagram_value).to be_an_instance_of(Array)
    end
  end

  context "Return correct values" do
    it "return anagram words of given array" do
      anagrams = AnagramFinder.new(["enlist", "listen", "sort", "rots", "no", "yes"])
      anagram_value = anagrams.all_anagrams
      expect(anagram_value).to eq([["enlist", "listen"], ["sort", "rots"]])
    end
    it "return anagram words if some text is passed" do
      anagrams = AnagramFinder.new("this is some text and includes words listen enlist sort rots")
      anagram_value = anagrams.all_anagrams
      expect(anagram_value).to eq([["listen", "enlist"], ["sort", "rots"]])
    end
    it "return all anagrams of file when path of file is given" do
      anagrams = AnagramFinder.new(["spec/files/word.txt"])
      anagram_value = anagrams.all_anagrams
      expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"], ["sort", "rots", "tors"]])
    end
  end
end

describe "find_anagrams(words_to_find) method" do

  context "Always return array" do
    it "returns an array of words if first argument (ARGV[0]) is path to file" do
    anagrams = AnagramFinder.new(["spec/files/wordlist.txt"])
    words_to_find = []
    anagram_value = anagrams.find_anagrams(words_to_find)
    expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array of words if first argument (ARGV[0]) is path to file and rest are words to be found" do
      anagrams = AnagramFinder.new(["spec/files/wordlist.txt"])
      words_to_find = ["enlist","sort"]
      anagram_value = anagrams.find_anagrams(words_to_find)
      expect(anagram_value).to be_an_instance_of(Array)
    end
    it "returns an array of words when prompt takes path to file and words to be found(string)" do
      anagrams = AnagramFinder.new("spec/files/wordlist.txt")
      words_to_find = ["enlist"]
      anagram_value = anagrams.find_anagrams(words_to_find)
      expect(anagram_value).to be_an_instance_of(Array)
    end
  end

  context "Returns correct values" do
    it "returns all anagrams in file if first argument (ARGV[0]) is path to file" do
    anagrams = AnagramFinder.new(["spec/files/word.txt"])
    words_to_find = []
    anagram_value = anagrams.find_anagrams(words_to_find)
    expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"], ["sort", "rots", "tors"]])
    end
    it "returns only anagrams of selected if first argument (ARGV[0]) is path to file and rest are words to be found" do
      anagrams = AnagramFinder.new(["spec/files/word.txt"])
      words_to_find = ["enlist"]
      anagram_value = anagrams.find_anagrams(words_to_find)
      expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"]])
    end
    it "returns an array of words when prompt takes path to file and words to be found (string)" do
      anagrams = AnagramFinder.new("spec/files/word.txt")
      words_to_find = ["enlist"]
      anagram_value = anagrams.find_anagrams(words_to_find)
      expect(anagram_value).to eq([["enlist", "listen", "lisent", "silent"]])
    end
  end
end

  
