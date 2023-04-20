class MusicTracker
  def initialize
    @tracks = []
  end

  def list
    @tracks
  end

  def add(track)
    fail "Error: invalid input" if track.nil? || track.empty?
    @tracks << track
  end
end