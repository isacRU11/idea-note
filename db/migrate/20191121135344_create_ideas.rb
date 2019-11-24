class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.string :subject
      t.string :body
      t.boolean :is_delete, defalt: false

      t.timestamps
    end
  end
end
