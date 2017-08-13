require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'no errors on model' do
    let(:url)    { create(:url) }
    let(:result) { Result.new(url) }

    it 'returns the model' do
      expect(result.model).to eql url
    end

    it 'returns true for \'success?\' if action was successful' do
      expect(result.success?).to be true
    end

    it 'returns an empty array for errors if there are none' do
      expect(result.errors).to eql []
    end
  end

  context 'errors on the model' do
    let!(:good_url)  { create(:url) }

    before do
      @bad_url = Url.create(original: good_url.original)
      @result  = Result.new(@bad_url)
    end

    it 'returns the model' do
      expect(@result.model).to eql @bad_url
    end

    it 'returns the errors if there are any' do
      expect(@result.errors).to eql @bad_url.errors.full_messages
    end

    it 'returns false for success if the model is not successfully created' do
      expect(@result.success?).to be false
    end
  end
end
