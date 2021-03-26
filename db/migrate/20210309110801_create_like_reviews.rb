class CreateLikeReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :like_reviews do |t|
      t.references :review, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
