class AddColumnToPz < ActiveRecord::Migration[6.0]
  def change
    add_column :pzs, :owner, :integer
  end
end
