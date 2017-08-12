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

  context 'GET show' do
    let!(:url) { create(:url) }
    let(:params) {
      {
        id: url.id
      }
    }

    it 'returns the requested url' do
      get :show, params: params

      expect(response).to be url
    end
  end

  context 'GET index' do
  end
end
