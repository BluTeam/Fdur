# == Schema Information
#
# Table name: actions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  action_time :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Action < ActiveRecord::Base
end
