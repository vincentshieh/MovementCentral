class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  DANCE_STYLES = %w(Ballet Ballroom Contemporary Hip-hop Jazz Modern)

  private

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def friendships_of_current_user
    friendships = [ { user_id: current_user.id,
                  self: true,
                  fname: current_user.fname,
                  lname: current_user.lname,
                  dance_style: current_user.dance_style,
                  gender: current_user.gender,
                  company: current_user.company,
                  profile_picture: current_user.profile_picture,
                  cover_photo: current_user.cover_photo,
                  nickname: current_user.nickname } ]

    current_user.friendships_as_requester.each do |friendship|
      friend = User.find(friendship.requestee_id)
      friendships << { id: friendship.id,
                   user_id: friend.id,
                   accepted: friendship.accepted,
                   requester: true,
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
                   fname: friend.fname,
                   lname: friend.lname,
                   dance_style: friend.dance_style,
                   gender: friend.gender,
                   company: friend.company,
                   profile_picture: friend.profile_picture,
                   cover_photo: friend.cover_photo,
                   nickname: friend.nickname }
    end

    friend_ids = friendships.map { |friendship| friendship[:user_id] }
    remaining_users = User.all.select { |user| !friend_ids.include?(user.id) }

    remaining_users.each do |user|
      friendships << { user_id: user.id,
                       stranger: true,
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
    session[:session_token] = user.reset_session_token!
  end

  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_out!
    redirect_to root_url unless !logged_in?
  end

  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
