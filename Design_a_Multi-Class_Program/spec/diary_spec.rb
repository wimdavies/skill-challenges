require 'diary'

RSpec.describe Diary do
  it "initially has an empty list of entries" do
    diary = Diary.new
    expect(diary.list_entries).to eq []
  end
end