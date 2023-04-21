class DiaryEntry
  def initialize(date, text)
    @date = date
    @text = text
    # @mobiles = empty array ??
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

  def extract_phone_numbers 
    # returns any phone numbers from text, as strings
    # pushes into array ?
  end
end