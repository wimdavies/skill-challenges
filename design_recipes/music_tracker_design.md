# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class MusicTracker
  def initialize
    @tracks # tracks is a list of tracks, as an array
  end
  
  def add(track) # track is a string
    # returns nothing
  end

  def list
    # returns list of tracks as an array
  end
end

```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 1 
my_tracks = MusicTracker.new
my_tracks.add("Track_1")
my_tracks.list # => ["Track_1"]

# 2 
my_tracks = MusicTracker.new
my_tracks.add("Track_1")
my_tracks.add("Track_2")
my_tracks.list # => ["Track_1, Track_2"]

# 3 
my_tracks = MusicTracker.new
my_tracks.add("") # => throws an error

# 4
my_tracks = MusicTracker.new
my_tracks.list # => []

# 5
my_tracks = MusicTracker.new
my_tracks.add() # => throws an error

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
