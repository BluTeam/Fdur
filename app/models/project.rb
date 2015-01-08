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

  after_create :create_default_milestone

  validates :state, presence: true,
            inclusion: ['open','finished']

  validates :is_public, inclusion: [true, false]
  validates :name, presence: true
  validates :forks_count, presence: true
  # TODO: 自定以validate，按用户权限来分上传限制
  validates :image, file_size: { maximum: 1.0.megabytes.to_i }

  def followed_count
    self.follows.count
  end

  def image_url type
    unless type.blank?
      type = '-' + type.to_s
      image.file.nil? ? image.url : image.url + type
    else
      image.url
    end
  end

  private

  def add_default_information
    self.forks_count = 0 if self.forks_count.blank?
    self.state = 'open' if self.state.blank?
  end

  def create_default_milestone
    if self.milestones.blank?
      self.milestones.create name: "创建新计划--#{self.name}", state: 'finished'
    end
  end


  # def file_size
  #   if image.file.size.to_f/(1000*1000) > user.upload_limit.to_f
  #     errors.add(:file, "You cannot upload a file greater than #{user.upload_limit.to_f}MB")
  #   end
  # end
end
