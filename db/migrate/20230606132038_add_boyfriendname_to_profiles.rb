class AddBoyfriendnameToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :boyfriendname, :string
  end
end
