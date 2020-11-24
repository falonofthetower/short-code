class ShortUrlsController < ApplicationController

  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      urls: ShortUrl.all.limit(100).as_json(
        only: [*ShortUrl::PUBLIC_ATTRIBUTES])
    }
  end

  def create
  end

  def show
  end

end
