class RemoveStringFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :string, :string
  end
end
