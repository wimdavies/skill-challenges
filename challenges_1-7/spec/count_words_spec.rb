require 'count_words'

RSpec.describe "count_words method" do
  it "given an empty string, returns 0" do
    empty_str = ""
    result = count_words(empty_str)
    expect(result).to eq 0
  end

  it "given a string 5 words long, returns 5" do
    new_str = "I am five words long"
    result = count_words(new_str)
    expect(result).to eq 5
  end
end