class RemoveIsDeleteToIdeas < ActiveRecord::Migration[5.2]
  def change
    remove_column :ideas, :is_delete
  end
end
