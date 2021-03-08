class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :reply_id
      t.integer :right_id
      t.integer :support_id
      t.string :action
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
