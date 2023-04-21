require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("date_1", "text_1")
    expect(entry_1.read_date).to eq "date_1"
    expect(entry_1.read_text).to eq "text_1"
  end

  describe "#count_words" do
    it "returns total words in text" do
      entry_1 = DiaryEntry.new("date_1", "one two")
      entry_2 = DiaryEntry.new("date_2", "one two three")
      expect(entry_1.count_words).to eq 2
      expect(entry_2.count_words).to eq 3
    end
  end
end