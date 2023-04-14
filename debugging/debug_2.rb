def encode(plaintext, key)
  puts "At this point, plaintext is #{plaintext} and key is #{key}"

  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  puts "#{cipher}"

  puts (cipher.find_index('z')).inspect
  ciphertext_chars = plaintext.chars.map do |char|
    # print (65 + cipher.find_index(char)).chr
    print (65 + cipher.find_index(char)).chr
  end

  return ciphertext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")


def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  return plaintext_chars.join
end

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"