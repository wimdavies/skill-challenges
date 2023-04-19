require "diary"

RSpec.describe Diary do
  describe "#all" do
    xit "returns empty list when no entries added" do
      my_diary = Diary.new
      expect(my_diary.all).to eq []
    end
  end

  describe "#reading_time" do
    context "when there are no entries" do
      xit "fails" do
        my_diary = Diary.new
        expect { my_diary.reading_time(1) }.to raise_error "add at least one entry"
      end
    end
  end
end
