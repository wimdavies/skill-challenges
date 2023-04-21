# {{Diary, Todolist and Contacts}} Multi-Class Planned Design Recipe

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

> created diagram on Excalidraw

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @diary_entries # is an array
  end

  def add(diary_entry) # diary_entry is an instance of DiaryEntry
    # diary_entry gets added to list of entries
    # returns nothing
  end

  def list_diary_entries
    # returns list of entries
  end
end

class DiaryEntry
  def initialize(date, text) # date, text both strings
    @date = date
    @text = text
    # @mobiles = empty array ??
  end

  def read_date
    # returns date as string
  end

  def read_text
    # returns text as string
  end

  def count_words
    # returns total number of words in text
  end

  def reading_time(wpm) # wpm is integer
    # returns ceiling of time taken to read text
  end

  def extract_phone_numbers 
    # returns any phone numbers from text, as strings
    # pushes into array ?
  end
end

class PhoneBook
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @contacts # is an array
  end
  
  def list_contacts
    # returns list of contacts
  end

  def update_contacts_from_diary
    # extracts contacts from Diary's DiaryEntry instances, 
    # pushes them into contact list
  end
end

class DiaryReader
  def initialize(wpm, diary)
    # wpm is integer representing num of words reader can 
    # read in a minute
    # diary is an instance of Diary
  end

  def find_best_entry_to_read(time) # time is integer minutes
    # returns Diary's longest instance of DiaryEntry 
    # that can be read in the available time and @wpm
  end
end

class TodoList
  def initialize
    @todos # is an array
  def 

  def add(todo) # todo is an instance of Todo
  end

  def list_todos
  # returns list of Todo instances
  end
end

class Todo
  def initialize(task) # task is a string
    @task # task
  end

  def read_task
    # returns task 
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