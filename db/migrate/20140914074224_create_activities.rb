class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :project_id, null: false
      t.integer :project_state_flag
      t.integer :commits_count

      t.timestamps
    end

    add_index :activities, :project_id
  end
end
