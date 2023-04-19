require "diary_entry"

RSpec.describe DiaryEntry do
  describe "#title and #contents" do
    xit "constructs" do
      diary_entry = DiaryEntry.new("my_title", "my_contents")
      expect(diary_entry.title).to eq "my_title"
      expect(diary_entry.contents).to eq "my_contents"
    end
  end

  describe "#reading_time" do
    xit "returns reading time" do
      diary_entry = DiaryEntry.new("my_title", "one two")
      expect(diary_entry.reading_time(1)).to eq 2
    end

    context "when wpm is 0" do
      xit "fails" do
        diary_entry = DiaryEntry.new("my_title", "one")
        expect { my_diary.reading_time(0) }.to raise_error "WPM must be greater than 0."
      end
    end
  end

  describe "#reading_chunk" do
    context "given fully readable contents" do
      xit "returns entire contents" do
        diary_entry = DiaryEntry.new("my_title", "one")
        result = my_diary.reading_chunk(1, 1)
        expect(result).to eq "one"
      end
    end
    context "given not fully readable contents" do
      xit "returns first chunk on first call" do
        diary_entry = DiaryEntry.new("my_title", "one two")
        result = my_diary.reading_chunk(1, 1)
        expect(result).to eq "one"
      end

      xit "returns remaining chunk on second call" do
        diary_entry = DiaryEntry.new("my_title", "one two")
        my_diary.reading_chunk(1, 1)
        result = my_diary.reading_chunk(1, 1)
        expect(result).to eq "two"
      end

      xit "returns first chunk on third call" do
        diary_entry = DiaryEntry.new("my_title", "one two")
        my_diary.reading_chunk(1, 1)
        my_diary.reading_chunk(1, 1)
        result = my_diary.reading_chunk(1, 1)
        expect(result).to eq "one"
      end
    end

    context "when wpm is 0" do
      xit "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two")
        expect { my_diary.reading_chunk(0, 1) }.to raise_error "WPM and minutes must both be greater than 0"
      end
    end

    context "when minutes is 0" do
      xit "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two")
        expect { my_diary.reading_chunk(1, 0) }.to raise_error "WPM and minutes must both be greater than 0"
      end
    end
  end
end
