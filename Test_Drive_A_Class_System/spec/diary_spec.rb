require "diary"

RSpec.describe Diary do
  describe "#all" do
    it "returns empty list when no entries added" do
      my_diary = Diary.new
      expect(my_diary.all).to eq []
    end
  end

  describe "#reading_time" do
    context "when there are no entries" do
      it "fails" do
        my_diary = Diary.new
        expect { my_diary.reading_time(1) }.to raise_error "Add at least one entry"
      end
    end
  end

  describe "#find_best_entry_for_reading_time" do
    context "when there no entries" do
      it "fails" do
        my_diary = Diary.new
        expect { my_diary.find_best_entry_for_reading_time(1, 2) }.to raise_error "Add at least one entry"
      end
    end
  end
end
