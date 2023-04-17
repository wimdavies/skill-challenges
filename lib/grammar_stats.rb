class GrammarStats
  def initialize
    @texts = []
    @results = []
  end

  def check(text)
    fail "Text string must not be empty" if text.empty?
    @texts << text
    start_cap = (text[0] == text[0].upcase)
    valid_endings = [".", "?", "!"]
    if start_cap && (valid_endings.include? text[-1])
      @results << true 
      true
    else
      @results << false 
      false
    end
  end

  def percentage_good
    fail "No texts checked yet" if @texts.empty?
    truth_count = 0 
    result_length = @results.length 
    @results.each {|result| truth_count += 1 if result == true } 
    (truth_count / result_length.to_f) * 100
  end
end


