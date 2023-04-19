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




```