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
      @posts = @posts.concat(current_user.authored_posts.includes(:comments))
      accepted_friendships = friendships_of_current_user.select do |friendship|
        friendship[:accepted]
      end
      accepted_friendships.each do |friendship|
        friend_user = User.find(friendship[:user_id])
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

    def like
      post = Post.find(params[:id])
      post.likes.new(user_id: current_user.id).save
      render json: {}
    end

    def unlike
      post = Post.find(params[:id])
      post.likes.find_by_user_id(current_user.id).destroy
      render json: {}
    end

    private

    def post_params
      params.require(:post).permit(:content, :picture, :recipient_id)
    end
  end
end
