#encoding: utf-8
# == Schema Information
#
# Table name: milestones
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  reflection  :text
#  image       :string(255)
#  num         :integer
#  state       :string(255)      not null
#  project_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  parent_id   :integer
#  lft         :integer
#  rgt         :integer
#  depth       :integer
#
# Indexes
#
#  index_milestones_on_project_id  (project_id)
#  index_milestones_on_state       (state)
#

class Milestone < ActiveRecord::Base
  acts_as_nested_set

  include TheSortableTree::Scopes
  belongs_to :project, :foreign_key => :project_id

  before_validation :set_default_information
  after_save :set_default_activity
  #after_update :set_new_activity

  validates :name, presence: true
  # TODO: 状态改为两个
  validates :state, presence: true,
            inclusion: ['undo','doing','finished']

  def title
    self.name
  end

  private

  def set_default_information

    self.state = 'undo' if self.state.blank?

    self.image = '' if self.image.nil?

    unless self.image.match /http:\/\/[\s\S]*.(jpg|png|gif)/
      self.image = ''
    end

    #self.image = 'default' if self.image.blank?
  end

  def set_default_activity
    if self.project.activity.blank?
      self.project.create_activity project_state_flag: 0
    end
  end

  #修改置顶
  #def set_new_activity
  #  temp = self.project.activity.project_state_flag + 1
  #  self.project.activity.update project_state_flag: temp
  #end

end
