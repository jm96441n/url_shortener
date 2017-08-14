module UrlsHelper
  def entire_shortened_url url
    "#{request.base_url}/#{url.shortened}"
  end
end
