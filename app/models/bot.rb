class Bot

  def initialize
    @agent = Mechanize.new { |a|
        a.user_agent_alias = 'Windows IE 10'
        a.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36'
      }
  end

  def multiple_url_shortening amount, shortener_url, url
    amount.times do
      shorten_an_url shortener_url, url
    end
  end

  def shorten_an_url shortener_url, url
    page = @agent.get shortener_url

    page.form_with(id: 'new_url') do |form|
      form.field_with(name: 'url[original]').value = url
    end.submit
  end
end
