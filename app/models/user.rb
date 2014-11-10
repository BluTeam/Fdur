# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  upload_limit           :integer          default(1)
#  avatar                 :string(255)
#  name                   :string(255)
#  sex                    :string(255)
#  birthday               :date
#  introduction           :text
#  address                :string(255)
#  qq                     :string(255)
#  telephone              :string(255)
#  profession             :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  before_validation :set_default_sex

  SEX_TYPES=["保密","男","女"]
  validates :sex, :inclusion => SEX_TYPES
  has_many :projects, dependent: :destroy
  has_many :follows, dependent: :destroy
  
  has_and_belongs_to_many :friends,
    :class_name => "User",
    :join_table => "user_follows",
    :association_foreign_key => "add_id",
    :foreign_key => "self_id"

  def not_nil_name
    self.name || self.email
  end

  def add_user user 
    if not self.friends.include?(user)
      self.friends << user 
      return "follow"
    else
      self.friends.delete user
      return "unfollow"
    end
  end

  def fork_project o_project
    forked = nil
    self.transaction do
      forked = self.projects.build name: o_project.name, description: o_project.description, is_public: :false
      forked.image = o_project.image
      o_project.milestones.each do |m|
        f_m = forked.milestones.new name: m.name, description: m.description, state: 'undo'
        f_m.image = m.image
      end
      forked.save
    end
    forked
  end

  def followed? project
    Follow.ransack({user_id_eq: self.id, porject_id_eq: project.id}).result.first
  end

  def is_friends user
    self.friends.include?(user)
  end

  def myfriends 
    self.friends
  end
  
  private

  def set_default_sex
    self.sex = "保密" if self.sex.nil?
  end

end
