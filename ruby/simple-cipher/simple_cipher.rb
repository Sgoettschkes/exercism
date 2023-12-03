class Cipher
  ALPHABET = [*'a'..'z']

  attr_accessor :key

  def initialize(key = nil)
    @key = key || 100.times.map { ALPHABET.sample }.join
    fail ArgumentError, 'invalid chars in key' unless valid?(@key)
  end

  def encode(plaintext)
    plaintext.chars.zip(key.chars).map{|p, k| ALPHABET[(p.ord - 'a'.ord + k.ord - 'a'.ord) % ALPHABET.length]}.join
  end

  def decode(cypher)
    cypher.chars.zip(key.chars).map{|c, k| ALPHABET[c.ord - k.ord] }.join
  end

  def valid?(key)
    !key.empty? && key !~ /[^a-z]/
  end
end
