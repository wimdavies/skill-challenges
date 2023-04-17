class GrammarStats
  def initialize
    @texts = []
  end

  def check(text)
    fail "Text string must not be empty" if text.empty?
    @texts << text
    start_cap = (text[0] == text[0].upcase)
    valid_endings = [".", "?", "!"]
      if start_cap && (valid_endings.include? text[-1])
        true
      else
        false
      end
  end

  # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.

  def percentage_good
    fail "No texts checked yet" if @texts.empty?
    0



    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end