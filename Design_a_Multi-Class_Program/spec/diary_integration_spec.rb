require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'phone_book'

RSpec.describe "diary integration" do
  it "returns added diary entries from a list" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("date_1", "contents_1")
    entry_2 = DiaryEntry.new("date_2", "contents_2")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.list_entries).to eq [entry_1, entry_2]
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

    context "when a not-exactly-best entry exists" do
      it "returns that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("date_1", "one")
        entry_2 = DiaryEntry.new("date_2", "one two")
        entry_3 = DiaryEntry.new("date_3", "one two three")
        entry_4 = DiaryEntry.new("date_4", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(reader.find_best_entry_to_read(2)).to eq entry_3
      end
    end

    context "when no entry readable in time" do
      it "returns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("date_1", "one two three four five")
        diary.add(entry_1)
        expect(reader.find_best_entry_to_read(2)).to eq nil
      end
    end

    context "when no entries exist" do
      it "returns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        expect(reader.find_best_entry_to_read(1)).to eq nil
      end
    end

    context "when wpm invalid" do
      it "fails" do
        diary = Diary.new
        expect { 
          reader = DiaryReader.new(0, diary)
        }.to raise_error "WPM must be greater than 0."
      end
    end
  end

  describe "PhoneBook behaviour" do
    it "lists contacts extracted from entries" do
      diary = Diary.new
      phone_book = PhoneBook.new(diary)
      entry_1 = DiaryEntry.new("date_1", "Will is 07731505553")
      diary.add(entry_1)
      entry_2 = DiaryEntry.new("date_2", "Will is 07731505553, Dilbert is 07712345678, Phlange is 07777777777.")
      diary.add(entry_2)
      entry_3 = DiaryEntry.new("date_1", "Will lost his phone")
      diary.add(entry_3)
      expect(phone_book.contacts_from_diary).to eq [
        "07731505553", 
        "07712345678", 
        "07777777777"
      ]
    end
  end


end