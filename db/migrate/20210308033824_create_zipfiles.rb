class CreateZipfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :zipfiles do |t|

      t.timestamps
    end
  end
end
