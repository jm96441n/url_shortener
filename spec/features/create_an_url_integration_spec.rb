require 'rails_helper'

RSpec.describe 'Creating a new shortened url', type: :feature do

  it 'takes you to the page to create a new shortened url' do
    visit new_url_path

    expect(page).to have_content('Enter Your Url Below')
    expect(page).to have_css('#url_original')
  end

  it 'allows you to create a new shortened url' do
    visit new_url_path

    fill_in 'url[original]', with: 'https://www.example.com'
    expect{ click_button 'Shorten Your Url!' }.to change{ Url.count }.by 1

  end

  it 'allows you to enter an url that exists but does not create a new url object' do

    create(:url)
    visit new_url_path

    fill_in 'url[original]', with: 'https://www.example.com'
    expect{ click_button 'Shorten Your Url!' }.to_not change{ Url.count }
  end

  it 'takes you to the show page for your new shortened url' do
    visit new_url_path

    fill_in 'url[original]', with: 'https://www.banana.com'
    click_button 'Shorten Your Url!'

    url = Url.last

    expect(page.find('#shortened_url')).to have_content("example.com/#{url.shortened}")
  end
end
