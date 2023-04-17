require 'grammar_stats'

RSpec.describe GrammarStats do

  describe "#check" do
    it "fails when given an empty text string" do
      new_stats = GrammarStats.new
      expect { new_stats.check("") }.to raise_error "Text string must not be empty"
    end

    context "returns true when" do
      it "given cap and full stop" do
        new_stats = GrammarStats.new
        expect(new_stats.check("Hawaii.")).to eq true
      end

      it "given cap and question mark" do
        new_stats = GrammarStats.new
        expect(new_stats.check("Hawaii?")).to eq true
      end

      it "given cap and exclamation mark" do
        new_stats = GrammarStats.new
        expect(new_stats.check("Hawaii!")).to eq true
      end
    end

    context "returns false when" do 
      it "given no cap and no punctuation" do
        new_stats = GrammarStats.new
        expect(new_stats.check("hawaii")).to eq false
      end
    end
  end

  describe "#percentage_good" do 
    it "fails when asked to check 0 texts" do 
      new_stats = GrammarStats.new
      expect { new_stats.percentage_good }.to raise_error "No texts checked yet"
    end

    it "returns 0 when all texts have returned false" do 
      new_stats = GrammarStats.new
      new_stats.check("hawaii")
      expect(new_stats.percentage_good).to eq 0
    end 

    it "returns 100 when all texts have returned true" do 
      new_stats = GrammarStats.new
      new_stats.check("Hawaii.")
      expect(new_stats.percentage_good).to eq 100
    end 

    it "returns 50 when half the texts have returned true" do 
      new_stats = GrammarStats.new
      new_stats.check("Hawaii.")
      new_stats.check("Hawaii")
      expect(new_stats.percentage_good).to eq 50
    end 
  end 
end