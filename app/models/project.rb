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
#
# Indexes
#
#  index_projects_on_state    (state)
#  index_projects_on_user_id  (user_id)
#

class Project < ActiveRecord::Base
  belongs_to :user
  mount_uploader :iamge, ImageUploader

  before_validation :add_default_information

  validates :state, presence: true,
            inclusion: ['open','finished']

  validates :is_public, inclusion: [true, false]
  validates :name, presence: true
  #validates :forks_count, presence: true

  def add_default_information

    #self.forks_count = 0 if self.forks_count.blank?

    self.state = 'open' if self.state.blank?

  end

end
