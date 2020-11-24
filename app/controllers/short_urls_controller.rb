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
    @short_url = ShortUrl.new(short_url_params)

    if @short_url.save
      render status: 200, json: { short_code: @short_url.short_code }
    else
      render status: 422, json: { errors: helpers.humanize_errors(@short_url) }
    end
  end

  def show
    set_short_url

    if @short_url
      redirect_to @short_url.full_url
    else
      render status: 404, json: {}
    end
  end

  private

  def set_short_url
    @short_url = ShortUrl.find_by_short_code(params[:id])
  end

  def short_url_params
    params.permit(:full_url)
  end

end
