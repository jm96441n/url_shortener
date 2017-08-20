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
  validates :original, presence: true, uniqueness: true
end
