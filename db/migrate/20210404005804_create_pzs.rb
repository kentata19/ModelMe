class CreatePzs < ActiveRecord::Migration[6.0]
  def change
    create_table :pzs do |t|
      t.references :user, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.references :zipfile, foreign_key: true, null: false
      t.integer :point
      t.timestamps
    end
  end
end
