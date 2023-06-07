class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :user

  has_many :reviews
end
