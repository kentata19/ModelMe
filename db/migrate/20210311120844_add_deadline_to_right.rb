class AddDeadlineToRight < ActiveRecord::Migration[6.0]
  def change
    add_column :rights, :deadline, :integer
    add_column :rights, :due, :integer
  end
end
