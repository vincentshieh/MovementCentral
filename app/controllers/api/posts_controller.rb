module Api
  class PostsController < ApiController
    def create
      @post = current_user.authored_posts.new(post_params)

      if @post.save
        render json: @post
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end

    def feed
      @posts = current_user.received_posts.includes(:comments)
      accepted_friends = friends_of_current_user.select { |friend| friend[:accepted] }
      accepted_friends.each do |friend|
        friend_user = User.find(friend[:user_id])
        friend_user.authored_posts.each do |post|
          @posts << post unless @posts.include?(post)
        end
        friend_user.received_posts.each do |post|
          @posts << post unless @posts.include?(post)
        end
      end
      render :index
    end

    def index
      user = User.find(params[:user_id])
      @posts = user.received_posts.includes(:comments)
      render :index
    end

    private

    def post_params
      params.require(:post).permit(:content, :picture, :recipient_id)
    end
  end
end
