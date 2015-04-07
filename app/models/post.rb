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
end
