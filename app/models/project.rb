#encoding: utf-8
# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  image       :string(255)
#  description :text
#  user_id     :integer          not null
#  is_public   :boolean          not null
#  state       :string(255)      not null
#  num         :integer
#  created_at  :datetime
#  updated_at  :datetime
#  forks_count :integer          default(0), not null
#
# Indexes
#
#  index_projects_on_state    (state)
#  index_projects_on_user_id  (user_id)
#

class Project < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :milestones, dependent: :destroy
  has_one :activity, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_validation :add_default_information

  after_save :create_default_milestone

  validates :state, presence: true,
            inclusion: ['open','finished']

  validates :is_public, inclusion: [true, false]
  validates :name, presence: true
  validates :forks_count, presence: true

  def fork_from o_project, user_id

    self.name = o_project.name
    self.image = o_project.image
    self.description = o_project.description
    self.is_public = false
    self.user_id = user_id
    self.save!

    o_project.milestones.each do |m|
      unless m == o_project.milestones.order(updated_at: :desc).last
        self.milestones.create name: m.name, state: 'undo'
      end
    end

    self.milestones.order(updated_at: :desc).last.update name: "拷贝了计划——#{o_project.name}", state: 'finished'

  end


  def followed_count
    self.follows.count
  end

  private

  def add_default_information
    self.forks_count = 0 if self.forks_count.blank?
    self.state = 'open' if self.state.blank?
  end

  def create_default_milestone
    if self.milestones.blank?
      self.milestones.create name: "创建了新计划——#{self.name}", state: 'finished'
    end
  end


end
