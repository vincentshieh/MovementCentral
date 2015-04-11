module Api
  class LikesController < ApiController
    def comment_index
      @likes = Like.where(likable_type: 'Comment')
      render json: @likes
    end

    def create
      @like = current_user.likes.new(like_params)

      if @like.save
        render json: @like
      else
        render json: @like.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @like = Like.find(params[:id])
      @like.destroy!
      render json: {}
    end

    def post_index
      @likes = Like.where(likable_type: 'Post')
      render json: @likes
    end

    private

    def like_params
      params.require(:like).permit(:id, :user_id, :likable_type, :likable_id)
    end
  end
end
