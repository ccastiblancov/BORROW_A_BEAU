class MoveUserFieldsToProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :age, :integer
    remove_column :users, :description, :text
    remove_column :users, :gender, :string
    remove_column :users, :location, :string
    remove_column :users, :interest, :text

    add_column :profiles, :age, :integer
    add_column :profiles, :description, :text
    add_column :profiles, :gender, :string
    add_column :profiles, :location, :string
    add_column :profiles, :interest, :text
  end
end
