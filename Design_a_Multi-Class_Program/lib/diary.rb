class Diary
  def initialize
    @diary_entries = []
  end

  def add(diary_entry) # diary_entry is an instance of DiaryEntry
    @diary_entries << diary_entry
  end

  def list_diary_entries
    @diary_entries
  end
end