require 'rails_helper'

RSpec.describe 'View Top Hundred', type: :feature do
  before do
    create_list(:url, 100, request_count: 2)
    create(:url, original: 'www.thisIsAnExtraOne.com')
  end

  it 'displays the top 100 requested sites to be shortened' do
    visit urls_path

    expect(page.find_all('.url').length).to be 100
  end
end
