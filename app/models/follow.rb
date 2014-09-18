# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_follows_on_project_id  (project_id)
#  index_follows_on_user_id     (user_id)
#

class Follow < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :project_id, presence: true
  validates :user_id, presence: true
end
