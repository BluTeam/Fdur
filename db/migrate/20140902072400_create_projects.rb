class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :image
      t.text :description
      t.integer :user_id , null: false
      t.boolean  :is_public, null: false
      t.string :state, null: false
      t.integer :num

      t.timestamps
    end

    add_index :projects, :user_id
    add_index :projects, :state
  end
end
