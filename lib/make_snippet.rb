def make_snippet(str)
  if str.split(" ").length > 5
    first_five_words = str.split(" ")[0..4].join(" ")
    "#{first_five_words}..."
  else
    return str
  end
end