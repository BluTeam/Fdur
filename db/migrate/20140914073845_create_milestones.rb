class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name, null: false
      t.text :description
      t.text :reflection
      t.string :image
      t.integer :num
      t.string :state, null: false
      t.integer :project_id, null: false

      t.timestamps
    end

    add_index :milestones, :project_id
    add_index :milestones, :state
  end
end