require 'diary'
require 'diary_entry'
require 'diary_reader'

RSpec.describe "diary integration" do
  it "returns added diary entries from a list" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("date_1", "contents_1")
    entry_2 = DiaryEntry.new("date_2", "contents_2")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.list_diary_entries).to eq [entry_1, entry_2]
  end

  describe "diary reading behaviour" do
    context "when an exactly-best entry exists" do
      it "returns that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("date_1", "one")
        entry_2 = DiaryEntry.new("date_2", "one two")
        entry_3 = DiaryEntry.new("date_3", "one two three")
        entry_4 = DiaryEntry.new("date_4", "one two three four")
        entry_5 = DiaryEntry.new("date_5", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        diary.add(entry_5)
        expect(reader.find_best_entry_to_read(2)).to eq entry_4
      end
    end
  end


end