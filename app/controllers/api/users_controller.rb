module Api
  class UsersController < ApiController
    def search
      if params[:query].present?
        @users = User.where("fname ~ :query or lname ~ :query or
                             dance_style ~ :query or company ~ :query",
                             { query: params[:query] })
      else
        @users = User.none
      end
      render json: @users
    end
  end
end
