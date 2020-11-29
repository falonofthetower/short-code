class Bijective

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  BASE = CHARACTERS.size

  def self.encode(id)
    i = id

    String.new('').tap do |code|
      while i.positive?
        code << CHARACTERS[i % BASE]
        i /= BASE
      end
    end.reverse
  end

  def self.decode(code)
    i = 0
    code.each_char { |c| i = i * BASE + CHARACTERS.index(c) }
    i
  end

end
