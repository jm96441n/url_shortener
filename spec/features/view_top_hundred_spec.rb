require 'rails_helper'

RSpec.describe 'View Top Hundred', type: :feature do
  it 'displays the top 100 requested sites to be shortened' do
    visit urls_path

    expect(page.find('.url').lenght).to be 100
  end
end
