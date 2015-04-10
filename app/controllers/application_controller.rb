class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  DANCE_STYLES = %w(Ballet Ballroom Contemporary Hip-hop)

  private

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def friends_of_current_user
    friends = [ { user_id: current_user.id,
                  requester: true,
                  fname: current_user.fname,
                  lname: current_user.lname } ]

    current_user.friends_as_requester.each do |friendship|
      friend = User.find(friendship.requestee_id)
      friends << { id: friendship.id,
                   user_id: friend.id,
                   accepted: friendship.accepted,
                   requester: true,
                   fname: friend.fname,
                   lname: friend.lname }
    end

    current_user.friends_as_requestee.each do |friendship|
      friend = User.find(friendship.requester_id)
      friends << { id: friendship.id,
                   user_id: friend.id,
                   accepted: friendship.accepted,
                   requester: false,
                   fname: friend.fname,
                   lname: friend.lname }
    end

    friends
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
