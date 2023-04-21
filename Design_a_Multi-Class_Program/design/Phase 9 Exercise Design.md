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

  def list_entries
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
# > As a user
# > So that I can record my experiences
# > I want to keep a regular diary

# > As a user
# > So that I can reflect on my experiences
# > I want to read my past diary entries

# 1
# diary = Diary.new
# entry_1 = DiaryEntry.new("date_1", "contents_1")
# entry_2 = DiaryEntry.new("date_2", "contents_2")
# diary.add(entry_1)
# diary.add(entry_2)
# diary.list_diary_entries # => [entry_1, entry_2]


# > As a user
# > So that I can reflect on my experiences in my busy day
# > I want to select diary entries to read based on 
# how much time I have and my reading speed

# 2 when an exactly-best entry exists
# diary = Diary.new
# reader = DiaryReader.new(2, diary)
# entry_1 = DiaryEntry.new("date_1", "one")
# entry_2 = DiaryEntry.new("date_2", "one two")
# entry_3 = DiaryEntry.new("date_3", "one two three")
# entry_4 = DiaryEntry.new("date_4", "one two three four")
# entry_5 = DiaryEntry.new("date_5", "one two three four five")
# diary.add(entry_1)
# diary.add(entry_2)
# diary.add(entry_3)
# diary.add(entry_4)
# diary.add(entry_5)
# reader.find_best_entry_to_read(2) # => entry_4

# # 3 when an not-exactly-best entry exists
# diary = Diary.new
# reader = DiaryReader.new(2, diary)
# entry_1 = DiaryEntry.new("date_1", "one")
# entry_2 = DiaryEntry.new("date_2", "one two")
# entry_3 = DiaryEntry.new("date_3", "one two three")
# # entry_4 = DiaryEntry.new("date_4", "one two three four five")
# diary.add(entry_1)
# diary.add(entry_2)
# diary.add(entry_3)
# diary.add(entry_4)
# reader.find_best_entry_to_read(2) # => entry_3

# # 4 when no entry readable in time
# diary = Diary.new
# reader = DiaryReader.new(2, diary)
# entry_1 = DiaryEntry.new("date_1", "one two three four five")
# diary.add(entry_1)
# reader.find_best_entry_to_read(2) # => nil

# # 5 when no entries exist
# diary = Diary.new
# reader = DiaryReader.new(2, diary)
# reader.find_best_entry_to_read(1) # => nil

# # 6 when wpm invalid
# diary = Diary.new
# reader = DiaryReader.new(0, diary) # => throws an error "WPM must be greater than 0."

# > As a user
# > So that I can keep track of my tasks
# > I want to keep a todo list along with my diary

# 7 
todo_list = TodoList.new
todo_1 = Todo.new("Wash the dog")
todo_2 = Todo.new("Wash the dishes")
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_list.list_todos # => [todo_1, todo_2]

# > As a user
# > So that I can keep track of my contacts
# > I want to see a list of all of the mobile phone numbers # in all my diary entries

# 8 
# diary = Diary.new
# phone_book = PhoneBook.new(diary)
# entry_1 = DiaryEntry.new("date_1", "Will is 07731505553")
# diary.add(entry_1)
# entry_2 = DiaryEntry.new("date_2", "Will is 07731505553, Dilbert is 07712345678, Phlange is 07777777777.")
# diary.add(entry_2)
# entry_3 = DiaryEntry.new("date_1", "Will lost his phone")
# diary.add(entry_3)
# phone_book.update_contacts_from_diary
# phone_book.list_contacts # => [
#   "07731505553", 
#   "07712345678", 
#   "07777777777"
#   ]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# empty Diary

# DiaryEntry count_words

# more as we go

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._