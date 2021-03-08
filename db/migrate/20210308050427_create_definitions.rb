class CreateDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :definitions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.timestamps
    end
  end
end
