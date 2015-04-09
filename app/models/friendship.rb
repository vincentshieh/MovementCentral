# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  requester_id :integer          not null
#  requestee_id :integer          not null
#  accepted     :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Friendship < ActiveRecord::Base
  validates :requester_id, :requestee_id, :accepted, presence: true

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
