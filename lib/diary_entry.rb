class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.count
  end

  def reading_time(wpm) # must return an integer
    fail "WPM must be greater than 0" unless wpm > 0
    return (count_words / wpm.to_f).ceil # ceil rounds up, always
  end

  def reading_chunk(wpm, minutes)
    fail "WPM must be greater than 0" unless wpm > 0
    
    number_of_words_we_can_read = wpm * minutes
    start_from = @furthest_word_read
    end_at = @furthest_word_read + number_of_words_we_can_read
    word_list = words[start_from, end_at]
    if end_at >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(" ")
  end

  private

  def words
    @contents.split(" ")
  end
end