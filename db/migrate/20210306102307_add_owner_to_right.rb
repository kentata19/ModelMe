class AddOwnerToRight < ActiveRecord::Migration[6.0]
  def change
    add_column :rights, :owner, :integer
  end
end
