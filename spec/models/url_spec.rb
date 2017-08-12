# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  original      :string           not null
#  shortened     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  request_count :integer          default(1)
#

require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { create(:url) }

  it 'creates a shortened url when created' do
    expect(url.shortened).to_not be nil
  end

  it 'creates a shortened url length 6' do
    expect(url.shortened.length).to be 6
  end
end
