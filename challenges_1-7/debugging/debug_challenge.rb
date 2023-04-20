def get_most_common_letter(text)
  # remove every character from text that is not a letter
  text.gsub!(/[^a-zA-Z]/, "")
  counter = Hash.new(0)

  text.chars.each do |char|
    counter[char] += 1
  end
  # now fetching the last element in the sort, not the first
  counter.to_a.sort_by { |k, v| v }[-1][0]
  # could also call reverse on the sorted array
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!").inspect

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"