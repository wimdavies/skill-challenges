require 'diary_entry'

RSpec.describe DiaryEntry do
  it "makes a diary entry and returns title and contents" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end

  describe "#count_words" do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("my_title", "a short contents")
      expect(diary_entry.count_words).to eq 3
    end

    it "returns 0 when contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    it "given an expected wpm, returns estimated reading time (rounded up) for contents" do
      diary_entry = DiaryEntry.new("my_title", "word " * 550)
      expect(diary_entry.reading_time(200)).to eq 3
    end

    it "given wpm of 0, it fails" do
      diary_entry = DiaryEntry.new("my_title", "word " * 550)
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be greater than 0"
    end
  end

  describe "#reading_chunk" do
    context "given a contents readable within the given minutes" do
      it "returns the full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        result = diary_entry.reading_chunk(200, 1)
        expect(result).to eq "one two three"
      end
    end

    context "given a contents longer than readable within the given minutes" do
      it "returns the first chunk that can be read in that time" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end

      it "returns the next chunk, the second time it is called" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "three"
      end

      it "returns the first chunk, the third time it is called" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end

      it "restarts correctly if it finishes exactly on the end, the second time" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(1, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end
    end

    context "given wpm of 0" do
      it "fails" do
       diary_entry = DiaryEntry.new("my_title", "one two three")
        expect { diary_entry.reading_chunk(0, 5) }.to raise_error "WPM must be greater than 0"
      end
    end
  end
end