module Api
  class FriendshipsController < ApiController
    def create
      @friendship = current_user.friends_as_requester.new(friendship_params)

      if @friendship.save
        render json: @friendship
      else
        render json: @friendship.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @friendship = current_user.friends_as_requester.find_by(requestee_id: params[:user_id])
      if !@friendship
        @friendship = current_user.friends_as_requestee.find_by(requester_id: params[:user_id])
      end
      @friendship.destroy!
      render json: {}
    end

    def index
      render json: friends_of_current_user
    end

    def update
      @friendship = current_user.friends_as_requestee.find(friendship_params[:id])
      @friendship.update_attributes(accepted: friendship_params[:accepted])
      render json: {}
    end

    private

    def friendship_params
      params.require(:friendship).permit(:id, :accepted, :requestee_id, :requester_id)
    end
  end
end
