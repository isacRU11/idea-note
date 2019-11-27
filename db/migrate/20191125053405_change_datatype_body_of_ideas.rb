class ChangeDatatypeBodyOfIdeas < ActiveRecord::Migration[5.2]
  def change
    change_column :ideas, :body, :text
  end
end
