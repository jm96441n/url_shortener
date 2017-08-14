class Bot
  def initialize
    @agent = Mechanize.new { |a|
        a.user_agent_alias = 'Windows IE 10'
        a.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36'
      }
  end

  def multiple_url_shortening amount, url
    amount.times do
      shorten_an_url url
    end
  end

  def shorten_an_url url
    page = @agent.get 'https://trohs.herokuapp.com/'

    page.form_with(id: 'new_url') do |form|
      form.field_with(name: 'url[original]').value = url
    end.submit
  end

  def popuplate
    puts "running ....."

    self.multiple_url_shortening 200, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'

    self.multiple_url_shortening 90, 'https://www.youtube.com/watch?v=1dCNKpAFob0'

    self.multiple_url_shortening 90, 'https://www.google.com'

    puts "still running ....."

    self.multiple_url_shortening 90, 'http://www.moosti.com/'

    self.multiple_url_shortening 90, 'http://ohshitgit.com/'

    self.multiple_url_shortening 90, 'https://www.quora.com/What-are-the-greatest-programming-tips-and-tricks-you-have-learned-on-your-own-by-years-of-coding/answer/Jerome-Terry-1'

    puts "still running ....."

    self.multiple_url_shortening 90, 'https://www.villagevoice.com/2014/10/08/ask-andrew-w-k-pizza-is-healthy/'

    self.multiple_url_shortening 90, 'http://www.windows93.net/'

    self.multiple_url_shortening 90, 'https://projecteuler.net/'

    self.multiple_url_shortening 90, 'http://spaceengine.org/'

    puts "still running ..... wow this takes a while doesn't it"

    i = 90

    until i < 1
      self.multiple_url_shortening i, "http://www.example.com/#{i}"
      i -= 1
    end
    puts "aaaaaand done!!"
  end
end

b = Bot.new
b.populate

