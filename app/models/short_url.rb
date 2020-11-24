class ShortUrl < ApplicationRecord

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  PUBLIC_ATTRIBUTES = [:full_url, :title]

  validates :full_url, valid_url: true

  def short_code
  end

  def public_attributes
    Hash.new.tap do |h|
      PUBLIC_ATTRIBUTES.map { |k| h[k.to_s] = self.send(k) }
    end
  end

  def update_title!
  end

end
