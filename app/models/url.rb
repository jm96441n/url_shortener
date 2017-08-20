# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  original      :string           not null
#  shortened     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  request_count :integer          default(1)
#

class Url < ApplicationRecord
  ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a + ('2'..'9').to_a - ['O', 'I']
  after_create :create_shortened_url

  validates :original, presence: true, uniqueness: true

  # Generates a base58 string based on the unique primary key id of the URL object after creation. Base58 was chosen so that the keys will be URL friendly (leaving out letters/numbers that can be easily confused such as 0 and 'O')
  def create_shortened_url
    key = self.id - 1

    if key == 0
      shortened = ALPHABET[0]
    else
      shortened  = ''
      baseLength = ALPHABET.length

      until key < 1
        place     = key % baseLength
        shortened += ALPHABET[place]

        key /= baseLength
      end
    end
    self.save
  end
end
