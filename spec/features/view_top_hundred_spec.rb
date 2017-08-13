require 'rails_helper'

RSpec.describe 'View Top Hundred', type: :feature do
  before do
    i = 0
    100.times do
      url = 'https://example.com/' + i.to_s
      2.times do
        Url::Create.new(url).()
      end
      i += 1
    end
    create(:url, original: 'www.thisIsAnExtraOne.com')
  end

  it 'displays the top 100 requested sites to be shortened' do
    visit urls_path

    expect(page.find_all('.url').length).to be 100
  end
end
