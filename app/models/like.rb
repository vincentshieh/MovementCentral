# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  likable_type :string           not null
#  likable_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ActiveRecord::Base
  validates :user_id, :likable_type, :likable_id, presence: true

  belongs_to :likable, polymorphic: true
end
