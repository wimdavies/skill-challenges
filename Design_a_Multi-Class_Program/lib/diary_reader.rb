class DiaryReader
  def initialize(wpm, diary)
    fail "WPM must be greater than 0." if wpm < 1
    @wpm = wpm
    @diary = diary
  end

  def find_best_entry_to_read(time) 
    readable_entries = @diary.list_entries.select do |entry|
      calculate_reading_time(entry) <= time 
    end

    readable_entries.max_by do |entry|
      entry.count_words
    end
  end

  private

  def calculate_reading_time(entry)
    (entry.count_words / @wpm.to_f).ceil
  end
end