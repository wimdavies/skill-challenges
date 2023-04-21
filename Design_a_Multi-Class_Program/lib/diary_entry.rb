class DiaryEntry
  def initialize(date, text)
    @date = date
    @text = text
  end

  def read_date
    @date
  end

  def read_text
    @text
  end

  def count_words
    @text.split(" ").count
  end
end