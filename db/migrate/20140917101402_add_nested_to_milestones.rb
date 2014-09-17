class AddNestedToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :parent_id, :integer
    add_column :milestones, :lft      , :integer
    add_column :milestones, :rgt      , :integer
    add_column :milestones, :depth    , :integer

    Milestone.rebuild!
  end
end
