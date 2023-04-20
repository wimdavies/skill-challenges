class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    fail "Add at least one entry" if @entries.empty?
    total_words = 0
    @entries.each do |entry|
      total_words += entry.count_words
    end
    total_words
  end

  def reading_time(wpm)
    fail "Add at least one entry" if @entries.empty?
    fail "WPM must be greater than 0" if wpm < 1
    total_time = 0
    @entries.each do |entry|
      total_time += entry.reading_time(wpm)
    end
    total_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "Add at least one entry" if @entries.empty?
    fail "WPM must be greater than 0" if wpm < 1
    valid_entries = []
    @entries.each do |entry|
      valid_entries << entry if entry.reading_time(wpm) <= minutes
    end

    if valid_entries.empty?
      "There are no entries that can be read in this time."
    else
      valid_entries.max_by { |entry| entry.reading_time(wpm) }
    end
  end
end
