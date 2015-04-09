class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  DANCE_STYLES = %w(Ballet Ballroom Hip-hop)

  private

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def friends_of_current_user
    friends = []

    current_user.friends_as_requester.each do |friendship|
      friends << { user_id: friendship.requestee_id, accepted: friendship.accepted }
    end

    current_user.friends_as_requestee.each do |friendship|
      friends << { user_id: friendship.requester_id, accepted: friendship.accepted }
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
