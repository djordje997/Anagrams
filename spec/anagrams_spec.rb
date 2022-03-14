require_relative '../lib/anagram_finder.rb'

describe "find_anagrams method" do
  it "returns an array " do
    anagrams = Finder.new(["enlist"])
    anagram_value = anagrams.find_anagrams
    expect(anagram_value).to be_an_instance_of(Array)
  end

  context "Find more than one anagram for one word" do
    it "returns array with multiple words" do
      anagrams = Finder.new(["enlist"]).find_anagrams
      anagrams_length = anagrams[0].length
      expect(anagrams_length).to be > 1
    end
  end

  context "Find anagrams for multiple words" do
    it "returns array with anagrams of two words" do
      anagrams = Finder.new(['enlist', 'sort']).find_anagrams
      anagrams_length = anagrams.length
      expect(anagrams_length).to be > 1
    end
  end
end
  
