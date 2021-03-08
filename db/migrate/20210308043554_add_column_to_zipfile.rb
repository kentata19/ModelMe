class AddColumnToZipfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :zipfiles, :user, foreign_key: true
    add_reference :zipfiles, :right, foreign_key: true
    
  end
end
