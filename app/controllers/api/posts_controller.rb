module Api
  class PostsController < ApiController
    def create
      @post = current_user.authored_posts.new(post_params)

      if @post.save
        render json: @post
      else
        render json: @post.errors.full_messages, status: unprocessable_entity
      end
    end

    def index
      @posts = current_user.received_posts
      render json: @posts
    end

    def show
      @post = Post.includes(:author, :recipient).find(params[:id])
      render :show
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end
  end
end
