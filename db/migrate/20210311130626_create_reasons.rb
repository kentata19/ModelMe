class CreateReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :reasons do |t|
      t.string :content
      t.timestamps
    end
  end
end
