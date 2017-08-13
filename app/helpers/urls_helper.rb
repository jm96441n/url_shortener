module UrlsHelper
  def entire_shortened_url url
    "#{request.base_url}/#{url.shortened}"
  end

  def format_url url
    if url[0..3].downcase != 'http'
      full_url = 'http://' + url
    else
      full_url = url
    end
    full_url
  end
end
