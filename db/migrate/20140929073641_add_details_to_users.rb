class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :avatar, :string
  	add_column :users, :name, :string
  	add_column :users, :sex, :string
  	add_column :users, :birthday, :date
  	add_column :users, :introduction, :text
  	add_column :users, :address, :string
  	add_column :users, :qq, :string
  	add_column :users, :telephone, :string
  	add_column :users, :profession, :string
  end
end