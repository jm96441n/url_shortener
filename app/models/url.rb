class Url < ApplicationRecord
  before_validation :create_shortened_url

  validate :original, :shortened

  def create_shortened_url
    self.shortened = SecureRandom.base58(6)
  end
end
