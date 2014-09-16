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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
