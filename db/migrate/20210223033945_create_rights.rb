class CreateRights < ActiveRecord::Migration[6.0]
  def change
    create_table :rights do |t|
      t.text :content
      t.integer :point
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
