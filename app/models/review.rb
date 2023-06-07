class Review < ApplicationRecord
  validates :title, :comment, :rating, presence: true

  belongs_to :booking
end
