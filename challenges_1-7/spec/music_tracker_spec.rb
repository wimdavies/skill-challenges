require 'music_tracker'

RSpec.describe MusicTracker do
  it "#list returns an empty array when no tracks added" do
    my_tracks = MusicTracker.new
    expect(my_tracks.list).to eq []
  end
  
  it "#list returns one track when one track added" do
    my_tracks = MusicTracker.new
    my_tracks.add("Track_1")
    expect(my_tracks.list).to eq ["Track_1"]
  end

  it "#list returns multiple tracks when multiple added" do
    my_tracks = MusicTracker.new
    my_tracks.add("Track_1")
    my_tracks.add("Track_2")
    expect(my_tracks.list).to eq ["Track_1", "Track_2"]
  end
  
  context "#add fails" do
    it "when given an empty string" do
      my_tracks = MusicTracker.new
      expect { my_tracks.add("") }.to raise_error "Error: invalid input" 
    end

    it "when given nothing" do
      my_tracks = MusicTracker.new
      expect { my_tracks.add(nil) }.to raise_error "Error: invalid input" 
    end
  end
end