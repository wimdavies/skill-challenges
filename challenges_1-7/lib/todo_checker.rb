def todo_checker(text)
  fail "Error: you must input text" if text.nil?
  fail "Error: you must input a string" if !text.is_a? String
  
  text.include? "#TODO"
end