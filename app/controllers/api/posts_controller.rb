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
