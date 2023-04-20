# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

nouns: diary; diary entry; todo list; tasks; mobile phone numbers;

verbs: keep aka list (diary); read(diary entries); select(diary_entries_based_on_time_and_speed); list(tasks); list(mobiles_in_diary_entries)

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ Diary                      │         ┌──────────────────────────┐
│                            │         │                          │
│ ----------------           │         │ DiaryEntry               │
│ @diary_entries             │         │ -------------            │
│ @todo_list                 │         │ @text                    │
│ @contacts                  │         │ -------------            │
│ ----------------           │         │                          │
│ - add(diary entry)         │         │ - read(entry text)       │
│ - list(diary entries)      │         │ - count words            │
│ - read_all(diary entries)  │         │ - reading time           │
│ - select best entry to read│         │                          │
│                            │         │                          │
│ -add(Todo)                 │ ◄───────┤ - extract(mobiles)       │
│ - list completed todos     │         │                          │
│ - list incomplete todos    │         └──────────────────────────┘
│ -list(contacts)            │   owns a list of
└────────────────────────────┘
        ▲   owns a list of
        │
┌───────┴─────────────────┐
│ Todo                    │
│ -------------           │
│ @task                   │
│ @doneness               │
│ -----------             │
│ - read task             │
│ - mark as done          │
│ - check doneness        │
│                         │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @diary_entries = []
    @todo_list = []
    @contacts = []
  end

  def add(diary_entry) # diary_entry is an instance of DiaryEntry
    # diary_entry gets added to list of entries
    # returns nothing
  end

  def read(diary_entry)
    # returns text of the entry, as a string
  end

  def list_diary_entries
    # returns list of entries
  end

  def read_all
    # returns text of all diary entries, as a string
  end

  def select_best_entry_for_reading_time(wpm, minutes) # both integers
    # returns the longest diary entry that can be read fully 
    # at the WPM in the available time
  end

  # design the interface that handles Todo and mobile interactions!

end

class DiaryEntry
  def initialize(text) # text is a string
    @text = text
    # @mobiles = empty array ??
  end

  def read
    # returns text as string
  end

  def count_words
    # returns total number of words in text
  end

  def reading_time(wpm) # wpm is integer
    # returns ceiling of time taken to read text
  end

  def extract_mobile_numbers 
    # returns any mobile numbers from within entry, as strings
    # pushes into array ?
  end
end

Class Todo
  def initialize(task) # task is a string
    @task # task
    @doneness # boolean
  end

  def read
    # returns task 
  end

  def mark_done!
    # sets doneness to true
  end

  def done?
    # returns doneness
  end

end



```


```ruby
class MusicLibrary
  def initialize
    # ...
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    # Returns a list of track objects
  end
  
  def search_by_title(keyword) # keyword is a string
    # Returns a list of tracks with titles that include the keyword
  end
end

class Track
  def initialize(title, artist) # title and artist are both strings
  end

  def format
    # Returns a string of the form "TITLE by ARTIST"
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._