class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :user, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :profile, foreign_key: true
    add_reference :reviews, :booking, foreign_key: true
  end
end
