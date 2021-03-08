class CreateSympathies < ActiveRecord::Migration[6.0]
  def change
    create_table :sympathies do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.string :caption
      t.integer :point

      t.timestamps
    end
  end
end
