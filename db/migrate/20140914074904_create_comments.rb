class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :project_id, null: false
      t.integer :user_id, null: false
      t.text :content

      t.timestamps
    end

    add_index :comments, :project_id
    add_index :comments, :user_id
  end
end
