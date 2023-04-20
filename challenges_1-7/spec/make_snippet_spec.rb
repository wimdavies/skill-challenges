require 'make_snippet'

RSpec.describe 'make_snippet method' do
  it "given an empty string, returns the same" do
    new_string = ""
    result = make_snippet(new_string)
    expect(result).to eq new_string
  end

  it "given a string up to 5 words long, returns that string" do
    new_string = "I love to code"
    result = make_snippet(new_string)
    expect(result).to eq new_string
  end

  it "given a string longer than 5 words, returns the first 5 plus '...'" do
    new_string = "I still really love to code"
    result = make_snippet(new_string)
    expect(result).to eq "I still really love to..."
  end
end