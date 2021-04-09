class AddColumnToP < ActiveRecord::Migration[6.0]
  def change
    add_column :ps, :owner, :integer
  end
end
