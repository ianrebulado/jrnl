class AddUserIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :user_id, :integer
  end
end
