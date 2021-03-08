class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :profile_photo, :string
    add_column :users, :info, :text
  end
end
