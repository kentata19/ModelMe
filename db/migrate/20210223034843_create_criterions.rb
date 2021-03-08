class CreateCriterions < ActiveRecord::Migration[6.0]
  def change
    create_table :criterions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :right, foreign_key: true, null: false
      t.integer :sp
      t.timestamps
    end
  end
end
