class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)

        if @comment.valid?
            @comment.save
            render json: @post
        else
            render json: { error: "Comment could not be created, please try again." }
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
