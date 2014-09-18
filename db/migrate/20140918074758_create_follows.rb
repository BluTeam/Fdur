class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :project_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :follows, :project_id
    add_index :follows, :user_id

  end
end
