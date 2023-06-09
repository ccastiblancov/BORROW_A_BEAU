class RemoveLocationFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :locations, :string
  end
end
