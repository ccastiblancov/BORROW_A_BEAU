class Profile < ApplicationRecord
  require 'geocoder'
  belongs_to :user
  has_many :reviews
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
