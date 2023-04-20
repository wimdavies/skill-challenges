require "diary"
require "diary_entry"

RSpec.describe "integration" do
  describe "#add and #all" do
    it "return single entry" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "my_contents")
      my_diary.add(first_entry)
      expect(my_diary.all).to eq [first_entry]
    end

    it "return multiple entries" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "my_contents")
      second_entry = DiaryEntry.new("my_title", "my_contents")
      my_diary.add(first_entry)
      my_diary.add(second_entry)
      expect(my_diary.all).to eq [first_entry, second_entry]
    end
  end

  describe "#count_words" do
    it "returns count for single entry" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "my_contents")
      my_diary.add(first_entry)
      expect(my_diary.count_words).to eq 1
    end

    it "returns count for multiple entries" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "my_contents")
      second_entry = DiaryEntry.new("my_title", "my_contents")
      my_diary.add(first_entry)
      my_diary.add(second_entry)
      expect(my_diary.count_words).to eq 2
    end

    it "returns zero when contents are empty" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "")
      my_diary.add(first_entry)
      expect(my_diary.count_words).to eq 0
    end

    context "when no entries are given" do
      it "fails" do
        my_diary = Diary.new
        expect { my_diary.count_words }.to raise_error "Add at least one entry"
      end
    end
  end

  describe "#reading_time" do
    it "return reading time for a single entry" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "one two three")
      my_diary.add(first_entry)
      expect(my_diary.reading_time(1)).to eq 3
    end

    it "return reading time for multiple entries" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "one two three")
      second_entry = DiaryEntry.new("my_title", "one two three")
      my_diary.add(first_entry)
      my_diary.add(second_entry)
      expect(my_diary.reading_time(1)).to eq 6
    end

    it "return 0 when contents are empty" do
      my_diary = Diary.new
      first_entry = DiaryEntry.new("my_title", "")
      my_diary.add(first_entry)
      expect(my_diary.reading_time(1)).to eq 0
    end

    context "when wpm is 0" do
      it "fails" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "")
        my_diary.add(first_entry)
        expect { my_diary.reading_time(0) }.to raise_error "WPM must be greater than 0"
      end
    end
  end

  describe "#find_best_entry_for_reading_time" do
    context "returns single best entry when" do
      it "is given one valid entry" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "one two")
        my_diary.add(first_entry)
        result = my_diary.find_best_entry_for_reading_time(1, 2)
        expect(result).to eq first_entry
      end

      it "is given multiple valid entries" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "three")
        second_entry = DiaryEntry.new("my_title", "one two")
        my_diary.add(first_entry)
        my_diary.add(second_entry)
        result = my_diary.find_best_entry_for_reading_time(1, 2)
        expect(result).to eq second_entry
      end

      xit "is given multiple entries, one of which is valid" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "one two")
        second_entry = DiaryEntry.new("my_title", "one two three")
        my_diary.add(first_entry)
        my_diary.add(second_entry)
        result = my_diary.find_best_entry_for_reading_time(1, 2)
        expect(result).to eq first_entry
      end
    end

    context "no valid entries" do
      xit "returns a message to user" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "one two")
        second_entry = DiaryEntry.new("my_title", "one two three")
        my_diary.add(first_entry)
        my_diary.add(second_entry)
        result = my_diary.find_best_entry_for_reading_time(1, 1)
        expect(result).to eq "There are no entries that can be read in this time."
      end
    end

    context "when multiple 'best' entries exist" do
      xit "returns the first best entry" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "one two")
        second_entry = DiaryEntry.new("my_title", "three four")
        my_diary.add(first_entry)
        my_diary.add(second_entry)
        result = my_diary.find_best_entry_for_reading_time(1, 2)
        expect(result).to eq first_entry
      end
    end

    context "when wpm is 0" do
      xit "fails" do
        my_diary = Diary.new
        first_entry = DiaryEntry.new("my_title", "one two")
        my_diary.add(first_entry)
        expect { my_diary.find_best_entry_for_reading_time(0, 2) }.to raise_error "WPM must be greater than zero."
      end
    end
  end
end
