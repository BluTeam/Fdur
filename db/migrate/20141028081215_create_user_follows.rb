class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.integer :self_id
      t.integer :add_id
      t.timestamps
    end
  end
end
