class Review < ApplicationRecord
  validates :comment, :rating, presence: true

  belongs_to :booking
  belongs_to :profile
end
