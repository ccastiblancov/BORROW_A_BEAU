class AddBookingsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :booking, foreign_key: true
  end
end
