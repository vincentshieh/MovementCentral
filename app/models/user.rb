# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  fname           :string           not null
#  lname           :string           not null
#  dance_style     :string           not null
#  gender          :string           not null
#  company         :string           not null
#  profile_picture :string
#  cover_photo     :string
#  nickname        :string
#  job_title       :string
#  school          :string
#  current_city    :string
#  hometown        :string
#  bio             :text
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, :fname, :lname, :dance_style,
            :gender, :company, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many(
    :authored_posts,
    foreign_key: :author_id,
    class_name: "Post"
  )
  has_many(
    :received_posts,
    foreign_key: :recipient_id,
    class_name: "Post"
  )
  has_many(
    :authored_comments,
    foreign_key: :author_id,
    class_name: "Comment"
  )
  has_many(
    :friendships_as_requester,
    foreign_key: :requester_id,
    class_name: "Friendship"
  )
  has_many(
    :friendships_as_requestee,
    foreign_key: :requestee_id,
    class_name: "Friendship"
  )
  has_many :likes
  has_many :sessions

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
