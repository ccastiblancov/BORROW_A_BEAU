class AddLocationToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :locations, :string
  end
end
