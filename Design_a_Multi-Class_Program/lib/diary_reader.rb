class DiaryReader
  def initialize(wpm, diary)
    @wpm = wpm
    @diary = diary
  end

  def find_best_entry_to_read(time) # time is integer minutes
    # returns Diary's longest instance of DiaryEntry 
    # that can be read in the available time and @wpm
  end

  private

  def calculate_reading_time
    
  end

end