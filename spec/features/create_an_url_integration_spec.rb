require 'spec_helper'

RSpec.describe 'Creating a new shortened url' do

  it 'takes you to the page to create a new shortened url' do
    visit new_url_path

    expect(page).to have_content('Enter Your Url Below')
    expect(page).to have_css('#url_original')
  end

  it 'allows you to create a new shortened url' do

  end

  it 'allows you to enter an url that exists' do

  end

  it 'takes you to the show page for your new shortened url' do

  end
end
