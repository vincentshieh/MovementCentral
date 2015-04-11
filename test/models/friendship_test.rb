# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  requester_id :integer          not null
#  requestee_id :integer          not null
#  accepted     :boolean          default(FALSE), not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
