class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :users, foreign_key: true
    add_reference :bookings, :users, foreign_key: true
    add_reference :bookings, :profiles, foreign_key: true
    add_reference :reviews, :bookings, foreign_key: true
  end
end
