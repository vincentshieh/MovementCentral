module Api
  class CommentsController < ApiController
    def create
      @comment = current_user.authored_comments.new(comment_params)

      if @comment.save
        render json: @comment
      else
        render json: @comment.errors.full_messages, status: :unprocessable_entity
      end
    end

    def index
      post = Post.find(params[:post_id])
      @comments = post.comments
      render json: @comments
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
  end
end
