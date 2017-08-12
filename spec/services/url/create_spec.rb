require 'rails_helper'

RSpec.describe Url::Create, type: :service do
  let(:original) { 'https://www.example.com' }

  it 'creates a new url with the supplied url' do
    expect{ Url::Create.new(original).() }.to change{ Url.count }.by 1
  end

  it 'returns a result object with the new url object when one is created' do
    response = Url::Create.new(original).()

    expect(response.model.original).to eql original
  end

  it 'does not create a new url if an url already exists' do
    existing_url = create(:url)

    expect{ Url::Create.new(original).() }.to_not change{ Url.count }
  end

  it 'returns the existing url object if it exists' do
    existing_url = create(:url)
    response     = Url::Create.new(original).()

    expect(response.model).to eql existing_url
  end
end
