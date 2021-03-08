class AddColumnToRight < ActiveRecord::Migration[6.0]
  def change
    add_column :rights, :image, :string
  end
end
