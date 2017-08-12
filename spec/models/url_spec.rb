require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { Url.create(original: 'https://www.example.com') }

  it 'creates a shortened url when created' do
    expect(url.shortened).to_not be nil
  end

  it 'creates a shortened url length 6' do
    expect(url.shortened.length).to be 6
  end
end
