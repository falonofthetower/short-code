class ShortUrl < ApplicationRecord

  PUBLIC_ATTRIBUTES = [:full_url, :title]

  validates :full_url, valid_url: true

  scope :most_frequent, -> { reorder(click_count: :desc) }

  def self.find_by_short_code(code)
    ShortUrl.find_by_id(Bijective.decode(code))
  end

  def click
    with_lock do
      increment!(:click_count)
    end
  end

  def short_code
    return nil unless full_url
    Bijective.encode(id)
  end

  def public_attributes
    Hash.new.tap do |h|
      PUBLIC_ATTRIBUTES.map { |k| h[k.to_s] = self.send(k) }
    end
  end

  def update_title!
    update(title: URI.parse(full_url).open.read.match(%r{<title>(.*?)</title>})[1])
  end

end
