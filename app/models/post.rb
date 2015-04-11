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

class Post < ActiveRecord::Base
  validates :author_id, :recipient_id, :content, presence: true

  belongs_to(
    :author,
    foreign_key: :author_id,
    class_name: "User"
  )
  belongs_to(
    :recipient,
    foreign_key: :recipient_id,
    class_name: "User"
  )
  has_many(
    :comments,
    foreign_key: :post_id,
    class_name: "Comment"
  )
  has_many :likes, as: :likable
end
