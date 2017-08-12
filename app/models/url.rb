# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  original   :string           not null
#  shortened  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Url < ApplicationRecord
  before_validation :create_shortened_url

  validates :original, :shortened, presence: true, uniqueness: true

  def create_shortened_url
    self.shortened = SecureRandom.base58(6)
  end
end
