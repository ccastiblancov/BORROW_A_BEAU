class AddProfileIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :profile, foreign_key: true
  end
end
