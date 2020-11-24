module ShortUrlsHelper
  def humanize_errors(ar_object)
    ar_object.errors.messages.map do |k, messages|
      messages.map do |message| "#{k} #{message}".humanize.capitalize 
      end
    end.join(',')
  end
end
