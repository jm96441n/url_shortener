class Url < ApplicationRecord
  before_validation :create_shortened_url

  validates :original, :shortened, presence: true, uniqueness: true

  def create_shortened_url
    self.shortened = SecureRandom.base58(6)
  end
end
