class AddRightToReply < ActiveRecord::Migration[6.0]
  def change
    add_reference :replies, :right, foreign_key: true
  end
end
