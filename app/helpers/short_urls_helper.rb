module ShortUrlsHelper
  def humanize_errors(ar_object)
    ar_object.errors.messages.map do |key, messages|
      messages.map do |message|
        "#{key} #{message}".humanize.capitalize
      end
    end.join(',')
  end
end
