class RemoveColumnFromReply < ActiveRecord::Migration[6.0]
  def change
    remove_column :replies, :right_id
  end
end
