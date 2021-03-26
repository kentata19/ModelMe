class CreateReplyReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_reviews do |t|
      t.text :comment, null: false
      t.references :review, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
