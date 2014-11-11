# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  rank       :integer
#  name       :string(255)
#  exp        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Level < ActiveRecord::Base
end
