```ruby

# 1 one entry
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.all # => [first_entry]

# 2 multiple entries
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
second_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.all # => [first_entry, second_entry]

# 3 return empty list when no entries (diary unit test)
my_diary = Diary.new
my_diary.all # => []

# 4  #count_words single entry
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.count_words # => 1

# 4  #count_words multiple entries
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
second_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.count_words # => 2

# 5 #count_words returns zero when empty contents
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "")
my_diary.add(first_entry)
my_diary.count_words # => 0

# 6 #count_words fails when no entries
my_diary = Diary.new
my_diary.count_words # => throws an error

# 7 #reading_time for single entry
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two three")
my_diary.add(first_entry)
my_diary.reading_time(1) # => 3

# 8 #reading_time for multiple entries
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two three")
second_entry = DiaryEntry.new("my_title", "one two three")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.reading_time(1) # => 6

# 9 #reading_time returns 0 when contents are empty
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "")
my_diary.add(first_entry)
my_diary.reading_time(1) # => 0

# 10 #reading_time fails when wpm is zero
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "")
my_diary.add(first_entry)
my_diary.reading_time(0) # => throws error

# 11 #reading_time fails when no entries(unit test)
my_diary = Diary.new
my_diary.reading_time(1) # => throws error

# 12 #find_best_entry_for_reading_time returns one valid entry when one entry is given
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
my_diary.add(first_entry)
my_diary.find_best_entry_for_reading_time(1, 2) #=> first_entry

# 13 #find_best_entry_for_reading_time returns best entry when two valid entries are given
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
second_entry = DiaryEntry.new("my_title", "three")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.find_best_entry_for_reading_time(1, 2) #=> first_entry

# 14 #find_best_entry_for_reading_time returns valid entry when one valid and one invalid entry are given
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
second_entry = DiaryEntry.new("my_title", "one two three")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.find_best_entry_for_reading_time(1, 2) #=> first_entry

# 15 #find_best_entry_for_reading_time returns message to user when no entries are valid
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
second_entry = DiaryEntry.new("my_title", "one two three")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.find_best_entry_for_reading_time(1, 1) #=> message

# 16 #find_best_entry_for_reading_time returns first valid entry when multiple best entries exist
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
second_entry = DiaryEntry.new("my_title", "three four")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.find_best_entry_for_reading_time(1, 2) #=> first_entry

# 17 #find_best_entry_for_reading_time fails when wpm is zero
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "one two")
my_diary.add(first_entry)
my_diary.find_best_entry_for_reading_time(0, 2) #=> throws error

# 18 #find_best_entry_for_reading_time fails when no entries(unit test)
my_diary = Diary.new
my_diary.find_best_entry_for_reading_time(1, 2) #=> throws error

# 19 #title & #contents returns title and contents(unit test)
diary_entry = DiaryEntry.new("my_title", "my_contents")
diary_entry.title #=> "my_title"
diary_entry.contents #=> "my_contents"

# chose not to encode
# 20 #title & #contents returns empty title and contents(unit test)
diary_entry = DiaryEntry.new("", "")
diary_entry.title #=> ""
diary_entry.contents #=> ""

# 21 #reading_time returns reading time (unit test)
diary_entry = DiaryEntry.new("my_title", "one two")
diary_entry.reading_time(1) #=> 2

# chose not to encode
# 22 #reading_time returns time of 0 for empty contents (unit test)
diary_entry = DiaryEntry.new("my_title", "")
diary_entry.reading_time(1) #=> 0

# 23 #reading_time fails when wpm is zero
diary_entry = DiaryEntry.new("my_title", "")
my_diary.reading_time(0) # => throws error

# chose not to encode
# 24 #reading_chunk returns empty string when contents is empty
diary_entry = DiaryEntry.new("my_title", "")
my_diary.reading_chunk(1, 1) # => ""

# 25 #reading_chunk returns entire contents when contents is fully readable
diary_entry = DiaryEntry.new("my_title", "one")
my_diary.reading_chunk(1, 1) # => "one"

# 26 #reading_chunk returns first chunk when contents is not fully readable
diary_entry = DiaryEntry.new("my_title", "one two")
my_diary.reading_chunk(1, 1) # => "one"

# 27 #reading_chunk returns remaining chunk on second call when contents is not fully readable 
diary_entry = DiaryEntry.new("my_title", "one two")
my_diary.reading_chunk(1, 1)
my_diary.reading_chunk(1, 1) # => "two"

# 28 #reading_chunk restarts with first chunk on third call when contents is not fully readable
diary_entry = DiaryEntry.new("my_title", "one two")
my_diary.reading_chunk(1, 1)
my_diary.reading_chunk(1, 1) 
my_diary.reading_chunk(1, 1) # => "one"

# 29 #reading_chunk fails when wpm is 0
diary_entry = DiaryEntry.new("my_title", "one two")
my_diary.reading_chunk(0, 1) # => throws an error "WPM and minutes must both be greater than 0"

# 30 #reading_chunk fails when minutes is 0
diary_entry = DiaryEntry.new("my_title", "one two")
my_diary.reading_chunk(1, 0) # => throws an error

```