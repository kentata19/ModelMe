class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.integer :point 
      t.timestamps
    end
  end
end
