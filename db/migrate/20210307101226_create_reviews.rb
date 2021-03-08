class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.string :caption
      t.string :image
      t.timestamps
    end
  end
end
