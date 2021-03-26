class CreateRrs < ActiveRecord::Migration[6.0]
  def change
    create_table :rrs do |t|
      t.references :rejection, foreign_key: true, null: false
      t.references :reason, foreign_key: true, null: false
      t.timestamps
    end
  end
end
