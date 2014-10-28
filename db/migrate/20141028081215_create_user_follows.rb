class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.string :user_self_id
      t.string :user_add_id
      t.timestamps
    end
  end
end
