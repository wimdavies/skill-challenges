class Diary
  def initialize
    @diary_entries = []
  end

  def add(diary_entry)
    @diary_entries << diary_entry
  end

  def list_entries
    @diary_entries
  end
end