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

require 'test_helper'

class UserFollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
