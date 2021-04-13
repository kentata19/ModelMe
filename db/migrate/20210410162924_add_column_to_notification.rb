class AddColumnToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :zipfile_id, :integer
  end
end
