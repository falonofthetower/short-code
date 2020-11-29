class ValidUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    url = record.send(attribute)
    record.errors.add(attribute, "can't be blank") and return false if url.blank?

    uri = URI.parse(url)
    record.errors.add(attribute, 'is not a valid url') and return false unless uri&.host
    true
  rescue URI::InvalidURIError
    record.errors.add(attribute, 'is not a valid url')
  end
end
