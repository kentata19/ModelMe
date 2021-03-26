class AddStatusToRight < ActiveRecord::Migration[6.0]
  def change
    add_column :rights, :status, :integer, default: 0
  end
end
