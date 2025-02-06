class AddProgressToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :progress, :integer
  end
end
