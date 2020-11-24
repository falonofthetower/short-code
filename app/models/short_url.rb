class ShortUrl < ApplicationRecord

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  PUBLIC_ATTRIBUTES = [:full_url, :title]
  BASE = CHARACTERS.size

  validates :full_url, valid_url: true

  def self.find_by_short_code(code)
    ShortUrl.find_by(id: decode(code))
  end

  def short_code
    return nil unless full_url
    encode(id)
  end

  def public_attributes
    Hash.new.tap do |h|
      PUBLIC_ATTRIBUTES.map { |k| h[k.to_s] = self.send(k) }
    end
  end

  def update_title!
  end

  private

  def encode(id)
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
