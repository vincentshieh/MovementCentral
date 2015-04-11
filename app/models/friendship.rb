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

class Friendship < ActiveRecord::Base
  validates :requester_id, :requestee_id, presence: true
  validates :accepted, inclusion: { in: [true, false] }

  belongs_to(
    :requester,
    foreign_key: :requester_id,
    class_name: "User"
  )
  belongs_to(
    :requestee,
    foreign_key: :requestee_id,
    class_name: "User"
  )
end
