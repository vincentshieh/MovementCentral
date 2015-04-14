module Api
  class UsersController < ApiController
    def search
      if params[:query].present?
        @users = User.where("fname ~ :query or lname ~ :query or
                             dance_style ~ :query or company ~ :query or
                             fname ~ :cap_query or lname ~ :cap_query or
                             dance_style ~ :cap_query or company ~ :cap_query",
                             { query: params[:query],
                               cap_query: params[:query].capitalize })
      else
        @users = User.none
      end
      render json: @users
    end
  end
end
