class CreateRejections < ActiveRecord::Migration[6.0]
  def change
    create_table :rejections do |t|
      t.references :right, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
