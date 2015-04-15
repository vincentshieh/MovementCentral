module Api
  class FriendshipsController < ApiController
    def create
      @friendship = current_user.friendships_as_requester.new(friendship_params)

      if @friendship.save
        render json: @friendship
      else
        render json: @friendship.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @friendship = Friendship.find(params[:id])
      @friendship.destroy!
      render json: {}
    end

    def friends
      user = User.find(params[:user_id])
      friendships = []
      
      user.friendships_as_requester.each do |friendship|
        friend = User.find(friendship.requestee_id)
        if friendship.accepted
          friendships << { id: friendship.id,
                       user_id: friend.id,
                       accepted: friendship.accepted,
                       fname: friend.fname,
                       lname: friend.lname,
                       dance_style: friend.dance_style,
                       gender: friend.gender,
                       company: friend.company,
                       profile_picture: friend.profile_picture,
                       cover_photo: friend.cover_photo,
                       nickname: friend.nickname }
        end
      end

      user.friendships_as_requestee.each do |friendship|
        friend = User.find(friendship.requester_id)
        if friendship.accepted
          friendships << { id: friendship.id,
                       user_id: friend.id,
                       accepted: friendship.accepted,
                       fname: friend.fname,
                       lname: friend.lname,
                       dance_style: friend.dance_style,
                       gender: friend.gender,
                       company: friend.company,
                       profile_picture: friend.profile_picture,
                       cover_photo: friend.cover_photo,
                       nickname: friend.nickname }
        end
      end

      render json: friendships
    end

    def index
      render json: friendships_of_current_user
    end

    def update
      @friendship = current_user.friendships_as_requestee.find(friendship_params[:id])
      @friendship.update_attributes(accepted: friendship_params[:accepted])
      render json: {}
    end

    private

    def friendship_params
      params.require(:friendship).permit(:id, :accepted, :requestee_id, :requester_id)
    end
  end
end
