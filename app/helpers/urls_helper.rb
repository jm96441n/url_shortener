module UrlsHelper
  def entire_shortened_url url
    "#{request.domain}/#{url.shortened}"
  end
end
