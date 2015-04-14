class UsersController < ApplicationController
  before_action :require_logged_out!, only: [:create, :new]

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to "/#/users/#{current_user.id}"
    else
      flash.now[:errors] = @user.errors.full_messages
      @dance_styles = DANCE_STYLES
      render :new
    end
  end

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    @dance_styles = DANCE_STYLES
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname,
                                 :dance_style, :gender, :company, :nickname)
  end
end
