# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  user_id    :integer          not null
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  validates :project_id, presence: true
  validates :user_id, presence: true
  validates :content, length: { maximum: 120 }
end
