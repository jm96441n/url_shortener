require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'no errors on model' do
    let(:url)    { create(:url) }
    let(:result) { Result}
  end
end
