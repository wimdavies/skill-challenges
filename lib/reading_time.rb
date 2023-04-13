def reading_time(text)
  if text.nil? 
    fail "Input must be a string"
  elsif !text.is_a? String
    fail "Input must be a string"
  else
    words = text.split(" ")
    total_words = words.count.to_f
    total_words * 0.005
  end
end