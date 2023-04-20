require 'grammar_improver'

RSpec.describe "grammar_improver method" do
  
  it "given an empty string, returns false" do
    result = grammar_improver("")
    expect(result).to eq false
  end

  context "returning true for correct strings" do
    it "given capital and full stop" do
      result = grammar_improver("Grammatically correct.")
      expect(result).to eq true
    end

    it "given capital and question mark" do
      result = grammar_improver("Grammatically correct?")
      expect(result).to eq true
    end

    it "given capital and exclamation mark" do
      result = grammar_improver("Grammatically correct!")
      expect(result).to eq true
    end
  end

  context "returning false for incorrect strings" do
    it "given no cap, no punctuation" do
      result = grammar_improver("grammatically correct")
      expect(result).to eq false
    end

    it "given no cap, full stop" do
      result = grammar_improver("grammatically correct.")
      expect(result).to eq false
    end

    it "given no cap, exclamation" do
      result = grammar_improver("grammatically correct!")
      expect(result).to eq false
    end

    it "given no cap, invalid punctuation" do
      result = grammar_improver("grammatically correct/")
      expect(result).to eq false
    end
  end

  context "throws error when" do
    it "given nil" do
      expect{ grammar_improver(nil) }.to raise_error "Input must be a string"
    end

    it "given a non-string" do
      expect{ grammar_improver(7) }.to raise_error "Input must be a string"
    end
  end
end