class CreatePs < ActiveRecord::Migration[6.0]
  def change
    create_table :ps do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.references :support, foreign_key: true, null: false
      t.integer :point
      t.timestamps
    end
  end
end
