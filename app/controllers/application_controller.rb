class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  DANCE_STYLES = %w(Ballet Ballroom Contemporary Hip-hop Jazz Modern)

  private

  def current_user
    return nil unless session[:session_token]
    current_session = Session.find_by_session_token(session[:session_token])
    @current_user ||= User.find(current_session.user_id)
  end

  def friendships_of_current_user
    friendships = [ { user_id: current_user.id,
                  self: true,
                  email: current_user.email,
                  fname: current_user.fname,
                  lname: current_user.lname,
                  dance_style: current_user.dance_style,
                  gender: current_user.gender,
                  company: current_user.company,
                  profile_picture: current_user.profile_picture,
                  cover_photo: current_user.cover_photo,
                  nickname: current_user.nickname,
                  job_title: current_user.job_title,
                  school: current_user.school,
                  current_city: current_user.current_city,
                  hometown: current_user.hometown,
                  bio: current_user.bio } ]

    current_user.friendships_as_requester.each do |friendship|
      friend = User.find(friendship.requestee_id)
      friendships << { id: friendship.id,
                   user_id: friend.id,
                   accepted: friendship.accepted,
                   requester: true,
                   email: friend.email,
                   fname: friend.fname,
                   lname: friend.lname,
                   dance_style: friend.dance_style,
                   gender: friend.gender,
                   company: friend.company,
                   profile_picture: friend.profile_picture,
                   cover_photo: friend.cover_photo,
                   nickname: friend.nickname }
    end

    current_user.friendships_as_requestee.each do |friendship|
      friend = User.find(friendship.requester_id)
      friendships << { id: friendship.id,
                   user_id: friend.id,
                   accepted: friendship.accepted,
                   requester: false,
                   email: friend.email,
                   fname: friend.fname,
                   lname: friend.lname,
                   dance_style: friend.dance_style,
                   gender: friend.gender,
                   company: friend.company,
                   profile_picture: friend.profile_picture,
                   cover_photo: friend.cover_photo,
                   nickname: friend.nickname,
                   job_title: friend.job_title,
                   school: friend.school,
                   current_city: friend.current_city,
                   hometown: friend.hometown,
                   bio: friend.bio}
    end

    friend_ids = friendships.map { |friendship| friendship[:user_id] }
    remaining_users = User.all.select { |user| !friend_ids.include?(user.id) }

    remaining_users.each do |user|
      friendships << { user_id: user.id,
                       stranger: true,
                       email: user.email,
                       fname: user.fname,
                       lname: user.lname,
                       dance_style: user.dance_style,
                       gender: user.gender,
                       company: user.company,
                       profile_picture: user.profile_picture,
                       cover_photo: user.cover_photo,
                       nickname: user.nickname }
    end

    friendships
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user!(user)
    new_session_token = SecureRandom.urlsafe_base64(16)

    while Session.exists?(session_token: new_session_token)
      new_session_token = SecureRandom.urlsafe_base64(16)
    end

    new_session = user.sessions.new(session_token: new_session_token)
    new_session.save!
    session[:session_token] = new_session.session_token
  end

  def logout_user!
    current_session = Session.find_by_session_token(session[:session_token])
    current_session.destroy!
    session[:session_token] = nil
  end

  def require_logged_out!
    redirect_to root_url unless !logged_in?
  end

  def require_logged_in!
    redirect_to new_sessions_url unless logged_in?
  end
end
