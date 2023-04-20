require "reading_time.rb"

RSpec.describe "reading_time method" do

  it "if an empty string is given, returns 0.0" do
    result = reading_time("")
    expect(result).to eq 0.0
  end

  it "if a string consisting of one word is given, return 0.005" do
    result = reading_time("obelisk")
    expect(result).to eq 0.005
  end

  it "if a string of 200 words is given, return 1.0" do
    result = reading_time("text " * 200)
    expect(result).to eq 1.0
  end

  it "if a string of one word (even if separator is implied but not actual) is given, return 0.005" do
    result = reading_time("texttexttext")
    expect(result).to eq 0.005
  end
  context "errors" do
    it "throws an error if given `nil`" do
      expect{ reading_time(nil) }.to raise_error "Input must be a string" 
    end

    it "throws an error if given an integer" do
      expect{ reading_time(666) }.to raise_error "Input must be a string"
    end
  end
end


# reading_time("") => 0.0
# reading_time("text") => 0.005
# reading_time("text " * 200) => 1.0
# reading_time("texttexttext") => 0.005
# reading_time(nil) throws an error
# reading_time(666) throws an error