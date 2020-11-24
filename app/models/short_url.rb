class ShortUrl < ApplicationRecord

  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  PUBLIC_ATTRIBUTES = [:full_url, :title]

  validate :validate_full_url

  def short_code
  end

  def public_attributes
    Hash.new.tap do |h|
      PUBLIC_ATTRIBUTES.map { |k| h[k.to_s] = self.send(k) }
    end
  end

  def update_title!
  end

  private

  def validate_full_url
  end

end
