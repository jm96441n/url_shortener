namespace :bot do
  desc "Populates production database"
  task populate: :environment do
    puts "running ....."
    bot = Bot.new

    bot.multiple_url_shortening 200, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'

     bot.multiple_url_shortening 90, 'https://www.youtube.com/watch?v=1dCNKpAFob0'

     bot.multiple_url_shortening 90, 'https://www.google.com'

     puts "still running ....."

     bot.multiple_url_shortening 90, 'http://www.moosti.com/'

     bot.multiple_url_shortening 90, 'http://ohshitgit.com/'

     bot.multiple_url_shortening 90, 'https://www.quora.com/What-are-the-greatest-programming-tips-and-tricks-you-have-learned-on-your-own-by-years-of-coding/answer/Jerome-Terry-1'

     puts "still running ....."

     bot.multiple_url_shortening 90, 'https://www.villagevoice.com/2014/10/08/ask-andrew-w-k-pizza-is-healthy/'

     bot.multiple_url_shortening 90, 'http://www.windows93.net/'

     bot.multiple_url_shortening 90, 'https://projecteuler.net/'

     bot.multiple_url_shortening 90, 'http://spaceengine.org/'

     puts "still running ..... wow this takes a while doesn't it"

     i = 90

     until i < 1
      bot.multiple_url_shortening i, "http://www.example.com/#{i}"
      i -= 1
     end
     puts "aaaaaand done!!"
  end
end