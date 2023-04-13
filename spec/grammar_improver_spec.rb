require 'grammar_improver'

RSpec.describe "grammar_improver method" do
  
  it "given an empty string, returns false" do
    result = grammar_improver("")
    expect(result).to eq false
  end

end