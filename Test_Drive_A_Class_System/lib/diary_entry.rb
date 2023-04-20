class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @current_position = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    words.count
  end

  def reading_time(wpm)
    fail "WPM must be greater than 0" if wpm < 1
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "WPM and minutes must both be greater than 0" if wpm < 1 || minutes < 1
    words_we_can_read = wpm * minutes
    start_position = @current_position
    end_position = @current_position + words_we_can_read
    list_of_words = words[start_position, end_position]
    if end_position >= count_words
      @current_position = 0
    else
      @current_position = end_position
    end
    list_of_words.join(" ")
  end

  private

  def words
    @contents.split(" ")
  end
end
