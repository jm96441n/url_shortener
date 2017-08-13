require 'rails_helper'

RSpec.describe 'Creating a new shortened url', type: :feature do

  it 'takes you to the page to create a new shortened url', js: true do
    visit root_path

    expect(page).to have_content('Enter Your Url Below')
    expect(page).to have_css('#url_original')
  end

  it 'allows you to create a new shortened url', js: true do
    visit root_path

    fill_in 'url[original]', with: 'https://www.example.com'
    expect{
      click_button 'Shorten My Url!'
      sleep(5)
      }.to change{ Url.count }.by 1

  end

  it 'allows you to enter an url that exists but does not create a new url object', js: true do

    url = create(:url)
    visit root_path

    fill_in 'url[original]', with: url.original
    expect{ click_button 'Shorten My Url!' }.to_not change{ Url.count }
  end

  # it 'displays your new shortened url', js: true do
  #   visit root_path

  #   save_and_open_page

  #   fill_in 'url[original]', with: 'https://www.banana.com'
  #   click_button 'Shorten My Url!'

  #   url = Url.where(original: 'https://www.banana.com').first

  #   expect(page.find('#shortened-container')).to have_content(url.shortened)
  # end
end
