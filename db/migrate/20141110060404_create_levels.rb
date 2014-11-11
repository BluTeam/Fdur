class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      
      t.integer :rank 
      t.string :name
      t.integer :exp
      t.timestamps
    end
  end
end
