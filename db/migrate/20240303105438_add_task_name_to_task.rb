class AddTaskNameToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :task_name, :string
    add_column :tasks, :string, :string
  end
end
