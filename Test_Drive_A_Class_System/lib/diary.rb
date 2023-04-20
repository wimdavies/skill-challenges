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
    fail "WPM must be greater than 0" if wpm < 1
    total_time = 0
    @entries.each do |entry|
      total_time += (entry.count_words / wpm.to_f).ceil
    end
    total_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "WPM must be greater than 0" if wpm < 1
    valid_entries = []
    # replace longform entry.reading_time with class method once implemented
    @entries.each do |entry|
      if (entry.count_words / wpm.to_f).ceil <= minutes
        valid_entries << entry
      end
    end

    if valid_entries.empty?
      "There are no entries that can be read in this time."
    else
      valid_entries.max_by { |entry| (entry.count_words / wpm.to_f).ceil }
    end
  end
end
