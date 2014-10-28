# == Schema Information
#
# Table name: user_follows
#
#  id           :integer          not null, primary key
#  user_self_id :string(255)
#  user_add_id  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class UserFollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
