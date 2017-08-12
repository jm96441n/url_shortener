require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  context 'POST create' do
    let(:params) {
      {
        original: 'https://www.google.com'
      }
    }

    it 'creates a new url' do
      expect{ post :create, params: params }.to change{ Url.count }.by 1
    end
  end
end
