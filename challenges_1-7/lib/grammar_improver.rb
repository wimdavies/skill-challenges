def grammar_improver(text)
  fail "Input must be a string" if text.nil? || (!text.is_a? String)
  
  cap_first = text[0] == text[0].upcase unless text.empty?
  valid_ending = [".", "?", "!"].include? text[-1]

  if cap_first && valid_ending
    true    
  else
    false
  end
end