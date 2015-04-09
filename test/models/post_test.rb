# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author_id    :integer          not null
#  recipient_id :integer          not null
#  content      :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  picture      :string
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
