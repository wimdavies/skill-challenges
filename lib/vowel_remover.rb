class VowelRemover
  def initialize(text)
    @text = text
    @vowels = ["a", "e", "i", "o", "u"]
  end

  def remove_vowels()
    i = 0
    while i < @text.length()
      binding.irb
      if @vowels.include? @text[i].downcase
        @text = @text.slice(0,i) + @text.slice(i+1..-1)
        binding.irb
      end
      i += 1
    end
    return @text
  end
end

remover = VowelRemover.new("E will remove the vowels from this sentence.")
puts remover.remove_vowels