class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.datetime :action_time
      t.timestamps
    end
  end
end
