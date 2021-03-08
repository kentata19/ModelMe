class AddColumnToReply < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :caption, :text
  end
end
