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

class Url < ApplicationRecord
  before_validation :create_shortened_url

  validates :original, :shortened, presence: true, uniqueness: true

  def create_shortened_url
    if self.shortened.nil?
      shortened = SecureRandom.base58(6)

      until Url.where(shortened: shortened).first.nil?
        shortened = SecureRandom.base58(6)
      end

      self.shortened = shortened
    end
  end
end
