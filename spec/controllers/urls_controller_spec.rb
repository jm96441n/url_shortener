require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  context 'POST create' do
    let(:params) {
      {
        url: {
          original: 'https://www.example.com'
        }
      }
    }

    it 'creates a new url if it does not exist' do
      expect{ post :create, params: params }.to change{ Url.count }.by 1
    end

    it 'does not create a new url if it already exists' do
      create(:url)

      expect{ post :create, params: params }.to_not change{ Url.count }
    end
  end
end
