# == Schema Information
#
# Table name: user_follows
#
#  id         :integer          not null, primary key
#  self_id    :integer
#  add_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserFollow < ActiveRecord::Base
end
