class AddColumnUploadLimitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upload_limit, :integer, :default => 1
  end
end
