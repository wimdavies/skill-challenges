require 'diary_entry'

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


  end



end