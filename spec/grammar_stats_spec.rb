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

    context "returns false when"
      it "given no cap and no punctuation" do
        new_stats = GrammarStats.new
        expect(new_stats.check("hawaii")).to eq false
      end

  end

end