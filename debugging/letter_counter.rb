class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0)
    most_common = nil
    most_common_count = 0
    @text.downcase.chars.each do |char|
      next unless is_letter?(char)
      counter[char] += 1
      # binding.irb
      if counter[char] > most_common_count
        most_common = char
        most_common_count += 1
      end
    # binding.irb
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    check = letter =~ /[a-z]/i
    check != nil
  end
end

counter = LetterCounter.new("Amaazon Prime")
p counter.calculate_most_common

# Intended output:
# [2, "i"]