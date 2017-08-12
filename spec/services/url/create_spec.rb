require 'rails_helper'

RSpec.describe Url::Create, type: :service do
  let(:original) { 'https://www.example.com' }

  context 'new url' do
    it 'creates a new url with the supplied url' do
      expect{ Url::Create.new(original).() }.to change{ Url.count }.by 1
    end

    it 'returns a result object with the new url object when one is created' do
      response = Url::Create.new(original).()

      expect(response.model.original).to eql original
    end
  end

  context 'existing url' do
    let!(:existing_url) { create(:url) }

    it 'does not create a new url if an url already exists' do
      expect{ Url::Create.new(original).() }.to_not change{ Url.count }
    end

    it 'returns the existing url object if it exists' do
      response     = Url::Create.new(original).()

      expect(response.model).to eql existing_url
    end

    it 'updates the request_count of an existing url' do
      response     = Url::Create.new(original).()

       expect(response.model.request_count).to eql 2
    end
  end
end
