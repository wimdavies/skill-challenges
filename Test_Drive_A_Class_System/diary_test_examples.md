```ruby

# 1 one entry
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.list # => [first_entry]

# 2 multiple entries
my_diary = Diary.new
first_entry = DiaryEntry.new("my_title", "my_contents")
second_entry = DiaryEntry.new("my_title", "my_contents")
my_diary.add(first_entry)
my_diary.add(second_entry)
my_diary.list # => [first_entry, second_entry]

# 3 return empty list when no entries (diary unit test)
my_diary = Diary.new
my_diary.list # => []





```