class AddForksCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :forks_count, :integer, null: false, default: 0
  end
end
